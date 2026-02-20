import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Define las constantes de la interfaz de usuario de Zentory (Espaciados, Radios y Fuentes).
/// Todo está construido sobre `sizer` para asegurar adaptabilidad en cualquier pantalla.
class AppSpacing {
  /// Extra Small spacing
  static double get xs => 1.w;

  /// Small spacing
  static double get sm => 2.w;

  /// Medium spacing (Padding estándar por defecto)
  static double get md => 4.w;

  /// Large spacing
  static double get lg => 6.w;

  /// Extra Large spacing
  static double get xl => 8.w;

  /// Extra Extra Large spacing
  static double get xxl => 12.w;
}

class AppRadius {
  // Valores crudos
  static double get smVal => 1.w;
  static double get mdVal => 2.w;
  static double get lgVal => 3.w;
  static double get xlVal => 4.w;
  static double get roundVal => 100.w; // Borders completamente redondos (Pills)

  // BorderRadius ya conformados
  static BorderRadius get sm => BorderRadius.circular(smVal);
  static BorderRadius get md => BorderRadius.circular(mdVal);
  static BorderRadius get lg => BorderRadius.circular(lgVal);
  static BorderRadius get xl => BorderRadius.circular(xlVal);
  static BorderRadius get round => BorderRadius.circular(roundVal);
}

class AppFontSize {
  /// Textos extra pequeños (etiquetas, guías muy sutiles)
  static double get xs => 10.sp;

  /// Textos pequeños (descripciones secundarias, notas)
  static double get sm => 12.sp;

  /// Textos medianos (Cuerpo de texto clásico, Body)
  static double get md => 14.sp;

  /// Textos grandes (Subtítulos, Inputs, Botones)
  static double get lg => 16.sp;

  /// Textos extra grandes (Títulos principales de sección, AppBars)
  static double get xl => 20.sp;

  /// Textos enormes (Métricas de Dashboard, H1 prominentes)
  static double get xxl => 24.sp;

  /// Textos display (Uso especial hiper grande)
  static double get display => 32.sp;
}
