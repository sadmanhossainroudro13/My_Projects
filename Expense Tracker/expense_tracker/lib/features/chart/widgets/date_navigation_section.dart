import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DateNavigationSection extends StatelessWidget {
  final String headerText;

  final VoidCallback onPrevious;

  final VoidCallback onNext;

  const DateNavigationSection({
    super.key,
    required this.headerText,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        /// PREVIOUS
        IconButton(
          onPressed: onPrevious,

          icon: const Icon(Icons.arrow_back_ios, color: AppColors.bgLight),
        ),

        /// TEXT
        Text(
          headerText,

          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.hintText,
          ),
        ),

        /// NEXT
        IconButton(
          onPressed: onNext,

          icon: const Icon(Icons.arrow_forward_ios, color: AppColors.bgLight),
        ),
      ],
    );
  }
}
