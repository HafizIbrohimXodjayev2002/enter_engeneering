import 'package:eriell_company/ui/components/text_fields/password_text_field.dart';
import 'package:eriell_company/ui/components/text_fields/eriell_text_field.dart';
import 'package:eriell_company/ui/components/buttons/custom_text_button.dart';
import 'package:eriell_company/presentation/auth/login/bloc/login_bloc.dart';
import 'package:eriell_company/ui/components/app_bar/custom_app_bar.dart';
import 'package:eriell_company/ui/components/buttons/custom_button.dart';
import 'package:eriell_company/ui/themes/app_style.dart';
import 'package:eriell_company/routes/app_routes.dart';
import 'package:eriell_company/core/dimensions.dart';
import 'package:eriell_company/core/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {},
        child: Builder(builder: (context) {
          final bloc = context.read<LoginBloc>();
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: const EriellAppBar(
                title: "Логин",
              ),
              body: ListView(
                physics: const BouncingScrollPhysics(),
                padding: Dimensions.paddingDefaultPage,
                children: [
                  Dimensions.vSpace80,
                  Text("Добро пожаловать!", style: AppStyle.interW700x20WBlack),
                  Dimensions.vSpace4,
                  Text("Продолжите, чтобы начать", style: AppStyle.interW500x12WGrey),
                  Dimensions.vSpace24,
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      bool isValidName = true;
                      if (state is LoginNameErrorState) {
                        isValidName = state.isValidName;
                      }
                      return EriellTextField(
                        hintText: "Введите логин",
                        titleHintText: "Введите логин",
                        focusNode: bloc.nameFocusNode,
                        onChanged: bloc.onChangedName,
                        textInputAction: TextInputAction.next,
                        controller: bloc.nameEditingController,
                        formatter: [FilteringTextInputFormatter.allow(Constants.codeRegex)],
                        error: isValidName ? null : "Не меньше 3 символа",
                      );
                    },
                  ),
                  Dimensions.vSpace12,
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      bool isValidPassword = true;
                      if (state is LoginPasswordErrorState) {
                        isValidPassword = state.isValidPassword;
                      }
                      return PasswordTextField(
                        hintText: "Введите пароль",
                        titleHintText: "Введите пароль",
                        focusNode: bloc.passwordFocusNode,
                        onChanged: bloc.onChangedPassword,
                        controller: bloc.passwordEditingController,
                        error: isValidPassword ? null : "Не меньше 6 символа",
                      );
                    },
                  )
                ],
              ),
              bottomNavigationBar: SafeArea(
                minimum: Dimensions.paddingCustomButton,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextButton(
                      title: "Регистрация",
                      onPressed: () => context.push(Routes.registration),
                    ),
                    Dimensions.vSpace8,
                    CustomButton(
                      isActive: bloc.isValidName && bloc.isValidPassword,
                      onPressed: () => context.go(Routes.home),
                      title: "Вход в приложению",
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
