import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/auth/screens/login_screen.dart';
import 'package:expense_tracker/shared/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///Logout Button
        context.read<AuthProvider>().logout();
      },

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),

        decoration: BoxDecoration(
          color: AppColors.socialBg.withOpacity(0.12),

          borderRadius: BorderRadius.circular(20),

          border: Border.all(color: Colors.red.withOpacity(0.25), width: 1),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            /// 🚪 LOGOUT ICON
            Icon(Icons.logout_rounded, color: Colors.red.shade400, size: 22),

            const SizedBox(width: 10),

            /// 🔹 TEXT
            Text(
              "Log Out",

              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.red.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
