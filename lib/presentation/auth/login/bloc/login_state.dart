part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginNameErrorState extends LoginState {
  final bool isValidName;

  const LoginNameErrorState(this.isValidName);
  @override
  List<Object> get props => [isValidName];
}

class LoginPasswordErrorState extends LoginState {
  final bool isValidPassword;

  const LoginPasswordErrorState(this.isValidPassword);
  @override
  List<Object> get props => [isValidPassword];
}

class LoginSuccessState extends LoginState {
  final bool isSuccess;

  const LoginSuccessState(this.isSuccess);
  @override
  List<Object> get props => [isSuccess];
}