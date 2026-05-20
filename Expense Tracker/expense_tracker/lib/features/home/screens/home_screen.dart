import 'package:expense_tracker/features/home/widgets/balance_card_section.dart';
import 'package:expense_tracker/features/home/widgets/daily_budget_card.dart';
import 'package:expense_tracker/features/home/widgets/header_section.dart';
import 'package:expense_tracker/features/home/widgets/hidden_amount_widget.dart';
import 'package:expense_tracker/features/home/widgets/light_background.dart';
import 'package:expense_tracker/features/home/widgets/transaction_section.dart';
import 'package:expense_tracker/core/widgets/background_screen.dart';
import 'package:expense_tracker/providers/currency_provider.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final currencyProvider = Provider.of<CurrencyProvider>(context);

final transactionProvider = Provider.of<TransactionProvider>(context);
    return BackgroundScreen(
      customChild: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: HeaderSection(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: HiddenAmountWidget(amount: "${currencyProvider.selectedCurrency.symbol} ${transactionProvider.totalBalance}"),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DailyBudgetCard(),
            ),

            BalanceCardSection(),

            const SizedBox(height: 20),

            ///   MAIN BODY (STACK PART)
            Expanded(
              child: Stack(
                children: [
                  ///LIGHT BACKGROUND (rounded top)
                  const LightBackground(),

                  ///  CONTENT ABOVE BACKGROUND
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        ///  TRANSACTIONS
                        TransactionSection(),

                        const SizedBox(height: 90),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
