import 'package:amor/ui/screens/home_screen.dart';
import 'package:amor/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

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
      home: const HomeScreen(),
    );
  }
}
