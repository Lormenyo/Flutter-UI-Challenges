import 'package:flutter/material.dart';

class AppThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;

  void updateTheme(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}
