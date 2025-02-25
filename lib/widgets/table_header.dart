import 'package:be_talent_test/utils/styles.dart';
import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: Color(0xFFEDEFFB),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Alinha do início
        crossAxisAlignment: CrossAxisAlignment.center, // Centraliza verticalmente
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 8), // Espaço entre "Foto" e "Nome"
              child: Text(
                "Foto",
                style: headerStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 8), // Ajuste o espaçamento conforme necessário
              child: Text(
                "Nome",
                style: headerStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Spacer(), // Adiciona um espaço flexível
          Padding(
            padding: const EdgeInsets.only(right
            : 26), // Ajuste o espaçamento conforme necessário
            child: Icon(
              Icons.circle,
              color: Colors.black,
              size: 8,
            ),
          ),
        ],
      ),
    );
  }
}