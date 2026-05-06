import 'package:expense_tracker/screens/addTransaction/add_transaction_screen.dart';
import 'package:expense_tracker/screens/budgetPage/budget_screen.dart';
import 'package:expense_tracker/screens/homePage/home_screen.dart';
import 'package:expense_tracker/screens/profileScreen/profile_screen.dart';
import 'package:expense_tracker/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    BudgetScreen(),
    AddTransactionScreen(),
    Center(child: Text("AI")),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// MAIN CONTENT (pages)
          IndexedStack(index: currentIndex, children: pages),

          ///  FLOATING NAVBAR (overlay)
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
