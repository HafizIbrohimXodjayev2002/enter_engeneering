import 'package:equatable/equatable.dart';
import 'package:eriell_company/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationInitial()){
    on<RegistrationOnChangedNameEvent>((event, emit) {
      onChangedName(event.value);
    });
  }

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode repitePasswordFocusNode = FocusNode();

  bool _isValidRepeatPassword = false;
  bool isValidName = false;

  /// Method for password text field value changed
  void onChangedPassword(String value) {
    if (repeatPasswordController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (passwordController.text.length == repeatPasswordController.text.length) {
        int latinCount = 0;
        for (int i = 0; i < value.length; i++) {
          if (value[i].contains(Constants.latinRegex)) {
            latinCount++;
          }
        }
        int numberCount = 0;
        for (int i = 0; i < value.length; i++) {
          if (value[i].contains(Constants.numberRegex)) {
            numberCount++;
          }
        }
        emit(
          RegistrationInitial(
            required1Success: numberCount > 0,
            required2Success: value.length > 5,
            isValidName: nameEditingController.text.length < 4,
            required3Success: latinCount > 2,
            isRepeatFill: true,
          ),
        );
        return;
      }
    }
    int latinCount = 0;
    for (int i = 0; i < value.length; i++) {
      if (value[i].contains(Constants.latinRegex)) {
        latinCount++;
      }
    }
    int numberCount = 0;
    for (int i = 0; i < value.length; i++) {
      if (value[i].contains(Constants.numberRegex)) {
        numberCount++;
      }
    }
    emit(RegistrationInitial(
      required1Success: numberCount > 0,
      required2Success: value.length > 5,
      isValidName: nameEditingController.text.length < 4,
      required3Success: latinCount > 2,
    ));
  }

  /// Method for repeat password text field value changed
  void onChangedRepeatPassword(String value) {
    if (!_isValidRepeatPassword && passwordController.text == value) {
      _isValidRepeatPassword = true;
      emit(RegistrationRepeatPasswordValidationState(isValid: _isValidRepeatPassword));
    }
    if (passwordController.text.length == value.length) {
      int latinCount = 0;
      for (int i = 0; i < value.length; i++) {
        if (value[i].contains(Constants.latinRegex)) {
          latinCount++;
        }
      }
      int numberCount = 0;
      for (int i = 0; i < value.length; i++) {
        if (value[i].contains(Constants.numberRegex)) {
          numberCount++;
        }
      }
      emit(RegistrationInitial(
          required1Success: numberCount > 0,
          required2Success: value.length > 5,
          required3Success: latinCount > 2,
          isValidName: nameEditingController.text.length < 4,
          isRepeatFill: true));
    } else if (value.length < passwordController.text.length) {
      int latinCount = 0;
      final password = passwordController.text;
      for (int i = 0; i < password.length; i++) {
        if (password[i].contains(Constants.latinRegex)) {
          latinCount++;
        }
      }
      int numberCount = 0;
      for (int i = 0; i < password.length; i++) {
        if (password[i].contains(Constants.numberRegex)) {
          numberCount++;
        }
      }
      emit(RegistrationInitial(
        required1Success: numberCount > 0,
        required2Success: password.length > 5,
        isValidName: nameEditingController.text.length < 4,
        required3Success: latinCount > 2,
        isRepeatFill: false,
      ));
    }
  }

   void onChangedName(String value) {
    if (value.length < 4) {
      isValidName = false;
    } else {
      isValidName = true;
    }
    emit(RegistrationNameErrorState(isValidName));
  }

  void onNextPressed() {
    if (passwordController.text != repeatPasswordController.text && isValidName) {
      _isValidRepeatPassword = false;
      emit(RegistrationRepeatPasswordValidationState(isValid: _isValidRepeatPassword));
      return;
    }
    emit(RegistrationSuccessState());
  }

  @override
  Future<void> close() {
    nameFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordController.dispose();
    nameEditingController.dispose();
    repitePasswordFocusNode.dispose();
    repeatPasswordController.dispose();
    return super.close();
  }
}
