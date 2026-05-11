import 'package:expense_tracker/core/constants/image_links.dart';
import 'package:expense_tracker/features/auth/screens/auth_gate.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthGate()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColors.bgDark,
      body: Center(child: Image.asset(ImageLinks.logo, height: 150)),
    );
  }
}
