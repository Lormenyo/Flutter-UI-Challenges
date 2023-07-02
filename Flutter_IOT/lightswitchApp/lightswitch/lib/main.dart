import 'package:flutter/material.dart';
import 'package:lightswitch/ui/screens/home.dart';
import 'package:lightswitch/ui/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildTheme(),
      home: Home(),
    );
  }
}
