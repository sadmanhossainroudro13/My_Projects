import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HeaderSectionBudget extends StatelessWidget {
  const HeaderSectionBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///Arroew
          Icon(Icons.arrow_back, color: AppColors.hintText),

          Text(
            ///PennyWise Budget
            "PennyWise Budget",
            style: TextStyle(
              color: AppColors.hintText,
              fontWeight: FontWeight.bold,
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.bgLight,
              borderRadius: BorderRadius.circular(20),
            ),

            ///New Button
            child: Text(
              "+ New",
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
