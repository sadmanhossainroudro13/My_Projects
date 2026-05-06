import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/screens/budgetPage/widgets/budget_item_class.dart';
import 'package:expense_tracker/screens/budgetPage/widgets/category_list_section_budget.dart';
import 'package:expense_tracker/screens/budgetPage/widgets/chart_section_budget.dart';
import 'package:expense_tracker/screens/budgetPage/widgets/header_section_budget.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatelessWidget {
  ///  Dummy data (later → provider / hive)
  final List<BudgetItem> items = [
    BudgetItem(
      title: "School fees",
      amount: 350,
      limit: 350,
      color: 0xFFFFD54F,
    ),
    BudgetItem(title: "Food", amount: 500, limit: 1500, color: 0xFF1B3C34),
    BudgetItem(title: "Car", amount: 150, limit: 1000, color: 0xFF5DADE2),
  ];
  BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: const BoxDecoration(color: AppColors.socialBg),
      child: SafeArea(
        child: Column(
          children: [
            /// 🔹 HEADER (top bar)
            const HeaderSectionBudget(),

            const SizedBox(height: 10),

            ///  CHART SECTION
            ChartSection(items: items),

            /// 🔹 BODY (scrollable)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),

                    ///  CATEGORY LIST
                    CategoryListSectionBudget(items: items),

                    const SizedBox(height: 100), // navbar space
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
