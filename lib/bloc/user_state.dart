import 'package:be_talent_test/models/user_model.dart';
import 'package:equatable/equatable.dart';


abstract class UserState extends Equatable {
  @override
  List<Object> get props => []; // Propriedades para comparação de igualdade
}

// Estado que indica que os dados dos usuários estão sendo carregados
class UserLoading extends UserState {}

// Estado que indica que os dados dos usuários foram carregados com sucesso
class UserLoaded extends UserState {
  final List<UserModel> users; // Lista de usuários carregados

  UserLoaded(this.users);

  @override
  List<Object> get props => [users]; // Propriedades para comparação de igualdade
}

// Estado que indica que houve um erro ao carregar os dados dos usuários
class UserError extends UserState {
  final String message; // Mensagem de erro

  UserError(this.message);

  @override
  List<Object> get props => [message]; // Propriedades para comparação de igualdade
}