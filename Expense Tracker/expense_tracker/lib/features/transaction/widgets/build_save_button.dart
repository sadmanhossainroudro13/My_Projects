import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildSaveButton extends StatelessWidget {
  const BuildSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,

      child: ElevatedButton(
        onPressed: () {},

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,

          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        child: const Text(
          "Save Transaction",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.bgDark,
          ),
        ),
      ),
    );
  }
}
