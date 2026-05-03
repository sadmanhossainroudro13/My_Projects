import 'package:expense_tracker/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bgDark, AppColors.bgLight],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Column(
                children: [
                  const SizedBox(height: 100),

                  Image.asset('assets/images/expense_logo.png', height: 100),

                  const SizedBox(height: 16),

                  const Text(
                    "PennyWise AI",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: AppColors.inputBg,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "AI-Powered Financial Journey",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Form(
                    child: Column(
                      children: [
                        /// Email
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Email Address",
                            prefixIcon: Icon(Icons.person, size: 25),
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// Password
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock_outlined, size: 25),
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: AppColors.bgDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: theme.colorScheme.primary),
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Log In",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.bgDark,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: AppColors.secondaryText),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.socialBg,
                    ),
                    child: Icon(Icons.g_mobiledata, size: 30),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
