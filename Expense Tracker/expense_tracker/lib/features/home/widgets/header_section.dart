import 'package:expense_tracker/core/constants/image_links.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Row 1 (Greeting + profile)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(
                  "Good morning",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ///Name
                  "Roudro",
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),

            Row(
              children: [
                const CircleAvatar(
                  radius: 20,

                  ///profile image
                  backgroundImage: AssetImage(ImageLinks.demoProfile),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.bgLight,
                  ),
                  child: const Icon(
                    ///Notification Icon
                    Icons.notifications_none,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// Wallet section
        Text(
          "My Wallet",
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
