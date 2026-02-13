import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class AppTheme {
  static ThemeData get light => _buildTheme(Brightness.light);
  static ThemeData get dark => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final primaryColor = isDark ? const Color(0xFF3B82F6) : AppDesign.primary;
    final backgroundColor =
        isDark ? AppDesign.backgroundDark : AppDesign.backgroundLight;
    final cardColor = isDark ? AppDesign.cardDark : AppDesign.cardLight;
    final textColor = isDark ? AppDesign.white : AppDesign.textHigh;
    final dividerColor =
        isDark ? AppDesign.dividerDark : AppDesign.dividerLight;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppDesign.primary,
        brightness: brightness,
        primary: primaryColor,
        secondary: AppDesign.secondary,
        surface: backgroundColor,
        onSurface: textColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      dividerColor: dividerColor,
      textTheme: _buildTextTheme(textColor, isDark),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? AppDesign.cardDark : AppDesign.white,
        foregroundColor: textColor,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: AppDesign.transparent,
        titleTextStyle: TextStyle(
          fontSize: AppDesign.fontL,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
        iconTheme: IconThemeData(color: textColor),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        surfaceTintColor: cardColor,
        elevation: 0,
        shadowColor: AppDesign.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: AppDesign.borderMedium,
          side: BorderSide(color: dividerColor),
        ),
        margin: EdgeInsets.symmetric(
          vertical: AppDesign.spaceS,
          horizontal: AppDesign.paddingS,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppDesign.primary,
          foregroundColor: AppDesign.textOnPrimary,
          elevation: 0,
          shadowColor: AppDesign.transparent,
          padding: EdgeInsets.symmetric(
            vertical: AppDesign.spaceM,
            horizontal: AppDesign.paddingL,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppDesign.borderMedium,
          ),
          textStyle: TextStyle(
            fontSize: AppDesign.fontM,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? AppDesign.cardDark : AppDesign.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDesign.paddingL,
          vertical: AppDesign.spaceM,
        ),
        hintStyle: TextStyle(
          fontSize: AppDesign.fontM,
          color: isDark ? const Color(0xFF64748B) : AppDesign.textLow,
        ),
        labelStyle: TextStyle(
          fontSize: AppDesign.fontM,
          color: isDark ? const Color(0xFF94A3B8) : AppDesign.secondary,
        ),
        border: OutlineInputBorder(
          borderRadius: AppDesign.borderMedium,
          borderSide: BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppDesign.borderMedium,
          borderSide: BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppDesign.borderMedium,
          borderSide: BorderSide(
            color: isDark ? const Color(0xFF3B82F6) : AppDesign.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppDesign.borderMedium,
          borderSide: const BorderSide(
            color: AppDesign.error,
            width: 1,
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: AppDesign.borderMedium,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static TextTheme _buildTextTheme(Color color, bool isDark) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: AppDesign.fontDisplay,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: color,
      ),
      displayMedium: TextStyle(
        fontSize: AppDesign.fontXXL,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: color,
      ),
      headlineMedium: TextStyle(
        fontSize: AppDesign.fontXL,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineSmall: TextStyle(
        fontSize: AppDesign.fontXL,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      titleLarge: TextStyle(
        fontSize: AppDesign.fontL,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      bodyLarge: TextStyle(
        fontSize: AppDesign.fontL,
        color: color,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: AppDesign.fontM,
        color: AppDesign.secondary,
        height: 1.5,
      ),
      labelLarge: TextStyle(
        fontSize: AppDesign.fontM,
        fontWeight: FontWeight.bold,
        color: AppDesign.secondary,
      ),
      labelSmall: TextStyle(
        fontSize: AppDesign.fontS,
        fontWeight: FontWeight.normal,
        color: isDark ? const Color(0xFF64748B) : AppDesign.textLow,
      ),
    );
  }
}
