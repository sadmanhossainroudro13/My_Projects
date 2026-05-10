import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildTypeToggle extends StatelessWidget {
  final bool isExpense;

  final Function(bool value) onToggle;

  const BuildTypeToggle({
    super.key,
    required this.isExpense,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.all(5),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.35),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          /// EXPENSE
          Expanded(
            child: GestureDetector(
              onTap: () {
                onToggle(true);
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),

                decoration: BoxDecoration(
                  color: isExpense
                      ? AppColors.primary
                      : Colors.transparent,

                  borderRadius: BorderRadius.circular(14),
                ),

                child: Center(
                  child: Text(
                    "Expense",

                    style: TextStyle(
                      fontWeight: FontWeight.w600,

                      color: isExpense
                          ? AppColors.bgDark
                          : AppColors.hintText,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// INCOME
          Expanded(
            child: GestureDetector(
              onTap: () {
                onToggle(false);
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),

                decoration: BoxDecoration(
                  color: !isExpense
                      ? AppColors.primary
                      : Colors.transparent,

                  borderRadius: BorderRadius.circular(14),
                ),

                child: Center(
                  child: Text(
                    "Income",

                    style: TextStyle(
                      fontWeight: FontWeight.w600,

                      color: !isExpense
                          ? AppColors.bgDark
                          : AppColors.hintText,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}