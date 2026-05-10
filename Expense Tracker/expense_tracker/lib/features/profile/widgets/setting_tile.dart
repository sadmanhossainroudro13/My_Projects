import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;

  final String? subtitle;

  final Widget? trailing;

  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Row(
        children: [
          /// 🔹 ICON BOX
          Container(
            width: 42,
            height: 42,

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.35),

              shape: BoxShape.circle,
            ),

            child: Icon(icon, color: AppColors.hintText, size: 22),
          ),

          const SizedBox(width: 15),

          /// 🔹 TEXTS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintText,
                  ),
                ),

                if (subtitle != null) ...[
                  const SizedBox(height: 2),

                  Text(
                    subtitle!,

                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.hintText.withOpacity(0.6),
                    ),
                  ),
                ],
              ],
            ),
          ),

          /// 🔹 TRAILING
          trailing ??
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: AppColors.hintText.withOpacity(0.5),
              ),
        ],
      ),
    );
  }
}
