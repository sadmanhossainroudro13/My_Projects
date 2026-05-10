import 'package:expense_tracker/core/constants/image_links.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/auth/screens/login_screen.dart';
import 'package:expense_tracker/features/auth/screens/otp_sccreen.dart';

import 'package:expense_tracker/core/widgets/background_screen.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BackgroundScreen(
        customChild: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Image.asset(ImageLinks.logo, height: 100),

                  const SizedBox(height: 16),

                  const Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.inputBg,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "Enter your registered email address to receive a reset link.",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  Form(
                    child:
                        /// Email
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Email Address",
                            prefixIcon: Icon(Icons.person, size: 20),
                          ),
                        ),
                  ),
                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtpScreen()),
                        );
                      },
                      child: Text(
                        "Send Link",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.bgDark,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Back to Login",
                      style: TextStyle(color: AppColors.primary, fontSize: 20),
                    ),
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
