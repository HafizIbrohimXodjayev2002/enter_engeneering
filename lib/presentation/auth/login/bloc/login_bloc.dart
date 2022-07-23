import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginOnChangedNameEvent>((event, emit) {
      onChangedName(event.value);
    });

    on<LoginOnChangedPasswordEvent>((event, emit) {
      onChangedPassword(event.value);
    });
  }

  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool isValidName = false;
  bool isValidPassword = false;
  bool isSuccess = false;

  void onChangedName(String value) {
    if (value.length < 4) {
      isValidName = false;
    } else {
      isValidName = true;
    }
    emit(LoginNameErrorState(isValidName));
  }

  void onChangedPassword(String value) {
    if (value.length < 7) {
      isValidPassword = false;
    } else {
      isValidPassword = true;
    }
    emit(LoginPasswordErrorState(isValidPassword));
  }
}
