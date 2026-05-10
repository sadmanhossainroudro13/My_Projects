import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/budget/widgets/budget_item_class.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartSection extends StatelessWidget {
  final List<BudgetItem> items;
  ChartSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    /// total calculate
    final total = items.fold(0.0, (sum, item) => sum + item.amount);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          /// 🔥 DONUT CHART
          SizedBox(
            height: 230,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 70,

                    sections: items.map((item) {
                      return PieChartSectionData(
                        value: item.amount,
                        color: Color(item.color),
                        radius: 35,
                        showTitle: false,
                      );
                    }).toList(),
                  ),
                ),

                ///  center text
                Text(
                  "\$${total.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          ///  LEGEND
          Wrap(
            spacing: 14,
            runSpacing: 8,
            children: items.map((item) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(item.color),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(item.title),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
