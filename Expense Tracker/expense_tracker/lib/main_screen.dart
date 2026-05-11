import 'package:expense_tracker/features/transaction/screens/add_transaction_screen.dart';
import 'package:expense_tracker/features/chart/screens/chart_screen.dart';
import 'package:expense_tracker/features/home/screens/home_screen.dart';
import 'package:expense_tracker/features/profile/screens/profile_screen.dart';
import 'package:expense_tracker/core/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// MAIN CONTENT
          IndexedStack(
            index: currentIndex,

            children: [
              const HomeScreen(),

              /// CHART SCREEN
              /// everytime rebuild -> fresh state
              ChartScreen(key: UniqueKey()),

              const AddTransactionScreen(),

              const Center(child: Text("AI")),

              const ProfileScreen(),
            ],
          ),

          /// FLOATING NAVBAR
          Positioned(
            bottom: 5,
            left: 6,
            right: 6,

            child: CustomNavbar(
              currentIndex: currentIndex,

              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
