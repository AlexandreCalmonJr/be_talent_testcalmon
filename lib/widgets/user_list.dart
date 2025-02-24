import 'package:be_talent_test/models/user_model.dart';
import 'package:be_talent_test/widgets/user_details.dart';
import 'package:be_talent_test/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<UserModel> users;
  final Set<String> expandedUsers;
  final Function(String) toggleExpand;

  const UserList(
      {super.key,
      required this.users,
      required this.expandedUsers,
      required this.toggleExpand});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: Colors.black26),
        itemBuilder: (context, index) {
          UserModel user = users[index];
          bool isExpanded = expandedUsers.contains(user.id);

          return Column(
            children: [
              UserTile(
                  user: user,
                  isExpanded: isExpanded,
                  toggleExpand: toggleExpand),
              if (isExpanded) UserDetails(user: user),
            ],
          );
        },
      ),
    );
  }
}
