import 'package:expense_tracker/features/auth/screens/login_screen.dart';
import 'package:expense_tracker/main_screen.dart';
import 'package:expense_tracker/shared/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.isLoggedIn) {
          //if logged in navigate to MianScreen
          return MainScreen();
        } else {
          //If not navigate to LoginScreen
          return LoginScreen();
        }
      },
    );
  }
}
