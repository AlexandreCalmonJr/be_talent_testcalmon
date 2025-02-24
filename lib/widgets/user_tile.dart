import 'package:be_talent_test/models/user_model.dart';
import 'package:be_talent_test/utils/styles.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final bool isExpanded;
  final Function(String) toggleExpand;

  const UserTile(
      {super.key,
      required this.user,
      required this.isExpanded,
      required this.toggleExpand});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.image)),
      title: Text(user.name, style: contentStyle),
      trailing: IconButton(
        icon: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: const Color.fromARGB(255, 78, 69, 100)),
        onPressed: () => toggleExpand(user.id),
      ),
    );
  }
}
