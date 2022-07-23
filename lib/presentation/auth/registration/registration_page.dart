import 'package:eriell_company/presentation/auth/registration/widgets/custom_requirements.dart';
import 'package:eriell_company/presentation/auth/registration/bloc/registration_bloc.dart';
import 'package:eriell_company/ui/components/app_bar/custom_app_bar.dart';
import 'package:eriell_company/ui/components/text_fields/eriell_text_field.dart';
import 'package:eriell_company/ui/components/text_fields/password_text_field.dart';
import 'package:eriell_company/ui/components/buttons/custom_text_button.dart';
import 'package:eriell_company/ui/components/buttons/custom_button.dart';
import 'package:eriell_company/ui/themes/app_style.dart';
import 'package:eriell_company/routes/app_routes.dart';
import 'package:eriell_company/core/dimensions.dart';
import 'package:eriell_company/core/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccessState) {
            context.go(Routes.home);
          }
        },
        child: Builder(builder: (context) {
          final bloc = context.read<RegistrationBloc>();
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: const EriellAppBar(title: "Регистрация"),
              body: ListView(
                physics: const BouncingScrollPhysics(),
                padding: Dimensions.paddingDefaultPage,
                children: [
                  Dimensions.vSpace80,
                  Text("Зарегистрироваться", style: AppStyle.interW700x20WBlack),
                  Dimensions.vSpace4,
                  Text("Зарегистрируйтесь, чтобы начать", style: AppStyle.interW500x12WGrey),
                  Dimensions.vSpace24,
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      bool isValidName = true;
                      if (state is RegistrationNameErrorState) {
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
                  PasswordTextField(
                    hintText: "Введите пароль",
                    titleHintText: "Введите пароль",
                    focusNode: bloc.passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    onChanged: bloc.onChangedPassword,
                    controller: bloc.passwordController,
                    formatter: [FilteringTextInputFormatter.allow(Constants.codeRegex)],
                  ),
                  Dimensions.vSpace12,
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    buildWhen: (prev, cur) => cur is RegistrationRepeatPasswordValidationState,
                    builder: (context, state) {
                      bool isValid = true;
                      if (state is RegistrationRepeatPasswordValidationState) {
                        isValid = state.isValid;
                      }
                      return PasswordTextField(
                        hintText: "Повторите пароль",
                        titleHintText: "Повторите пароль",
                        focusNode: bloc.repitePasswordFocusNode,
                        onChanged: bloc.onChangedRepeatPassword,
                        textInputAction: TextInputAction.done,
                        controller: bloc.repeatPasswordController,
                        error: isValid ? null : "Поля не совпадаеть",
                        formatter: [FilteringTextInputFormatter.allow(Constants.codeRegex)],
                      );
                    },
                  ),
                  Dimensions.vSpace16,
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    buildWhen: (prev, cur) => cur is RegistrationInitial,
                    builder: (context, state) {
                      final data = state as RegistrationInitial;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRequirements(
                            isChecked: data.required1Success,
                            requirementTitle: "минимум 1 цифра",
                          ),
                          Dimensions.vSpace16,
                          CustomRequirements(
                            isChecked: data.required2Success,
                            requirementTitle: "от 6 до 16 символов",
                          ),
                          Dimensions.vSpace16,
                          CustomRequirements(
                            isChecked: data.required3Success,
                            requirementTitle: "минимум 3 латинские буквы",
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              bottomNavigationBar: SafeArea(
                minimum: Dimensions.paddingCustomButton,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextButton(
                      onPressed: () => context.go(Routes.login),
                      title: "Логин",
                    ),
                    Dimensions.vSpace8,
                    BlocBuilder<RegistrationBloc, RegistrationState>(
                      buildWhen: (prev, cur) => cur is RegistrationInitial || cur is RegistrationLoadingState,
                      builder: (context, state) {
                        bool isActive = false;
                        if (state is RegistrationInitial) {
                          isActive = state.required1Success &&
                              state.required2Success &&
                              state.required3Success &&
                              state.isRepeatFill && bloc.isValidName;
                        } else if (state is RegistrationLoadingState) {
                          isActive = true;
                        }
                        return CustomButton(
                          isActive: isActive,
                          onPressed: bloc.onNextPressed,
                          title: "Вход в приложению",
                          isLoading: state is RegistrationLoadingState,
                        );
                      },
                    ),
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