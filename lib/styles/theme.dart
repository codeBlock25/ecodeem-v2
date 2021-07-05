import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData theme = ThemeData(
    fontFamily: 'Lato',
    primarySwatch: Colors.green,
    primaryColor: primaryColor,
    splashColor: Colors.white38,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    buttonColor: primaryColor,
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 14, color: secondaryColor, fontWeight: FontWeight.w400),
        button: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400)),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      minWidth: Get.width / 2 - 50,
      colorScheme: ColorScheme(
        background: primaryColor,
        error: Colors.red,
        onError: Colors.red,
        onSecondary: secondaryColor,
        onPrimary: primaryColor,
        onSurface: Colors.grey[200]!,
        secondaryVariant: secondaryColor.withOpacity(0.8),
        brightness: Brightness.dark,
        secondary: secondaryColor,
        surface: primaryColor,
        primaryVariant: primaryColor,
        primary: primaryColor,
        onBackground: primaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFFFFFFF),
      elevation: 0,
      shadowColor: Colors.transparent,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Color(0xFFC4C4C4)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      fillColor: const Color(0xFFF9F9F9),
    ),
  );
}
