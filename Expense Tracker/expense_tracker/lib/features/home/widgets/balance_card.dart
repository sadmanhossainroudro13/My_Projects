import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/providers/currency_provider.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalanceCard extends StatelessWidget {
  final bool isIncome;

  const BalanceCard({super.key, required this.isIncome});

  @override
  Widget build(BuildContext context) {
    final currencyProvider = Provider.of<CurrencyProvider>(context);
    final provider = Provider.of<TransactionProvider>(context);

    final theme = Theme.of(context);

    /// MONTHLY TOTAL
    final amount = isIncome
        ? provider.currentMonthIncome
        : provider.currentMonthExpense;

    /// DYNAMIC GRAPH DATA
    final spots = provider.getMonthlySpots(isIncome: isIncome);

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
          /// TOP ROW
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),

                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),

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

          /// MONTH LABEL
          Text(
            "Monthly",

            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.bgDark,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 6),

          /// AMOUNT + PERCENTAGE
          Row(
            children: [
              /// DYNAMIC MONTHLY TOTAL
              Text(
                "${currencyProvider.selectedCurrency.symbol} ${amount.toStringAsFixed(2)}",

                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),

              const SizedBox(width: 6),

              /// STATIC PERCENTAGE
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

          /// SMALL TEXT
          Text(
            "This month activity",

            style: TextStyle(fontSize: 10, color: AppColors.bgLight),
          ),

          const Spacer(),

          /// DYNAMIC GRAPH
          SizedBox(
            height: 35,

            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),

                titlesData: FlTitlesData(show: false),

                borderData: FlBorderData(show: false),

                lineBarsData: [
                  LineChartBarData(
                    /// REAL DYNAMIC GRAPH
                    spots: spots,

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
