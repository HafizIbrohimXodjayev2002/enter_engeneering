part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationChangedEvent extends RegistrationEvent {
  @override
  List<Object> get props => [];
}

class RegistrationChangedRepeatePasswordEvent extends RegistrationEvent {
  @override
  List<Object> get props => [];
}

class RegistrationOnChangedNameEvent extends RegistrationEvent {
  final String value;

  const RegistrationOnChangedNameEvent(this.value);

  @override
  List<Object> get props => [value];
}
