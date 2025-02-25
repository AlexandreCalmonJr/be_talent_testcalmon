import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBarWidget({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextField(
        onChanged: onSearch, // Chama a função de pesquisa passada pelo HomePage
        decoration: InputDecoration(
          hintText: "Pesquisar",
          hintStyle: const TextStyle(
            fontFamily: 'Helvetica Neue',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.19, // line-height / font-size = 19.09 / 16
            letterSpacing: 0,
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15
          ),
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(
          fontFamily: 'Helvetica Neue',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 1.19, // line-height / font-size = 19.09 / 16
          letterSpacing: 0,
        ),
      ),
    );
  }
}
