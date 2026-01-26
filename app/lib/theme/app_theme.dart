import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary colors
  static const primaryBlue = Color(0xFF2563EB);
  static const primaryIndigo = Color(0xFF4F46E5);
  static const primaryPurple = Color(0xFF6366F1);

  // Background colors
  static const backgroundLight = Color(0xFFF9FAFB);
  static const backgroundWhite = Colors.white;

  // Text colors
  static const textDark = Color(0xFF111827);
  static const textGray = Color(0xFF6B7280);
  static const textLight = Color(0xFF9CA3AF);

  // Border colors
  static const borderLight = Color(0xFFE5E7EB);
  static const borderFocus = primaryBlue;

  // Accent colors
  static const accentBlueLight = Color(0xFFBFDBFE);
  static const accentBlueLighter = Color(0xFFDEEAFF);

  // Gradients
  static const primaryGradient = LinearGradient(
    colors: [primaryBlue, primaryIndigo, primaryPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const buttonGradient = LinearGradient(
    colors: [primaryBlue, primaryIndigo],
  );

  // Shadows
  static BoxShadow cardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 10,
    offset: const Offset(0, 2),
  );

  static BoxShadow buttonShadow = BoxShadow(
    color: primaryBlue.withOpacity(0.3),
    blurRadius: 20,
    offset: const Offset(0, 10),
  );

  // Border radius
  static const borderRadiusSmall = 8.0;
  static const borderRadiusMedium = 12.0;
  static const borderRadiusLarge = 16.0;
  static const borderRadiusXLarge = 24.0;

  // Theme data
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: primaryIndigo,
      ),
      scaffoldBackgroundColor: backgroundLight,
      textTheme: GoogleFonts.interTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundWhite,
        elevation: 0,
        iconTheme: IconThemeData(color: textDark),
        titleTextStyle: TextStyle(
          color: primaryBlue,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusMedium),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: backgroundWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: const BorderSide(color: borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: const BorderSide(color: borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: const BorderSide(color: borderFocus, width: 2),
        ),
      ),
    );
  }
}
