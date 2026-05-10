import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildTitleField extends StatelessWidget {
  final TextEditingController titleController;
  BuildTitleField({super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        const Text(
          "Title",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.hintText,
          ),
        ),

        const SizedBox(height: 10),

        ///  FIELD
        TextField(
          controller: titleController,
          maxLines: 1,

          decoration: InputDecoration(
            hintText: "Add title...",

            hintStyle: TextStyle(color: AppColors.hintText.withOpacity(0.45)),

            filled: true,
            fillColor: Colors.white.withOpacity(0.35),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 20,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
