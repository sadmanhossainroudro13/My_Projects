import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/budget/widgets/budget_item_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryCard extends StatelessWidget {
  final BudgetItem item;

  const CategoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    double percent = item.amount / item.limit;

    /// 🔥 background logic (important)
    Color bgColor = Color(item.color);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE + AMOUNT
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.socialBg,
                ),
              ),
              Text(
                "\$${item.amount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.socialBg,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          /// 🔹 subtitle
          Text("Expenses", style: TextStyle(color: AppColors.socialBg)),

          const SizedBox(height: 10),

          ///  PROGRESS BAR
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percent.clamp(0, 1),
              minHeight: 8,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation(
                const Color.fromARGB(200, 50, 200, 50),
              ),
            ),
          ),

          const SizedBox(height: 6),

          ///  amount / limit
          Text(
            "\$${item.amount} / \$${item.limit}",
            style: const TextStyle(fontSize: 12, color: AppColors.socialBg),
          ),
        ],
      ),
    );
  }
}
