import 'package:be_talent_test/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:3000",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  UserBloc() : super(UserLoading()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final response = await _dio.get("/employees");
        if (response.statusCode == 200) {
          final users = (response.data as List)
              .map((user) => UserModel.fromJson(user))
              .toList();
          emit(UserLoaded(users));
        } else {
          emit(UserError("Erro na API: Código ${response.statusCode}"));
        }
      } catch (e) {
        emit(UserError("Erro ao buscar funcionários: $e"));
      }
    });
  }
}
