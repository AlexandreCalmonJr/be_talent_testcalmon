import 'package:be_talent_test/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'user_event.dart';
import 'user_state.dart';

// Definição da classe UserBloc que gerencia o estado dos usuários
class UserBloc extends Bloc<UserEvent, UserState> {
  // Instância de Dio para fazer requisições HTTP
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:3000", // URL base da API
      connectTimeout: const Duration(seconds: 5), // Tempo de conexão
      receiveTimeout: const Duration(seconds: 5), // Tempo de recebimento
    ),
  );

  // Construtor da classe UserBloc
  UserBloc() : super(UserLoading()) {
    // Definição do manipulador para o evento FetchUsers
    on<FetchUsers>((event, emit) async {
      emit(UserLoading()); // Emite o estado de carregamento
      try {
        // Requisição GET para buscar os usuários na API
        final response = await _dio.get("/employees");
        if (response.statusCode == 200) {
          // Converte a resposta da API para uma lista de UserModel
          final users = (response.data as List)
              .map((user) => UserModel.fromJson(user))
              .toList();
          emit(UserLoaded(users)); // Emite o estado de sucesso com os usuários carregados
        } else {
          // Emite o estado de erro com a mensagem de erro da API
          emit(UserError("Erro na API: Código ${response.statusCode}"));
        }
      } catch (e) {
        // Emite o estado de erro com a mensagem de exceção
        emit(UserError("Erro ao buscar funcionários: $e"));
      }
    });
  }
}