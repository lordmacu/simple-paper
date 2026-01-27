import 'package:flutter/material.dart';

/// App colors inspired by Duolingo's vibrant palette
class AppColors {
  AppColors._();

  // Primary colors
  static const Color primaryGreen = Color(0xFF58CC02);
  static const Color secondaryBlue = Color(0xFF1CB0F6);
  static const Color warningOrange = Color(0xFFFF9600);
  static const Color errorRed = Color(0xFFFF4B4B);
  static const Color successGreen = Color(0xFF58CC02);

  // Neutrals
  static const Color background = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFF7F7F7);
  static const Color textPrimary = Color(0xFF3C3C3C);
  static const Color textSecondary = Color(0xFF777777);
  static const Color divider = Color(0xFFE5E5E5);

  // Semantic colors
  static const Color locked = Color(0xFFCECECE);
  static const Color unlocked = primaryGreen;
  static const Color completed = Color(0xFFFFC800);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryGreen, Color(0xFF3CAC00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [secondaryBlue, Color(0xFF0E8FCC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
