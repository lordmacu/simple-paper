import 'package:flutter/material.dart';

/// Colores de la app inspirados en la paleta vibrante de Duolingo.
///
/// Define colores primarios, neutrales, semánticos y gradientes.
class AppColors {
  AppColors._();

  /// Verde primario para acciones principales.
  static const Color primaryGreen = Color(0xFF58CC02);

  /// Azul secundario para acentos.
  static const Color secondaryBlue = Color(0xFF1CB0F6);

  /// Naranja de advertencia.
  static const Color warningOrange = Color(0xFFFF9600);

  /// Rojo de error.
  static const Color errorRed = Color(0xFFFF4B4B);

  /// Verde de éxito.
  static const Color successGreen = Color(0xFF58CC02);

  /// Color de fondo principal.
  static const Color background = Color(0xFFFFFFFF);

  /// Color de fondo de cards.
  static const Color cardBackground = Color(0xFFF7F7F7);

  /// Color de texto primario.
  static const Color textPrimary = Color(0xFF3C3C3C);

  /// Color de texto secundario.
  static const Color textSecondary = Color(0xFF777777);

  /// Color de divisores.
  static const Color divider = Color(0xFFE5E5E5);

  /// Color para elementos bloqueados.
  static const Color locked = Color(0xFFCECECE);

  /// Color para elementos desbloqueados.
  static const Color unlocked = primaryGreen;

  /// Color para elementos completados.
  static const Color completed = Color(0xFFFFC800);

  /// Gradiente verde primario.
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryGreen, Color(0xFF3CAC00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Gradiente azul secundario.
  static const LinearGradient blueGradient = LinearGradient(
    colors: [secondaryBlue, Color(0xFF0E8FCC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
