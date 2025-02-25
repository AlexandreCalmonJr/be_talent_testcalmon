import 'package:be_talent_test/models/user_model.dart';
import 'package:be_talent_test/services/api_service.dart';
import 'package:be_talent_test/utils/styles.dart';
import 'package:be_talent_test/widgets/header_section.dart';
import 'package:be_talent_test/widgets/search_bar.dart';
import 'package:be_talent_test/widgets/user_table.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> users = []; // Lista de usuários
  List<UserModel> filteredUsers = []; // Lista filtrada
  bool isLoading = true; // Para exibir o carregamento
  String errorMessage = ""; // Para exibir erros

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  // Função para carregar usuários da API
  Future<void> _loadUsers() async {
    try {
      List<UserModel> fetchedUsers =
          await ApiService().fetchUsers(); // Chama a API
      setState(() {
        users = fetchedUsers;
        filteredUsers = fetchedUsers; // Inicializa com todos os usuários
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Erro ao carregar usuários: $e";
        isLoading = false;
      });
    }
  }

  // Função para filtrar usuários
  void _filterUsers(String query) {
    query = query.toLowerCase().trim();

    List<UserModel> results = users.where((user) {
      final jobMatch = user.job.toLowerCase().contains(query);
      final dateMatch = user.admissionDate.toString().contains(query);
      // Garante que a data seja pesquisável

      return  jobMatch || dateMatch || user.phone.contains(query);
    }).toList();

    setState(() {
      filteredUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderSection(),
          const SizedBox(height: 10),

          // Título "Funcionários"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Funcionários",
                style: titleStyle, // Aplicar o estilo titleStyle
              ),
            ),
          ),

          // Barra de Pesquisa
          SearchBarWidget(
            onSearch: _filterUsers, // Passando a função de filtragem
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: isLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator()) // Indicador de carregamento
                  : errorMessage.isNotEmpty
                      ? Center(
                          child: Text(errorMessage,
                              style: contentStyle))
                      : UserTable(
                          users: filteredUsers), // Exibe os dados filtrados
            ),
          ),
        ],
      ),
    );
  }
}