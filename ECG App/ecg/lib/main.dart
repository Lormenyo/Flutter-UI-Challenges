import 'package:ecg/ui/theme/app_theme_notifier.dart';
import 'package:ecg/ui/theme/theme.dart';
import 'package:ecg/controllers/bottom_navbar_controller.dart';
import 'package:ecg/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<AppThemeNotifier>(
        create: (context) => AppThemeNotifier(),
      ),
      ChangeNotifierProvider<BottomNavBarNotifier>(
        create: (context) => BottomNavBarNotifier(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(builder: (context, appstate, _) {
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
