import 'package:amor/ui/screens/home_screen.dart';
import 'package:amor/ui/screens/onboarding_screen.dart';
import 'package:amor/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amor',
        theme: AppTheme.buildTheme(),
        home: FutureBuilder<Widget>(
            future: getHome(),
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return snapshot.data!;
                  }
              }
            }));
  }

  Future<Widget> getHome() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('username') != null) {
      return const HomeScreen();
    } else {
      return const OnboardingScreen();
    }
  }
}
