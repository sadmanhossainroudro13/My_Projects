import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/profile/widgets/setting_tile.dart';
import 'package:flutter/material.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  /// 🔥 temporary local state
  /// later -> provider / hive

  bool notificationsEnabled = true;
  bool darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 👤 PERSONAL INFO
        SettingsTile(
          icon: Icons.person_outline,
          title: "Personal Info",

          onTap: () {
            /// future:
            /// navigate profile details
          },
        ),

        const SizedBox(height: 18),

        /// 🔐 SECURITY
        SettingsTile(
          icon: Icons.shield_outlined,
          title: "Security & Login",

          onTap: () {
            /// future:
            /// security page
          },
        ),

        const SizedBox(height: 18),

        /// 🔔 NOTIFICATIONS
        SettingsTile(
          icon: Icons.notifications_none,
          title: "Notifications",

          trailing: Switch(
            value: notificationsEnabled,

            activeColor: AppColors.primary,

            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
        ),

        const SizedBox(height: 18),

        /// 💱 CURRENCY
        SettingsTile(
          icon: Icons.currency_exchange,
          title: "Currency Converter",

          onTap: () {
            /// future:
            /// currency page
          },
        ),

        const SizedBox(height: 18),

        /// 📤 EXPORT DATA
        // SettingsTile(
        //   icon: Icons.download_outlined,
        //   title: "Export Data",

        //   subtitle: "CSV/PDF details",

        //   onTap: () {
        //     /// future:
        //     /// export csv/pdf
        //   },
        // ),
        const SizedBox(height: 18),

        /// 🌙 APP THEME
        SettingsTile(
          icon: Icons.dark_mode_outlined,
          title: "App Theme",

          trailing: Switch(
            value: darkThemeEnabled,

            activeColor: AppColors.primary,

            onChanged: (value) {
              setState(() {
                darkThemeEnabled = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
