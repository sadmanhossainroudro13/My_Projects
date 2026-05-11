import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final bool isIncome;

  const BalanceCard({super.key, required this.isIncome});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 150,
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isIncome ? AppColors.primary : AppColors.inputBg,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),

                //  arrow down = income, up = spending
                child: Icon(
                  isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 12,
                ),
              ),

              const SizedBox(width: 6),

              Text(
                isIncome ? "Income" : "Spendings",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          ///  2. Monthly লেখা
          Text(
            "Monthly",
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.bgDark,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 6),

          ///  3. Amount + Percentage
          Row(
            children: [
              Text(
                "\$365.51",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),

              const SizedBox(width: 6),

              ///percentage badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isIncome
                      ? Colors.green.withOpacity(0.6)
                      : Colors.red.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Text(
                  isIncome ? "+0.7%" : "-1.3%",
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 2),

          ///   Small sub amount
          Text(
            "\$307.67",
            style: TextStyle(fontSize: 10, color: AppColors.bgLight),
          ),

          const Spacer(),

          ///  GRAPH (main magic part)
          SizedBox(
            height: 35,

            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),

                titlesData: FlTitlesData(show: false),

                ///  border remove
                borderData: FlBorderData(show: false),

                lineBarsData: [
                  LineChartBarData(
                    ///  graph points (x, y)
                    spots: isIncome
                        ? const [
                            FlSpot(0, 2),
                            FlSpot(1, 2.5),
                            FlSpot(2, 2.2),
                            FlSpot(3, 3.5),
                            FlSpot(4, 3),
                            FlSpot(5, 4),
                          ]
                        : const [
                            FlSpot(0, 4),
                            FlSpot(1, 3),
                            FlSpot(2, 2.5),
                            FlSpot(3, 2.1),
                            FlSpot(4, 1.5),
                            FlSpot(5, 1),
                          ],

                    color: isIncome ? Colors.green : Colors.red,
                    barWidth: 1.5,
                    dotData: FlDotData(show: false),

                    belowBarData: BarAreaData(
                      show: true,
                      color: isIncome
                          ? Colors.green.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
