import 'package:eriell_company/gen/colors.gen.dart';
import 'package:eriell_company/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: FontFamily.inter,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: ColorName.backgroundLight,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: ColorName.gray),
      titleTextStyle: TextStyle(color: ColorName.black),
    ),
    backgroundColor: ColorName.backgroundLight,
    primaryColor: ColorName.primary,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: ColorName.white,
    ),
    cardColor: ColorName.cardColorLight,
    focusColor: ColorName.primary,
    scaffoldBackgroundColor: ColorName.backgroundLight,
    bottomAppBarColor: ColorName.primary,
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: ColorName.primary,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: TextStyle(
          color: ColorName.black,
          fontSize: 18,
        ),
      ),
    ),
  );
}
