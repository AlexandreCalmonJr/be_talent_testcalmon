import 'package:be_talent_test/models/user_model.dart';
import 'package:be_talent_test/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatelessWidget {
  final UserModel user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final String formattedDate = dateFormat.format(user.admissionDate);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cargo: ${user.job}", style: contentStyle),
          Text("Data de Admissão: $formattedDate", style: contentStyle),
          Text("Telefone: ${user.phone}", style: contentStyle),
        ],
      ),
    );
  }
}
