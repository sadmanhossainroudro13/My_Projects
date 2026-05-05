import 'package:expense_tracker/core/image_links.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/screens/forget_password.dart';
import 'package:expense_tracker/screens/homePage/home_screen.dart';
import 'package:expense_tracker/screens/signup_screen.dart';
import 'package:expense_tracker/widgets/background_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BackgroundScreen(
        customChild: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Image.asset(ImageLinks.logo, height: 100),

                  const SizedBox(height: 16),

                  const Text(
                    "PennyWise",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: AppColors.inputBg,
                    ),
                  ),

                  const SizedBox(height: 14),

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
                            prefixIcon: Icon(Icons.email, size: 20),
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// Password
                        TextFormField(
                          obscureText: true, //replace with custompassword field
                          decoration: const InputDecoration(
                            hintText: "Password",
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

                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPassword(),
                          ),
                        );
                      },

                      ///Forget Password
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: theme.colorScheme.primary),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },

                      ///Login
                      child: Text(
                        "Log In",
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
                        "Don't have an account? ",
                        style: TextStyle(color: AppColors.secondaryText),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // const SizedBox(height: 30),
                  // Container(
                  //   height: 55,
                  //   width: 55,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: AppColors.socialBg,
                  //   ),
                  //   child: Icon(Icons.g_mobiledata, size: 30),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
