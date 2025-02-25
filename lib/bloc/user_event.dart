import 'package:equatable/equatable.dart';

// Classe abstrata que representa eventos relacionados aos usuários
abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => []; // Propriedades para comparação de igualdade
}

// Evento específico para buscar usuários
class FetchUsers extends UserEvent {}