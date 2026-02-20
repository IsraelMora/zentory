import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_ui_constants.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightLavender,
        onPrimary: AppColors.lightBase,
        secondary: AppColors.lightSapphire,
        onSecondary: AppColors.lightBase,
        surface: AppColors.lightBase,
        onSurface: AppColors.lightText,
        error: AppColors.lightRed,
        onError: AppColors.lightBase,
      ),
      scaffoldBackgroundColor: AppColors.lightBase,
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).apply(
        bodyColor: AppColors.lightText,
        displayColor: AppColors.lightText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightMantle,
        foregroundColor: AppColors.lightText,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightSurface0,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.lg,
          side: const BorderSide(color: AppColors.lightCrust, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface0,
        hintStyle: const TextStyle(color: AppColors.lightOverlay0),
        border: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(color: AppColors.lightSurface1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(color: AppColors.lightSurface1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(
            color: AppColors.lightLavender,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(color: AppColors.lightRed),
        ),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkLavender,
        onPrimary: AppColors.darkBase,
        secondary: AppColors.darkSapphire,
        onSecondary: AppColors.darkBase,
        surface: AppColors.darkBase,
        onSurface: AppColors.darkText,
        error: AppColors.darkRed,
        onError: AppColors.darkBase,
      ),
      scaffoldBackgroundColor: AppColors.darkBase,
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: AppColors.darkText, displayColor: AppColors.darkText),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkMantle,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkSurface0,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.lg,
          side: const BorderSide(color: AppColors.darkCrust, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface0,
        hintStyle: const TextStyle(color: AppColors.darkOverlay0),
        border: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(color: AppColors.darkSurface1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(color: AppColors.darkSurface1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(color: AppColors.darkLavender, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(color: AppColors.darkRed),
        ),
      ),
    );
  }
}
