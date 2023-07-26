import 'package:flutter/material.dart';

class AppColors{
  static const Color backgroundColor = Color(0xffE5F0FF);
  static const Color primaryColor = Color(0xff2D87FC);
  static const Color primaryLightColor = Color(0xff4896FC);
  static const Color primaryLighterColor = Color(0xff62A5FD);
  static const Color primaryDeepColor = Color(0xff1378FB);
  static const Color primaryDeeperColor = Color(0xff046AF0);

  static const Color secondaryDeeperColor = Color(0xffffffff);
  static const Color secondaryColor = Color(0xff046AF0);

  static const Color secondaryLightColor = Color(0xffFFFFFF);
  static const Color secondaryLighterColor = Color(0xff2D87FC);
  static const Color secondaryDeepColor = Color(0xffFFE0B5);

  static const appBackgroundColor = Color(0xffE5F0FF);
  static const brandingColor = Color(0xff2D87FC);
  static const highlightColor = Color(0xff2D87FC);

  static const whiteColor = Color(0xffffffff);
  static const blackColor = Color(0xff000000);
  static const greyColor = Color(0xff9c9c9c);
  static final hintColor = const Color(0xff646464).withOpacity(0.9);

  static const primaryTextColor = Color(0xff333030);
  static const secondaryTextColor = Color(0xffffffff);

  static const submitButtonColor = Color(0xff7CB4FD);
  static const submitButtonTextColor = Color(0xffffffff);

  static const successColor = Colors.green;
  static const errorColor = Color(0xffffffff);

  static const warningColor = Color(0xffffcc00);
  static const dangerColor = Color(0xff6E0D15);

  static const transparentColor = Colors.transparent;


  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryColor,
      primaryDeepColor,
    ],
  );
}