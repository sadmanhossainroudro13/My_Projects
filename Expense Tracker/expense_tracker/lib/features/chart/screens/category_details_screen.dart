import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/providers/currency_provider.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String categoryName;

  const CategoryDetailsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final currencyProvider = Provider.of<CurrencyProvider>(context);
    final transactionProvider = Provider.of<TransactionProvider>(context);

    /// FILTER TRANSACTIONS
    final categoryTransactions = transactionProvider.transactions.where((
      transaction,
    ) {
      return transaction.category == categoryName;
    }).toList();

    /// TOTAL EXPENSE
    final totalExpense = categoryTransactions.fold(
      0.0,
      (sum, transaction) => sum + transaction.amount,
    );

    return Scaffold(
      backgroundColor: AppColors.socialBg,

      appBar: AppBar(
        title: Text(categoryName),

        backgroundColor: AppColors.socialBg,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// TOTAL SECTION
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: AppColors.inputBg,

                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text("Total Expense", style: TextStyle(fontSize: 14)),

                  const SizedBox(height: 10),

                  Text(
                    "${currencyProvider.selectedCurrency.symbol} ${totalExpense.toStringAsFixed(0)}",

                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Transactions",

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            /// TRANSACTION LIST
            Expanded(
              child: categoryTransactions.isEmpty
                  ? const Center(child: Text("No Transactions Found"))
                  : ListView.builder(
                      itemCount: categoryTransactions.length,

                      itemBuilder: (context, index) {
                        final transaction = categoryTransactions[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),

                          padding: const EdgeInsets.all(16),

                          decoration: BoxDecoration(
                            color: AppColors.inputBg,

                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Row(
                            children: [
                              /// ICON
                              CircleAvatar(
                                radius: 24,

                                child: Text(transaction.category[0]),
                              ),

                              const SizedBox(width: 15),

                              /// TITLE + DATE
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      transaction.title,

                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,

                                        fontSize: 16,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(transaction.date.toString()),
                                  ],
                                ),
                              ),

                              /// AMOUNT
                              Text(
                                "${currencyProvider.selectedCurrency.symbol} ${transaction.amount}",

                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,

                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
