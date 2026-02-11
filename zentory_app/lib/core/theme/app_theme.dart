import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppDesign.primary,
          primary: AppDesign.primary,
          secondary: AppDesign.secondary,
          surface: AppDesign.backgroundLight,
          onSurface: const Color(0xFF1E293B),
        ),
        scaffoldBackgroundColor: AppDesign.backgroundLight,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: AppDesign.fontDisplay,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            color: const Color(0xFF1E293B),
          ),
          displayMedium: TextStyle(
            fontSize: AppDesign.fontXXL,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            color: const Color(0xFF1E293B),
          ),
          headlineMedium: TextStyle(
            fontSize: AppDesign.fontXL,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
          headlineSmall: TextStyle(
            fontSize: AppDesign.fontXL,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
          titleLarge: TextStyle(
            fontSize: AppDesign.fontL,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
          bodyLarge: TextStyle(
            fontSize: AppDesign.fontL,
            color: const Color(0xFF1E293B),
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
            color: const Color(0xFF94A3B8),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1E293B),
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: AppDesign.fontL,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
          iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        ),
        cardTheme: CardThemeData(
          color: AppDesign.cardLight,
          surfaceTintColor: AppDesign.cardLight,
          elevation: 2,
          shadowColor: Colors.black.withValues(alpha: 0.05),
          shape: RoundedRectangleBorder(
            borderRadius: AppDesign.borderMedium,
          ),
          margin: EdgeInsets.symmetric(
            vertical: AppDesign.spaceS,
            horizontal: AppDesign.paddingS,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppDesign.primary,
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: AppDesign.primary.withValues(alpha: 0.4),
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
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDesign.paddingL,
            vertical: AppDesign.spaceM,
          ),
          hintStyle: TextStyle(
            fontSize: AppDesign.fontM,
            color: const Color(0xFF94A3B8),
          ),
          labelStyle: TextStyle(
            fontSize: AppDesign.fontM,
            color: AppDesign.secondary,
          ),
          border: OutlineInputBorder(
            borderRadius: AppDesign.borderMedium,
            borderSide: const BorderSide(color: AppDesign.dividerLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppDesign.borderMedium,
            borderSide: const BorderSide(color: AppDesign.dividerLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppDesign.borderMedium,
            borderSide: const BorderSide(
              color: AppDesign.primary,
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

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppDesign.primary,
          brightness: Brightness.dark,
          primary: const Color(0xFF3B82F6),
          secondary: AppDesign.secondary,
          surface: AppDesign.backgroundDark,
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: AppDesign.backgroundDark,
        cardColor: AppDesign.cardDark,
        dividerColor: AppDesign.dividerDark,
        appBarTheme: AppBarTheme(
          backgroundColor: AppDesign.cardDark,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: AppDesign.fontL,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: AppDesign.fontDisplay,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: AppDesign.fontXXL,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontSize: AppDesign.fontXL,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: AppDesign.fontXL,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontSize: AppDesign.fontL,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: AppDesign.fontL,
            color: Colors.white,
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
            color: const Color(0xFF64748B),
          ),
        ),
        cardTheme: CardThemeData(
          color: AppDesign.cardDark,
          surfaceTintColor: AppDesign.cardDark,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: AppDesign.borderMedium,
            side: const BorderSide(color: AppDesign.dividerDark),
          ),
          margin: EdgeInsets.symmetric(
            vertical: AppDesign.spaceS,
            horizontal: AppDesign.paddingS,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppDesign.primary,
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: AppDesign.primary.withValues(alpha: 0.4),
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
          fillColor: AppDesign.cardDark,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDesign.paddingL,
            vertical: AppDesign.spaceM,
          ),
          hintStyle: TextStyle(
            fontSize: AppDesign.fontM,
            color: const Color(0xFF64748B),
          ),
          labelStyle: TextStyle(
            fontSize: AppDesign.fontM,
            color: const Color(0xFF94A3B8),
          ),
          border: OutlineInputBorder(
            borderRadius: AppDesign.borderMedium,
            borderSide: const BorderSide(color: AppDesign.dividerDark),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppDesign.borderMedium,
            borderSide: const BorderSide(color: AppDesign.dividerDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppDesign.borderMedium,
            borderSide: const BorderSide(
              color: Color(0xFF3B82F6),
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
