import 'package:flutter/material.dart';

class Dimensions {
  const Dimensions._();

  static const defaultAppBarHeight = 56.0;
  static const defaultButtonHeight = 52.0;

  static const paddingRight12 = EdgeInsets.only(right: 12);

  static const defaultPaddingH = 16.0;
  static const defaultPaddingV = 16.0;
  static const paddingDefaultPage = EdgeInsets.symmetric(vertical: 16, horizontal: 16);
  static const paddingDefaultPageH = EdgeInsets.symmetric(horizontal: defaultPaddingH);
  static const paddingDefaultPageH40 = EdgeInsets.symmetric(horizontal: 40);
  static const paddingDefaultPageV = EdgeInsets.symmetric(vertical: defaultPaddingV);
  static const paddingHomePageH = EdgeInsets.symmetric(horizontal: defaultPaddingH);
  static const paddingCustomButton = EdgeInsets.only(bottom: 16, left: 16, right: 16);
  static const paddingH24 = EdgeInsets.symmetric(horizontal: 24);

  /// Horizontal padding
  static const paddingH12 = EdgeInsets.symmetric(horizontal: 12);

  /// Vertical Spaces
  static const vSpace80 = SizedBox(height: 80);
  static const vSpace40 = SizedBox(height: 40);
  static const vSpace24 = SizedBox(height: 24);
  static const vSpace20 = SizedBox(height: 20);
  static const vSpace16 = SizedBox(height: 16);
  static const vSpace12 = SizedBox(height: 12);
  static const vSpace8 = SizedBox(height: 8);
  static const vSpace4 = SizedBox(height: 4);

  /// Horizontal Spaces
  static const hSpace8 = SizedBox(width: 8);

  /// Padding All
  static const paddingAll12 = EdgeInsets.all(12);
  static const paddingAll6 = EdgeInsets.all(6);
  static const paddingAll1 = EdgeInsets.all(1);

  /// Padding right
  static const paddingRight8 = EdgeInsets.only(right: 8);

  /// Radius All
  static final radiusAll44 = BorderRadius.circular(44);
  static final radiusAll28 = BorderRadius.circular(28);
  static final radiusAll26 = BorderRadius.circular(26);

  /// Padding only sides
  static const paddingFormLeft24Right12TB18 = EdgeInsets.only(left: 24, top: 18, bottom: 18, right: 12);
}
