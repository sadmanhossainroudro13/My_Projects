import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/profile/screens/currency_screen.dart';
import 'package:expense_tracker/features/profile/widgets/setting_tile.dart';
import 'package:expense_tracker/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final notificationProvider = Provider.of<NotificationProvider>(context);
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
            value: notificationProvider.notificationEnabled,

            activeColor: AppColors.primary,

            onChanged: (value) {
              notificationProvider.toggleNotification(value);
            },
          ),
        ),

        const SizedBox(height: 18),

        /// 💱 CURRENCY
        SettingsTile(
          icon: Icons.currency_exchange,
          title: "Currency Converter",

          onTap: () {
            Navigator.push(
              context,

              MaterialPageRoute(builder: (context) => const CurrencyScreen()),
            );
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
      ],
    );
  }
}
