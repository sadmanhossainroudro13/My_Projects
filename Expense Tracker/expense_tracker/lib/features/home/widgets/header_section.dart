import 'package:expense_tracker/core/constants/image_links.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/transaction/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Row 1 (Greeting + profile)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Good morning",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ///Name
                    "Roudro",
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),

              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,

                    ///profile image
                    backgroundImage: AssetImage(ImageLinks.demoProfile),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.bgLight,
                    ),
                    child: const Icon(
                      ///Notification Icon
                      Icons.notifications_none,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// Wallet section
          Text(
            "My Wallet",
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              Text(
                ///Dollar
                "\$ ${transactionProvider.totalBalance}",
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(width: 20),
              //eye Icon
              const Icon(Icons.visibility_off, size: 18, color: Colors.white),
            ],
          ),

          const SizedBox(height: 8),

          /// Small badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Todays Expense: \$${transactionProvider.todayExpense}",
              style: TextStyle(color: AppColors.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
