import 'package:expense_tracker/features/transaction/providers/category_provider.dart';
import 'package:expense_tracker/features/transaction/providers/transaction_provider.dart';
import 'package:expense_tracker/shared/providers/auth_provider.dart';
import 'package:expense_tracker/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        //  auth provider
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        //  transaction provider
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        
        //Category Provider
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
