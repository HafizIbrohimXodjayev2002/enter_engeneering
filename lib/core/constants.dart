import 'package:flutter/material.dart';

class Constants {
  const Constants._();

  static const splashDuration = Duration(milliseconds: 2500); //ms
  static const animationPieChart = Duration(milliseconds: 800);
  static const physics = BouncingScrollPhysics();
  static final codeRegex = RegExp('[0-9a-zA-Z!@#^&*(),.?:{}|<>]');
  static final numberRegex = RegExp(r'[0-9]');
  static final latinRegex = RegExp(r'^[a-zA-Z]+$');
}