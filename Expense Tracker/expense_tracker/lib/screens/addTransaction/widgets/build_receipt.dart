import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildReceipt extends StatelessWidget {
  const BuildReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 TITLE
        const Text(
          "Receipt",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.hintText,
          ),
        ),

        const SizedBox(height: 10),

        /// 🔥 RECEIPT CONTAINER
        GestureDetector(
          onTap: () {
            /// 🔥 future:
            /// image picker
            /// camera
            /// gallery
          },

          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.35),

              borderRadius: BorderRadius.circular(18),

              border: Border.all(
                color: Colors.white.withOpacity(0.25),
                width: 1,
              ),
            ),

            child: Row(
              children: [
                /// 📷 ICON BOX
                Container(
                  padding: const EdgeInsets.all(10),

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.45),
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.hintText,
                    size: 24,
                  ),
                ),

                const SizedBox(width: 14),

                /// 🔹 TEXT
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Add Receipt Photo",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintText,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        "Upload from gallery or camera",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.hintText.withOpacity(0.65),
                        ),
                      ),
                    ],
                  ),
                ),

                /// ➜ ARROW
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: AppColors.hintText.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
