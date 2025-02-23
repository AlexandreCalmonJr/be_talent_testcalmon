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
      fontFamily: 'Helvetica Neue',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.22, // line-height / font-size = 19.54 / 16
      letterSpacing: 0,
      color: Colors.black87);

  TextStyle get _contentStyle => const TextStyle(
      fontFamily: 'Helvetica Neue',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.22, // line-height / font-size = 19.54 / 16
      letterSpacing: 0,
      color: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: const Color.fromARGB(255, 248, 245, 245), width: 1),
      ),
      elevation: 5,
      child: Column(
        children: [
          // Cabeçalho da Tabela
          Container(
            padding: const EdgeInsets.only(top: 14, left: 16, right: 16, bottom: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFEDEFFB),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: Text("Foto", style: _headerStyle)),
                Expanded(flex: 3, child: Text("Nome", style: _headerStyle)),
                const Icon(Icons.circle, color: Colors.black54),
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
                        title: Text(user.name, style: _contentStyle),
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
                              Text("Cargo: ${user.job}", style: _contentStyle),
                              Text("Data de Admissão: $formattedDate", style: _contentStyle),
                              Text("Telefone: ${user.phone}", style: _contentStyle),
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