import 'package:amor/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData buildTheme() {
    final ThemeData lightTheme = ThemeData.light();
    return lightTheme.copyWith(
        useMaterial3: true,
        disabledColor: Colors.grey[300],
        colorScheme: ColorScheme(
          primary: AppColors.darkBlueColor,
          background: AppColors.darkBlueColor,
          secondary: AppColors.redColor,
          surface: Colors.white,
          onSurface: AppColors.lightGreyColor,
          brightness: Brightness.light,
          onError: Colors.red,
          onBackground: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.red,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black, size: 30),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.darkBlueColor,
        ),
        primaryIconTheme: const IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          displayMedium: const TextStyle(color: Colors.black),
          displayLarge: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
          displaySmall: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ));
  }
}
