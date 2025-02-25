import 'package:be_talent_test/utils/styles.dart'; // Importe o arquivo styles.dart
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botão "CG"
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              "CG",
              style: headerStyle, // Aplicar o estilo headerStyle
            ),
          ),
          const SizedBox(width: 10),

          // Ícone de notificações
          Stack(
            alignment: Alignment.topRight,
            children: [
              const Icon(Icons.notifications_none, size: 28),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "2",
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue', // Aplicar a fonte
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}