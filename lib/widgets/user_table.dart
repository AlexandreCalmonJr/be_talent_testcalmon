import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserTable extends StatefulWidget {
  final List<UserModel> users;

  const UserTable({super.key, required this.users});

  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  Set<String> expandedUsers = {}; // Para armazenar os IDs dos usuários que estão expandidos

  // Função para alternar o estado de expansão
  void _toggleExpand(String userId) {
    setState(() {
      if (expandedUsers.contains(userId)) {
        expandedUsers.remove(userId); // Se estiver expandido, fecha
      } else {
        expandedUsers.add(userId); // Se não estiver expandido, abre
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          // Cabeçalho da Tabela com fundo cinza
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            color: Colors.grey.shade300, // Cor de fundo cinza
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Foto", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Nome", style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.circle, size: 18), // Alterado para um ponto simples
              ],
            ),
          ),

          // Lista de Usuários
          if (widget.users.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Nenhum usuário encontrado"),
            )
          else
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: widget.users.length,
                itemBuilder: (context, index) {
                  UserModel user = widget.users[index];
                  bool isExpanded = expandedUsers.contains(user.id);

                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.image),
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(user.name),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            color: Colors.blue, // Cor da seta para azul
                          ),
                          onPressed: () => _toggleExpand(user.id),
                        ),
                      ),

                      // Detalhes do usuário (aparecem abaixo do nome ao clicar)
                      if (isExpanded)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          color: Colors.grey.shade100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Cargo: ${user.job}", style: TextStyle(fontSize: 16)),
                                      Text("Data de Admissão: ${user.admissionDate}", style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
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
