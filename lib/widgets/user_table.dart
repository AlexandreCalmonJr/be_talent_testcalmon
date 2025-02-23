import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/user_model.dart';

class UserTable extends StatefulWidget {
  final List<UserModel> users;

  const UserTable({super.key, required this.users});

  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  Set<String> expandedUsers = {}; // IDs dos usuários expandidos

  // Alternar expansão de detalhes
  void _toggleExpand(String userId) {
    setState(() {
      if (expandedUsers.contains(userId)) {
        expandedUsers.remove(userId);
      } else {
        expandedUsers.add(userId);
      }
    });
  }

  TextStyle get _headerStyle => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Column(
        children: [
          // Cabeçalho da Tabela
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: Text("Foto", style: _headerStyle)),
                Expanded(flex: 3, child: Text("Nome", style: _headerStyle)),
                const Icon(Icons.more_vert, color: Colors.black54),
              ],
            ),
          ),

          // Lista de Usuários
          if (widget.users.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Nenhum usuário encontrado",
                  style: TextStyle(fontSize: 16)),
            )
          else
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.separated(
                itemCount: widget.users.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1, color: Colors.black26),
                itemBuilder: (context, index) {
                  UserModel user = widget.users[index];
                  bool isExpanded = expandedUsers.contains(user.id);

                  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
                  final String formattedDate =
                      dateFormat.format(user.admissionDate);

                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.image),
                        ),
                        title: Text(user.name,
                            style: const TextStyle(fontSize: 16)),
                        trailing: IconButton(
                          icon: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: const Color.fromARGB(255, 78, 69, 100),
                          ),
                          onPressed: () => _toggleExpand(user.id),
                        ),
                      ),

                      // Detalhes do usuário (expandidos ao clicar)
                      if (isExpanded)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Cargo: ${user.job}",
                                  style: const TextStyle(fontSize: 16)),
                              Text("Data de Admissão: $formattedDate",
                                  style: const TextStyle(fontSize: 16)),
                             Text("Telefone: ${user.phone}", style: const TextStyle(fontSize: 16)),                              
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
