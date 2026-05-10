import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String email;
  final String imagePath;

  final VoidCallback? onEditTap;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.email,
    required this.imagePath,  
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: Column(
        children: [
          /// 🔹 TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              GestureDetector(
                onTap: onEditTap,

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.bgLight.withOpacity(0.7),

                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: const Text(
                    "Edit Profile",

                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// 🔥 PROFILE IMAGE
          Container(
            padding: const EdgeInsets.all(2),

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              border: Border.all(color: AppColors.primary, width: 2.5),
            ),

            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(imagePath),
            ),
          ),

          const SizedBox(height: 15),

          /// 👤 USER NAME
          Text(
            userName,

            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          /// 📧 EMAIL
          Text(
            email,

            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.secondaryText,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
