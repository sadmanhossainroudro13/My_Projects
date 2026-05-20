import 'package:flutter/material.dart';
import 'package:expense_tracker/providers/balance_visible_provider.dart';
import 'package:provider/provider.dart';

class HiddenAmountWidget extends StatelessWidget {
  final String amount;
  const HiddenAmountWidget({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final balanceProvider = Provider.of<BalanceVisibleProvider>(context);
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Text(
            ///Dollar
            balanceProvider.isHidden
                ? "* * * * *"
                : amount,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(width: 20),
          //eye Icon
          GestureDetector(
            onTap: () {
              balanceProvider.toggleBalanceVisibility();
            },
            child: Icon(
              balanceProvider.isHidden
                  ? Icons.visibility_off
                  : Icons.visibility,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
