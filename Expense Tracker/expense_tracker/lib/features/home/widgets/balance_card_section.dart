import 'package:expense_tracker/features/home/widgets/balance_card.dart';
import 'package:expense_tracker/features/transaction/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalanceCardSection extends StatelessWidget {
  const BalanceCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          Expanded(child: BalanceCard(isIncome: true)),
          SizedBox(width: 12),
          Expanded(child: BalanceCard(isIncome: false)),
        ],
      ),
    );
  }
}
