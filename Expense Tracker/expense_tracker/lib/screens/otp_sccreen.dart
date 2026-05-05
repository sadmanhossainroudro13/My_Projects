import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/widgets/background_screen.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget otpBox() {
      return Container(
        height: 55,
        width: 45,
        decoration: BoxDecoration(
          color: AppColors.inputBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: "",
              border: InputBorder.none,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: BackgroundScreen(
        customChild: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 140),
                  Text(
                    "Verify Your Account",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 38,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Check your email for a 6-digit\nverification code sent to\nuser_email@example.com.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.secondaryText),
                  ),

                  const SizedBox(height: 40),

                  /// OTP Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) => otpBox()),
                  ),

                  const SizedBox(height: 40),

                  /// Verify Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Verify",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.bgDark,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Resend code in 0:45",
                    style: TextStyle(color: AppColors.secondaryText),
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
