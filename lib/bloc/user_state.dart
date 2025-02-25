import 'package:be_talent_test/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserModel> users;
  UserLoaded(this.users);
  
  @override
  List<Object> get props => [users];
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
  
  @override
  List<Object> get props => [message];
}