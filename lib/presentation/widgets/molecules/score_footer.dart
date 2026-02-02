import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Footer que muestra el puntaje actual.
///
/// Muestra "{label}: {score}" con estilo configurable.
class ScoreFooter extends StatelessWidget {
  /// Valor del puntaje.
  final int score;

  /// Etiqueta antes del puntaje.
  final String label;

  /// Alineación del texto.
  final TextAlign textAlign;

  /// Estilo de texto personalizado.
  final TextStyle? style;

  /// Crea un [ScoreFooter].
  const ScoreFooter({
    required this.score,
    super.key,
    this.label = 'Puntaje',
    this.textAlign = TextAlign.center,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$label: $score',
      textAlign: textAlign,
      style: style ??
          const TextStyle(
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
    );
  }
}
