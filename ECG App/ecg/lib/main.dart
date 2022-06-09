import 'package:ecg/config/theme/app_theme_notifier.dart';
import 'package:ecg/config/theme/theme.dart';
import 'package:ecg/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(builder: (contect, appstate, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECG Power',
        theme: AppTheme.buildLightTheme(),
        darkTheme: AppTheme.buildDarkTheme(),
        themeMode: appstate.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const HomeScreen(),
      );
    });
  }
}
