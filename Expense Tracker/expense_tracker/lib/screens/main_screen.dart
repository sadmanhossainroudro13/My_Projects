import 'package:expense_tracker/screens/budgetPage/budget_screen.dart';
import 'package:expense_tracker/screens/homePage/home_screen.dart';
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
    Center(child: Text("Add")),
    Center(child: Text("AI")),
    Center(child: Text("Profile")),
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
            bottom: 0,
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
