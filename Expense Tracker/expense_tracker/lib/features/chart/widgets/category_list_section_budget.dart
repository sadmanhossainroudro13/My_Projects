import 'package:expense_tracker/features/chart/screens/category_details_screen.dart';
import 'package:expense_tracker/features/chart/widgets/chart_item_class.dart';
import 'package:expense_tracker/features/chart/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryListSectionBudget extends StatelessWidget {
  final List<ChartItem> items;

  const CategoryListSectionBudget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),

            child: GestureDetector(
              onTap: () {
                /// OPEN DETAILS PAGE
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) =>
                        CategoryDetailsScreen(categoryName: item.title),
                  ),
                );
              },
              child: CategoryCard(item: item),
            ),
          );
        }).toList(),
      ),
    );
  }
}
