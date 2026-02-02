import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Fila con barra de progreso y etiquetas.
///
/// Muestra una barra de progreso lineal con dos etiquetas a la derecha.
class ProgressMetaRow extends StatelessWidget {
  /// Valor de progreso entre 0.0 y 1.0.
  final double progress;

  /// Etiqueta principal (ej: "5/10").
  final String primaryLabel;

  /// Etiqueta secundaria (ej: "preguntas").
  final String secondaryLabel;

  /// Color de la barra de progreso.
  final Color progressColor;

  /// Padding externo del widget.
  final EdgeInsetsGeometry padding;

  /// Altura mínima de la barra de progreso.
  final double minHeight;

  /// Radio del borde de la barra.
  final double borderRadius;

  /// Crea un [ProgressMetaRow].
  const ProgressMetaRow({
    required this.progress,
    required this.primaryLabel,
    required this.secondaryLabel,
    super.key,
    this.progressColor = AppColors.secondaryBlue,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.minHeight = 10,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.cardBackground,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                minHeight: minHeight,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                primaryLabel,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                secondaryLabel,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
