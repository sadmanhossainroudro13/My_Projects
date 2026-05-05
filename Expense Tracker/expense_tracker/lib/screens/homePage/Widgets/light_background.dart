import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LightBackground extends StatelessWidget {
  const LightBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
