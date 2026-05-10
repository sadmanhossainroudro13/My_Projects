import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget customChild;
  const BackgroundScreen({super.key, required this.customChild});

  @override
  Widget build(BuildContext context) {
    

    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.bgDark, AppColors.bgLight],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: customChild,
    );
  }
}
