import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/providers/currency_provider.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyBudgetCard extends StatelessWidget {
  const DailyBudgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyProvider = Provider.of<CurrencyProvider>(context);
    final transactionProvider = Provider.of<TransactionProvider>(context);

    final dailyLimit = transactionProvider.dailyLimit;

    final todayExpense = transactionProvider.todayExpense;

    final difference = transactionProvider.budgetDifference;

    final isOverBudget = transactionProvider.isOverBudget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        /// DAILY LIMIT
        Text(
          "Daily Limit : ${currencyProvider.selectedCurrency.symbol} ${dailyLimit.toStringAsFixed(0)}",

          style: const TextStyle(
            fontSize: 15,

            fontWeight: FontWeight.w600,

            color: AppColors.textColor,
          ),
        ),

        const SizedBox(height: 8),

        /// TODAY EXPENSE
        Text(
          "Today's Expense: ${currencyProvider.selectedCurrency.symbol} ${todayExpense.toStringAsFixed(0)}",

          style: const TextStyle(
            fontSize: 15,

            fontWeight: FontWeight.w600,

            color: AppColors.textColor,
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            /// STATUS
            Text(
              isOverBudget
                  ? "Unsafe by ${currencyProvider.selectedCurrency.symbol} ${difference.abs().toStringAsFixed(0)}"
                  : "Safe by ${currencyProvider.selectedCurrency.symbol} ${difference.toStringAsFixed(0)}",

              style: TextStyle(
                fontSize: 15,

                fontWeight: FontWeight.bold,

                color: isOverBudget ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),

        SizedBox(height: 10),
      ],
    );
  }
}
