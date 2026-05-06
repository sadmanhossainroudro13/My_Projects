import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildDateTime extends StatelessWidget {
  const BuildDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _infoCard(
            icon: Icons.calendar_today_outlined,
            title: "Date",
            subtitle: "Today, Oct 15",
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _infoCard(
            icon: Icons.access_time_outlined,
            title: "Time",
            subtitle: "12:30 PM",
          ),
        ),
      ],
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.35),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.hintText, size: 22),

          const SizedBox(width: 10),

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
                  fontSize: 13,
                  color: AppColors.hintText.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
