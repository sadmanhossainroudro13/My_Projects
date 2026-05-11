import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TimeFilterToggle extends StatelessWidget {
  final String selectedFilter;

  final Function(String value) onChanged;

  const TimeFilterToggle({
    super.key,

    required this.selectedFilter,

    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = ["Week", "Month", "Year"];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),

      padding: const EdgeInsets.all(5),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: List.generate(filters.length, (index) {
          final filter = filters[index];

          /// selected kina check
          final isSelected = selectedFilter == filter;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                /// parent ke value pathabe
                onChanged(filter);
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),

                padding: const EdgeInsets.symmetric(vertical: 9),

                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,

                  borderRadius: BorderRadius.circular(14),
                ),

                child: Center(
                  child: Text(
                    filter,

                    style: TextStyle(
                      fontWeight: FontWeight.w600,

                      color: isSelected ? AppColors.bgDark : AppColors.hintText,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
