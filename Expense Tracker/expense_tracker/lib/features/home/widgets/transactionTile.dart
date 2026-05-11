import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;

  const TransactionTile({
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = amount.startsWith("+");

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.socialBg,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          /// Icon
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.textColor,
            child: const Icon(Icons.attach_money, size: 18),
          ),

          const SizedBox(width: 12),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                Text(date, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),

          /// Amount
          Text(
            amount,
            style: TextStyle(
              color: isIncome ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
