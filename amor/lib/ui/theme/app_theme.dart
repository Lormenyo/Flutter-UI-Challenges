import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData buildTheme() {
    final ThemeData lightTheme = ThemeData.light();
    return lightTheme.copyWith(
        useMaterial3: true,
        disabledColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black, size: 30),
        ),
        primaryIconTheme: const IconThemeData(color: Colors.black),
        textTheme:
            const TextTheme(displayMedium: TextStyle(color: Colors.black)));
  }
}
