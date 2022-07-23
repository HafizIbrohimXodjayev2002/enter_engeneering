import 'package:eriell_company/presentation/splash/bloc/splash_bloc.dart';
import 'package:eriell_company/gen/assets.gen.dart';
import 'package:eriell_company/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpalshPage extends StatelessWidget {
  const SpalshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashEndedState) {
            context.go(Routes.login);
          }
        },
        child: Scaffold(
          body: Center(
            child: Assets.images.logoEriel.image(),
          ),
        ),
      ),
    );
  }
}
