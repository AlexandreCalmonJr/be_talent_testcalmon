import 'package:be_talent_test/models/user_model.dart';
import 'package:be_talent_test/widgets/table_header.dart';
import 'package:be_talent_test/widgets/user_list.dart';
import 'package:flutter/material.dart';

class UserTable extends StatefulWidget {
  final List<UserModel> users;

  const UserTable({super.key, required this.users});

  @override
  // ignore: library_private_types_in_public_api
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  Set<String> expandedUsers = {}; // IDs dos usuários expandidos

  void _toggleExpand(String userId) {
    setState(() {
      if (expandedUsers.contains(userId)) {
        expandedUsers.remove(userId);
      } else {
        expandedUsers.add(userId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: Color.fromARGB(255, 248, 245, 245),
          width: 1,
        ),
      ),
      elevation: 5,
      color: const Color(0xFFFFFFFF),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Cabeçalho fixo
                const TableHeader(),
                
                // Conteúdo flexível
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: MediaQuery.of(context).size.height * 0.6,
                    ),
                    child: widget.users.isEmpty
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Nenhum usuário encontrado",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: UserList(
                              users: widget.users,
                              expandedUsers: expandedUsers,
                              toggleExpand: _toggleExpand,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}