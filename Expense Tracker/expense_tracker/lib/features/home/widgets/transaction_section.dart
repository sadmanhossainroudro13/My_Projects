import 'package:expense_tracker/features/home/widgets/transactionTile.dart';
import 'package:expense_tracker/features/transaction/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionSection extends StatefulWidget {
  const TransactionSection({super.key});

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  /// initially only 5 transactions show
  bool seeAll = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final transactionProvider = Provider.of<TransactionProvider>(context);

    final transactions = transactionProvider.transactions;

    final visibleTransactions = seeAll
        ? transactions
        : transactions.take(5).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// TITLE + SEE ALL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "Recent Transactions",

                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),

              if (transactions.length > 5)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      seeAll = !seeAll;
                    });
                  },

                  child: Text(
                    seeAll ? "Show Less" : "See All",

                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 15),

          /// EMPTY STATE
          if (transactions.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30),

                child: Text("No transactions yet"),
              ),
            ),

          /// TRANSACTION LIST
          ...List.generate(visibleTransactions.length, (index) {
            final transaction = visibleTransactions[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),

              child: TransactionTile(
                title: transaction.title,

                date:
                    "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}",

                amount: transaction.isExpense
                    ? "-\$${transaction.amount}"
                    : "+\$${transaction.amount}",
              ),
            );
          }),
        ],
      ),
    );
  }
}
