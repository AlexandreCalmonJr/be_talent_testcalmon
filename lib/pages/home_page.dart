import 'package:be_talent_test/bloc/user_bloc.dart';
import 'package:be_talent_test/bloc/user_event.dart';
import 'package:be_talent_test/bloc/user_state.dart';
import 'package:be_talent_test/models/user_model.dart';
import 'package:be_talent_test/utils/styles.dart';
import 'package:be_talent_test/widgets/header_section.dart';
import 'package:be_talent_test/widgets/search_bar.dart';
import 'package:be_talent_test/widgets/user_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(FetchUsers());
  }

  // Função para filtrar usuários
  void _filterUsers(String query, List<UserModel> users) {
    query = query.toLowerCase().trim();

    List<UserModel> results = users.where((user) {
      final jobMatch = user.job.toLowerCase().contains(query);
      final dateMatch = user.admissionDate.toString().contains(query);
      return jobMatch || dateMatch || user.phone.contains(query);
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Funcionários",
                style: titleStyle,
              ),
            ),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is UserError) {
                return Expanded(
                  child: Center(child: Text(state.message, style: contentStyle)),
                );
              } else if (state is UserLoaded) {
                return Expanded(
                  child: Column(
                    children: [
                      SearchBarWidget(
                        onSearch: (query) => _filterUsers(query, state.users),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: UserTable(users: filteredUsers.isNotEmpty ? filteredUsers : state.users),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
