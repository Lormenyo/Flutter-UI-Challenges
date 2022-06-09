import 'package:ecg/config/theme/app_colors.dart';
import 'package:ecg/config/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static ThemeData buildLightTheme() {
    final ThemeData lightTheme = ThemeData.light();
    return lightTheme.copyWith(
        disabledColor: Colors.grey[300],
        scaffoldBackgroundColor: AppColors.ecgWhite,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black, size: 30),
        ),
        primaryIconTheme: const IconThemeData(color: Colors.black),
        // elevatedButtonTheme: ElevatedButtonThemeData(),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF122F3A), //Color(0xFFBECD18),
          onPrimary: Colors.white,
          secondary: Color(0xFF8E8E93),
          onBackground: Color(0xFF122F3A),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.orangeAccent,
        ),
        textTheme: ecgLightTextTheme(lightTheme.textTheme)
        // inputDecorationTheme: InputDecorationTheme(
        //   filled: true,
        //   fillColor: Color(0xFFFFFFFF),
        //   border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //       borderSide: BorderSide(
        //           color: Colors.black, style: BorderStyle.solid, width: 1)),
        // )
        );
  }

  static ThemeData buildDarkTheme() {
    final ThemeData darkTheme = ThemeData.dark();
    return darkTheme.copyWith(
        disabledColor: Colors.grey[300],
        scaffoldBackgroundColor: AppColors.ecgWhite,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black, size: 30),
        ),
        primaryIconTheme: const IconThemeData(color: Colors.black),
        // elevatedButtonTheme: ElevatedButtonThemeData(),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF122F3A), //Color(0xFFBECD18),
          onPrimary: Colors.white,
          secondary: Color(0xFF8E8E93),
          onBackground: Color(0xFF122F3A),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.orangeAccent,
        ),
        textTheme: ecgLightTextTheme(darkTheme.textTheme)
        // inputDecorationTheme: InputDecorationTheme(
        //   filled: true,
        //   fillColor: Color(0xFFFFFFFF),
        //   border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //       borderSide: BorderSide(
        //           color: Colors.black, style: BorderStyle.solid, width: 1)),
        // )
        );
  }
}
