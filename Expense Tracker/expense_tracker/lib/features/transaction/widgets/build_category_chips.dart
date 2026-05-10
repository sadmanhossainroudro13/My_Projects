import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/transaction/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildCategoryChips extends StatefulWidget {
  final String selectedCategory;

  final Function(String category) onCategorySelected;

  BuildCategoryChips({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  State<BuildCategoryChips> createState() => _BuildCategoryChipsState();
}

class _BuildCategoryChipsState extends State<BuildCategoryChips> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    final categories = categoryProvider.categories;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.hintText,
          ),
        ),

        SizedBox(height: 12),

        /// HORIZONTAL CHIPS
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          child: Row(
            children: List.generate(categories.length, (index) {
              final item = categories[index];

              final bool isSelected = widget.selectedCategory == item.title;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onCategorySelected(item.title);
                  });
                },

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),

                  width: 98,
                  height: 78,

                  margin: const EdgeInsets.only(right: 10),

                  decoration: BoxDecoration(
                    color: item.color,

                    borderRadius: BorderRadius.circular(18),

                    boxShadow: [
                      BoxShadow(
                        color: item.color.withOpacity(isSelected ? 0.45 : 0.18),

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
                      /// ICON
                      Icon(item.icon, size: 24, color: AppColors.bgDark),

                      const SizedBox(height: 6),

                      /// TEXT
                      Text(
                        item.title,
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
