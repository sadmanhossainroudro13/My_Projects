import 'package:expense_tracker/core/links/image_links.dart';
import 'package:expense_tracker/screens/profileScreen/widgets/logout_button.dart';
import 'package:expense_tracker/screens/profileScreen/widgets/profile_header.dart';
import 'package:expense_tracker/screens/profileScreen/widgets/settings_section.dart';
import 'package:expense_tracker/widgets/background_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      customChild: SafeArea(
        child: Column(
          children: [
            ///  1. PROFILE HEADER
            const SizedBox(height: 10),

            ProfileHeader(
              userName: "Sadman Roudro",
              email: "shadmanroudro@gmail.com",
              imagePath: ImageLinks.demoProfile,
            ),

            const SizedBox(height: 20),

            ///  2. MAIN LIGHT CONTAINER
            Expanded(
              child: Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),

                decoration: const BoxDecoration(
                  color: Color(0xFFDCE1B4),

                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                ),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),

                      /// 👤 4. SETTINGS SECTION
                      SettingsSection(),

                      const SizedBox(height: 30),

                      // /// 📂 5. DATA CONTROL TITLE
                      // const Text(
                      //   "Data Control Section",

                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w600,
                      //     color: Colors.black87,
                      //   ),
                      // ),
                      const SizedBox(height: 20),

                      /// 🚪 6. LOGOUT BUTTON
                      LogoutButton(),

                      const SizedBox(height: 40),

                      /// 📄 7. VERSION TEXT
                      const Center(
                        child: Text(
                          "Version 1.0.0",

                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ),

                      /// 🔻 NAVBAR SPACE
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
