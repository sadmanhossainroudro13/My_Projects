import 'package:expense_tracker/features/budget/widgets/budget_item_class.dart';
import 'package:expense_tracker/features/budget/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryListSectionBudget extends StatelessWidget {
  final List<BudgetItem> items;
  const CategoryListSectionBudget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    //final total = items.fold(0.0, (sum, item) => sum + item.amount);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: items.map((item) {
          //final percent = item.amount / total;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CategoryCard(item: item),
          );
        }).toList(),
      ),
    );
  }
}
