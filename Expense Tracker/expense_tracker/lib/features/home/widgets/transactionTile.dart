import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;

  final VoidCallback onDelete;

  const TransactionTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = amount.startsWith("+");

    return Dismissible(
      key: UniqueKey(),

      direction: DismissDirection.endToStart,

      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,

        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),

        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),

      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,

          builder: (context) {
            return AlertDialog(
              title: const Text("Delete Transaction"),
              content: const Text(
                "Are you sure you want to delete this transaction?",
              ),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },

                  child: const Text("Cancel"),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },

                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
      },

      onDismissed: (direction) {
        onDelete();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Transaction Deleted"),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: AppColors.socialBg,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Row(
          children: [
            /// ICON
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.textColor,

              child: const Icon(
                Icons.attach_money,
                size: 18,
              ),
            ),

            const SizedBox(width: 12),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    date,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            /// AMOUNT
            Text(
              amount,

              style: TextStyle(
                color: isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}