import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildCategoryChips extends StatefulWidget {
  const BuildCategoryChips({super.key});

  @override
  State<BuildCategoryChips> createState() => _BuildCategoryChipsState();
}

class _BuildCategoryChipsState extends State<BuildCategoryChips> {
  int selectedIndex = 0;

  /// 🔥 Dummy categories
  /// later -> provider / hive / database
  final List<Map<String, dynamic>> categories = [
    {"title": "Food", "icon": Icons.restaurant, "color": Color(0xFFE5CF45)},
    {
      "title": "Transport",
      "icon": Icons.directions_car,
      "color": Color(0xFF7EC8FF),
    },
    {
      "title": "Shopping",
      "icon": Icons.shopping_cart_outlined,
      "color": Color(0xFF7EDC8A),
    },
    {
      "title": "Utilities",
      "icon": Icons.build_outlined,
      "color": Color(0xFF63E0E8),
    },
    {
      "title": "Misc",
      "icon": Icons.category_outlined,
      "color": Color(0xFFD2D2D2),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 TITLE
        const Text(
          "Category Chips",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.hintText,
          ),
        ),

        const SizedBox(height: 12),

        /// 🔥 HORIZONTAL CHIPS
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          child: Row(
            children: List.generate(categories.length, (index) {
              final item = categories[index];

              final bool isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),

                  width: 78,
                  height: 78,

                  margin: const EdgeInsets.only(right: 10),

                  decoration: BoxDecoration(
                    color: item["color"],

                    borderRadius: BorderRadius.circular(18),

                    boxShadow: [
                      BoxShadow(
                        color: item["color"].withOpacity(
                          isSelected ? 0.45 : 0.18,
                        ),

                        blurRadius: isSelected ? 10 : 4,
                        offset: const Offset(0, 4),
                      ),
                    ],

                    border: isSelected
                        ? Border.all(
                            color: AppColors.bgLight.withOpacity(0.7),
                            width: 2,
                          )
                        : null,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// 🔹 ICON
                      Icon(item["icon"], size: 24, color: AppColors.bgDark),

                      const SizedBox(height: 6),

                      /// 🔹 TEXT
                      Text(
                        item["title"],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.bgDark,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
