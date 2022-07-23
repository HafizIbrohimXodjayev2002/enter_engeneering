import 'package:eriell_company/gen/colors.gen.dart';
import 'package:eriell_company/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppStyle {
  const AppStyle._();

  static TextStyle get appBar => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.inter,
        color: ColorName.black,
      );

  static TextStyle header7 = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: ColorName.white,
    fontFamily: FontFamily.inter,
  );

  static TextStyle get interW500x14Black => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ColorName.black,
        fontFamily: FontFamily.inter,
      );

  static TextStyle get interW500x14Grey => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ColorName.gray,
        fontFamily: FontFamily.inter,
      );    

  static TextStyle get interW600x16WBlack => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: FontFamily.inter,
        color: ColorName.subtitleColorDark,
      );

  static TextStyle get interW700x20WBlack => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        fontFamily: FontFamily.inter,
        color: ColorName.black,
      ); 

  static TextStyle get interW500x12WGrey => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        fontFamily: FontFamily.inter,
        color: ColorName.gray3,
      ); 

  static TextStyle get interW500x12WBlack => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        fontFamily: FontFamily.inter,
        color: ColorName.black,
      );               

  static TextStyle get interW700x16Gray4 => const TextStyle(
        fontSize: 16,
        color: ColorName.gray4,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.inter,
      );

  static TextStyle get interW500x16White70 => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: FontFamily.inter,
        color: Colors.white70,
      );

  static TextStyle get buttonText => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontFamily: FontFamily.inter,
        color: ColorName.white,
      );
}
