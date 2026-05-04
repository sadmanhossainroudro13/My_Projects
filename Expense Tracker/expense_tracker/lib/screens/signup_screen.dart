import 'package:expense_tracker/core/image_links.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/screens/terms_and_conddition.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),

                const SizedBox(height: 16),

                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: AppColors.inputBg,
                  ),
                ),

                const SizedBox(height: 14),

                const Text(
                  "Start your AI-powered financial journey today.",
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                Form(
                  child: Column(
                    children: [
                      /// Full name
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Full Name",
                          prefixIcon: Icon(Icons.person, size: 20),
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// Email
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Email Address",
                          prefixIcon: Icon(Icons.email, size: 20),
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// Password
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outlined, size: 20),
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: AppColors.bgDark,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// Password
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock_outlined, size: 20),
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

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: false,
                      activeColor: theme.colorScheme.primary,
                      onChanged: (value) {},
                    ),

                    Expanded(
                      child: Wrap(
                        children: [
                          const Text(
                            "I agree to the ",
                            style: TextStyle(color: AppColors.textColor),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TermsAndConddition(),
                                ),
                              );
                            },
                            child: Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign up",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 22,
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
                      "Already have an account? ",
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
