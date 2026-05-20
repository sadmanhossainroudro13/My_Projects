import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/chart/widgets/chart_item_class.dart';
import 'package:expense_tracker/providers/currency_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartSection extends StatelessWidget {
  /// chart data list
  final List<ChartItem> items;

  const ChartSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final currencyProvider = Provider.of<CurrencyProvider>(context);

    /// total expense calculate korbe
    ///
    /// Example:
    /// 350 + 500 + 150

    final total = items.fold(
      0.0,

      /// sum = previous total
      /// item = current item
      (sum, item) => sum + item.amount,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.inputBg,

        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          /// PIE CHART SECTION
          SizedBox(
            height: 230,

            child: Stack(
              alignment: Alignment.center,

              children: [
                /// PIE / DONUT CHART
                PieChart(
                  PieChartData(
                    /// slice er majhe spacing
                    sectionsSpace: 2,

                    /// middle hole size
                    ///
                    /// eta beshi hole
                    /// donut beshi faka dekhabe
                    centerSpaceRadius: 70,

                    /// chart er sob slices
                    sections: items.isEmpty
                        ? [
                            PieChartSectionData(
                              value: 1,
                              color: AppColors.primary,
                              radius: 35,
                              showTitle: false,
                            ),
                          ]
                        : items.map((item) {
                            return PieChartSectionData(
                              value: item.amount,
                              color: Color(item.color),
                              radius: 35,
                              showTitle: false,
                            );
                          }).toList(),
                  ),
                ),

                /// CENTER TOTAL TEXT
                Text(
                  /// total amount show korbe
                  ///
                  /// toStringAsFixed(0)
                  /// decimal remove korbe
                  "${currencyProvider.selectedCurrency.symbol} ${total.toStringAsFixed(0)}",

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,

                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// LEGEND SECTION
          ///
          /// niche category names show korbe
          Wrap(
            spacing: 14,
            runSpacing: 8,

            children:
                /// sob item loop korbe
                items.map((item) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      /// COLOR DOT
                      Container(
                        width: 10,
                        height: 10,

                        decoration: BoxDecoration(
                          color: Color(item.color),

                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 6),

                      /// CATEGORY NAME
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
