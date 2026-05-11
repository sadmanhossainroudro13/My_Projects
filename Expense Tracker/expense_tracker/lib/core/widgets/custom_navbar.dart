import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.bgLight,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _item(0, Icons.home, "Home"),
          _item(1, Icons.pie_chart_sharp, "Chart"),
          _item(2, Icons.add, "Add"),
          _item(3, Icons.auto_awesome, "AI"),
          _item(4, Icons.person, "Profile"),
        ],
      ),
    );
  }

  //item widget
  Widget _item(int index, IconData icon, String label) {
    final isActive = widget.currentIndex == index;

    return GestureDetector(
      onTap: () => widget.onTap(index),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? AppColors.primary : AppColors.inputBg),
          if (label.isNotEmpty)
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? AppColors.primary : AppColors.inputBg,
              ),
            ),
        ],
      ),
    );
  }
}
