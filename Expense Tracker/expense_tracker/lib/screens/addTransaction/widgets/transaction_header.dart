import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 7),

          /// Top Row (icons)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ///  Notification
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.bgLight.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: AppColors.inputBg,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ///  Title
          Text(
            "Add Transaction",
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.textColor,
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }
}
