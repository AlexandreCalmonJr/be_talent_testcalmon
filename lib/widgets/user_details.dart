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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 254, 254),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1),   // Coluna de rótulos
          1: FlexColumnWidth(2),   // Coluna de valores
        },
        border: TableBorder( // Bordas horizontais
          horizontalInside: BorderSide(
            color: const Color(0xFFDFDFDF), // Cor #DFDFDF
            width: 1,
          ),
          bottom: BorderSide( // Borda inferior da tabela
            color: const Color(0xFFDFDFDF),
            width: 1,
          ),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _buildTableRow("Cargo", user.job),
          _buildTableRow("Data de admissão", formattedDate),
          _buildTableRow("Telefone", user.phone),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        // Rótulo (negrito e alinhado à esquerda)
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 12),
          child: Text(
            label,
            style: contentStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        // Valor (alinhado à direita)
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 12, left: 20),
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: contentStyle.copyWith(
            ),
          ),
        ),
      ],
    );
  }
}