import 'package:equatable/equatable.dart';
import 'package:eriell_company/core/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    Future.delayed(Constants.splashDuration, () {
      emit(SplashEndedState());
    });
  }
}
