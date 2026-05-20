import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/chart/widgets/chart_item_class.dart';
import 'package:expense_tracker/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final ChartItem item;

  const CategoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final currencyProvider = Provider.of<CurrencyProvider>(context);

    ///  background logic (important)
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
                "${currencyProvider.selectedCurrency.symbol} ${item.amount.toStringAsFixed(2)}",
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
        ],
      ),
    );
  }
}
