import 'package:expense_tracker/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/before_login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}