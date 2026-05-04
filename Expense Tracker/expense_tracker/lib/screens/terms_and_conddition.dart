import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TermsAndConddition extends StatelessWidget {
  const TermsAndConddition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bgDark, AppColors.bgLight],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              /// 🔽 Main Content
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 50, // 👈 top space for button
                  ),
                  child: const Text(
                    "The following terms and conditions govern your use of the PennyWise application. "
                    "By creating an account or using our services, you agree to comply with these terms.\n\n"
                    "PennyWise helps you track expenses, manage budgets, and gain insights into your financial habits. "
                    "While we aim to provide accurate and helpful information, all financial decisions made using the app are your own responsibility.\n\n"
                    "We may collect and store certain user data, such as transaction details and usage activity, "
                    "to improve app performance and enhance your experience. Your data will not be shared with third parties without consent, "
                    "except where required by law.\n\n"
                    "You are responsible for maintaining the confidentiality of your account credentials. "
                    "Any activity performed under your account will be considered your responsibility.\n\n"
                    "PennyWise is not liable for any financial loss, damages, or decisions made based on the use of this application. "
                    "Always verify important financial information independently.\n\n"
                    "We reserve the right to update or modify these terms at any time. Continued use of the app "
                    "after changes means you accept the updated terms.\n\n"
                    "If you do not agree with any part of these terms, please discontinue use of the application.",
                    style: const TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 16,
                      height: 1.5, // 👈 spacing nicer হবে
                    ),
                  ),
                ),
              ),

              /// ❌ Close Button
              Positioned(
                top: 10,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColors.primary, // 👈 theme matching color
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
