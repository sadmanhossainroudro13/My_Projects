import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildNoteField extends StatelessWidget {
  const BuildNoteField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 TITLE
        const Text(
          "Note",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.hintText,
          ),
        ),

        const SizedBox(height: 10),

        /// 🔹 FIELD
        TextField(
          maxLines: 2,

          decoration: InputDecoration(
            hintText: "Add note (optional)...",

            hintStyle: TextStyle(color: AppColors.hintText.withOpacity(0.45)),

            filled: true,
            fillColor: Colors.white.withOpacity(0.35),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
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
