import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const Color bgDark = Color.fromARGB(255, 32, 37, 37);
  static const Color bgLight = Color(0xFF1F3D3D);

  // Primary (gold)
  static const Color primary = Color(0xFFD4C25A);

  // Input field
  static const Color inputBg = Color(0xFFD2D99A);
  static const Color hintText = Color(0xFF0F2A2A);

  // Text
  static const Color secondaryText = Color(0xFFBFC3A4);
  static const Color textColor = Color(0xFFD2D99A);

  // Social button
  static const Color socialBg = Color(0xFFF1F2D9);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Playwrite',
    scaffoldBackgroundColor: AppColors.bgDark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBg,

      hintStyle: const TextStyle(color: AppColors.hintText, fontSize: 20),

      prefixIconColor: Colors.black54,
      suffixIconColor: Colors.black54,

      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      bodySmall: TextStyle(fontSize: 14, color: AppColors.secondaryText),
    ),
  );
}
