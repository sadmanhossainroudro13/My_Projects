import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildAmount extends StatelessWidget {
  const BuildAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///  Title
        const Text(
          "Amount",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.hintText,
          ),
        ),

        const SizedBox(height: 10),

        ///  Amount Box
        GestureDetector(
          onTap: () {
            print("Amount Tapped");
          }, //Add amount feature later
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 25),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.35),
            ),

            child: const Center(
              child: Text(
                "\$ 0.00",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.bgLight,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
