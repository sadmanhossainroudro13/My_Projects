import 'package:expense_tracker/screens/homePage/Widgets/balance_card_section.dart';
import 'package:expense_tracker/screens/homePage/Widgets/goals_section.dart';
import 'package:expense_tracker/screens/homePage/Widgets/header_section.dart';
import 'package:expense_tracker/screens/homePage/Widgets/light_background.dart';
import 'package:expense_tracker/screens/homePage/Widgets/transaction_section.dart';
import 'package:expense_tracker/widgets/background_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      customChild: SafeArea(
        child: Column(
          children: [
            /// HEADER
            const HeaderSection(),

            BalanceCardSection(),

            const SizedBox(height: 20),

            /// 🟡 2. MAIN BODY (STACK PART)
            Expanded(
              child: Stack(
                children: [
                  ///LIGHT BACKGROUND (rounded top)
                  const LightBackground(),

                  /// 🔼 CONTENT ABOVE BACKGROUND
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        /// 🎯 4. GOALS
                        const GoalsSection(),

                        const SizedBox(height: 20),

                        /// 5. TRANSACTIONS
                        const TransactionSection(),

                        const SizedBox(height: 50),
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
