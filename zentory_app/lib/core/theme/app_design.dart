import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppDesign {
  // --- Colores ---
  static const Color primary = Color(0xFF2563EB);
  static const Color secondary = Color(0xFF64748B);
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF1E293B);
  static const Color dividerLight = Color(0xFFE2E8F0);
  static const Color dividerDark = Color(0xFF334155);
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);

  // --- Border Radii ---
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;
  static const double radiusExtraLarge = 32.0;

  static BorderRadius get borderSmall => BorderRadius.circular(radiusSmall);
  static BorderRadius get borderMedium => BorderRadius.circular(radiusMedium);
  static BorderRadius get borderLarge => BorderRadius.circular(radiusLarge);
  static BorderRadius get borderExtraLarge =>
      BorderRadius.circular(radiusExtraLarge);

  // --- Spacing (Padding/Margins) ---
  static double get spaceXS => 0.5.h;
  static double get spaceS => 1.0.h;
  static double get spaceM => 2.0.h;
  static double get spaceL => 3.0.h;
  static double get spaceXL => 4.0.h;

  static double get paddingXS => 1.w;
  static double get paddingS => 2.w;
  static double get paddingM => 4.w;
  static double get paddingL => 6.w;
  static double get paddingXL => 8.w;

  // --- Text Sizes ---
  static double get fontXS => 10.sp;
  static double get fontS => 12.sp;
  static double get fontM => 14.sp;
  static double get fontL => 16.sp;
  static double get fontXL => 20.sp;
  static double get fontXXL => 24.sp;
  static double get fontDisplay => 32.sp;

  // --- Shadow Styles ---
  static List<BoxShadow> get shadowLight => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get shadowMedium => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];
}
