import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Retorna el color correspondiente al nivel de dificultad.
///
/// Niveles: 1 (verde/fácil) a 5 (rojo/difícil).
Color difficultyColor(int difficulty) {
  switch (difficulty) {
    case 1:
      return AppColors.successGreen;
    case 2:
      return Colors.lightGreen;
    case 3:
      return AppColors.warningOrange;
    case 4:
      return Colors.orange;
    case 5:
      return AppColors.errorRed;
    default:
      return AppColors.textSecondary;
  }
}
