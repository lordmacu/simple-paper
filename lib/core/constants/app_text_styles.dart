import 'package:flutter/material.dart';

/// Estilos de texto de la aplicación.
///
/// Proporciona estilos estandarizados para encabezados, cuerpo y botones.
class AppTextStyles {
  AppTextStyles._();

  /// Encabezado nivel 1 (32px, bold).
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  /// Encabezado nivel 2 (24px, bold).
  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  );

  /// Encabezado nivel 3 (20px, bold).
  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  /// Texto de cuerpo grande (18px).
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  /// Texto de cuerpo mediano (16px).
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  /// Texto de cuerpo pequeño (14px).
  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  /// Texto de botón principal (18px, bold).
  static const TextStyle button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  /// Texto de botón pequeño (14px, bold).
  static const TextStyle buttonSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
  );

  /// Texto de caption (12px).
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  /// Texto de caption en negrita (12px, bold).
  static const TextStyle captionBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}
