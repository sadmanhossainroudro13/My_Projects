import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildDateTimeWidget extends StatelessWidget {
  final IconData icon;

  final String title;

  final String subtitle;

  final VoidCallback onTap;

  const BuildDateTimeWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.35),
          borderRadius: BorderRadius.circular(18),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Icon(icon, color: AppColors.hintText, size: 18),

            const SizedBox(width: 8),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.hintText,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  subtitle,

                  style: TextStyle(
                    fontSize: 9,

                    color: AppColors.hintText.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
