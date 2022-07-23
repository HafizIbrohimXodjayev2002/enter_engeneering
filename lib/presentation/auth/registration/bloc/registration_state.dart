part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
  
  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {
  final bool required1Success;
  final bool required2Success;
  final bool required3Success;
  final bool isValidName;
  final bool isRepeatFill;

  const RegistrationInitial({
    this.required1Success = false,
    this.required2Success = false,
    this.required3Success = false,
    this.isValidName = false,
    this.isRepeatFill = false,
  });

  @override
  List<Object> get props => [required1Success, required2Success, required3Success, isRepeatFill, isValidName];
}

class RegistrationLoadingState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationRepeatPasswordValidationState extends RegistrationState {
  final bool isValid;

  const RegistrationRepeatPasswordValidationState({required this.isValid});

  @override
  List<Object> get props => [isValid];
}

class RegistrationErrorState extends RegistrationState {
  final String message;

  const RegistrationErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class RegistrationSuccessState extends RegistrationState {


  @override
  List<Object> get props => [];
}

class RegistrationNameErrorState extends RegistrationState {
  final bool isValidName;

  const RegistrationNameErrorState(this.isValidName);
  @override
  List<Object> get props => [isValidName];
}