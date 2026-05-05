import 'package:expense_tracker/screens/homePage/Widgets/transactionTile.dart';
import 'package:flutter/material.dart';


class TransactionSection extends StatelessWidget {
  const TransactionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column( ///ListView builder later
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///  Title
          Text(
            "Recent Transactions",
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 18,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 15),

          /// 🔹 List
          const TransactionTile(
            title: "Starbucks",
            date: "Jan 12",
            amount: "-\$5.20",
          ),

          const SizedBox(height: 10),

          const TransactionTile(
            title: "Salary",
            date: "Jan 10",
            amount: "+\$1200",
          ),
        ],
      ),
    );
  }
}
