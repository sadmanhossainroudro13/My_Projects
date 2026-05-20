import 'package:expense_tracker/providers/balance_visible_provider.dart';
import 'package:expense_tracker/providers/category_provider.dart';
import 'package:expense_tracker/providers/currency_provider.dart';
import 'package:expense_tracker/providers/notification_provider.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:expense_tracker/shared/providers/auth_provider.dart';
import 'package:expense_tracker/features/splach_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        //  auth provider
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        //  transaction provider
        ChangeNotifierProvider(create: (_) => TransactionProvider()),

        //Category Provider
        ChangeNotifierProvider(create: (_) => CategoryProvider()),

        //Currency Provider
        ChangeNotifierProvider(
          create: (_) {
            final provider = CurrencyProvider();

            provider.loadCurrency();

            return provider;
          },
        ),

        ChangeNotifierProvider(create: (_) => NotificationProvider()),

        ChangeNotifierProvider(
          create: (_) {
            final provider = BalanceVisibleProvider();
            provider.loadBalanceVisibility();
            return provider;
          },
        ),
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
