import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sole/constants/app_constants.dart';

class AppThemes {
  static const BorderRadius borderRadius10 =
      BorderRadius.all(Radius.circular(10));

  static const BorderRadius borderRadius30 =
      BorderRadius.all(Radius.circular(30));

  static const EdgeInsets paddingH32 = EdgeInsets.symmetric(horizontal: 32);
  static const EdgeInsets paddingV16 = EdgeInsets.symmetric(vertical: 16);


  // text themes
  static const TextTheme lora = TextTheme(
    //title
    titleLarge: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 24,
        fontWeight: FontWeight.w700),
    //heading 1
    titleMedium: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 18,
        fontWeight: FontWeight.w700),
    //heading 2
    displayLarge: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 20,
        fontWeight: FontWeight.w700),
    displayMedium: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 20,
        fontWeight: FontWeight.w600),
    displaySmall: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 20,
        fontWeight: FontWeight.w400),
    //body-big
    headlineLarge: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 18,
        fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 18,
        fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 18,
        fontWeight: FontWeight.w400),
    //body-medium
    bodyLarge: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 16,
        fontWeight: FontWeight.w700),
    bodyMedium: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 14,
        fontWeight: FontWeight.w600),
    bodySmall: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 12,
        fontWeight: FontWeight.w400),
    //body-small
    labelLarge: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 14,
        fontWeight: FontWeight.w700),
    labelMedium: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 14,
        fontWeight: FontWeight.w500),
    //subheading small
    labelSmall: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 12,
        fontWeight: FontWeight.w500),
    //subheading big
    titleSmall: TextStyle(
        fontFamily: Constants.fontLora,
        fontSize: 16,
        fontWeight: FontWeight.w600),
    );

  static const TextTheme outfit = TextTheme(
    //title
    titleLarge: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 24,
        fontWeight: FontWeight.w700),
    //heading 1
    titleMedium: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 18,
        fontWeight: FontWeight.w700),
    //heading 2
    displayLarge: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 20,
        fontWeight: FontWeight.w700),
    displayMedium: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 20,
        fontWeight: FontWeight.w600),
    displaySmall: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 20,
        fontWeight: FontWeight.w400),
    //body-big
    headlineLarge: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 18,
        fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 18,
        fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 18,
        fontWeight: FontWeight.w400),
    //body-medium
    bodyLarge: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 16,
        fontWeight: FontWeight.w200),
    bodyMedium: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 14,
        fontWeight: FontWeight.w200),
    bodySmall: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 12,
        fontWeight: FontWeight.w200),
    //body-small
    labelLarge: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 14,
        fontWeight: FontWeight.w400),
    labelMedium: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 14,
        fontWeight: FontWeight.w400),
    //subheading small
    labelSmall: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 12,
        fontWeight: FontWeight.w400),
    //subheading big
    titleSmall: TextStyle(
        fontFamily: Constants.fontOutfit,
        fontSize: 16,
        fontWeight: FontWeight.w600),
  );
}
