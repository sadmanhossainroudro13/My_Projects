import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GoalsSection extends StatelessWidget {
  const GoalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            "Goals",
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 18,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 15),

          /// Goal Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                /// Icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.flag, color: Colors.black),
                ),

                const SizedBox(width: 12),

                /// Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dream Studio",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "\$251.21 / \$700",
                        style: TextStyle(fontSize: 13, color: AppColors.bgDark),
                      ),
                    ],
                  ),
                ),

                /// Progress
                const Text("36%"),
              ],
            ),
          ),

          const SizedBox(height: 15),

          ///  Add Goal Button
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                "+ Add new goal",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
