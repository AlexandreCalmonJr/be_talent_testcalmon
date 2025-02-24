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
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(flex: 1, child: Text("Foto", style: headerStyle)),
          Expanded(flex: 3, child: Text("Nome", style: headerStyle)),
          Icon(Icons.circle, color: Colors.black54),
        ],
      ),
    );
  }
}
