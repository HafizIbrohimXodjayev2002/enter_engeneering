part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginOnChangedNameEvent extends LoginEvent {
  final String value;

  const LoginOnChangedNameEvent(this.value);

  @override
  List<Object> get props => [value];
}

class LoginOnChangedPasswordEvent extends LoginEvent {
  final String value;

  const LoginOnChangedPasswordEvent(this.value);

  @override
  List<Object> get props => [value];
}