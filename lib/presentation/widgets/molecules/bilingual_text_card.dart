import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Card que muestra texto bilingüe (inglés y español).
///
/// Permite mostrar uno o ambos idiomas con estilos personalizables.
class BilingualTextCard extends StatelessWidget {
  /// Texto en inglés.
  final String textEn;

  /// Texto en español.
  final String textEs;

  /// Estilo para el texto en inglés.
  final TextStyle? enStyle;

  /// Estilo para el texto en español.
  final TextStyle? esStyle;

  /// Color de fondo del card.
  final Color? backgroundColor;

  /// Padding interno del card.
  final EdgeInsetsGeometry padding;

  /// Radio del borde redondeado.
  final double borderRadius;

  /// Si es `true`, muestra el texto en inglés.
  final bool showEn;

  /// Si es `true`, muestra el texto en español.
  final bool showEs;

  /// Crea un [BilingualTextCard].
  const BilingualTextCard({
    required this.textEn,
    required this.textEs,
    super.key,
    this.enStyle,
    this.esStyle,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 16,
    this.showEn = true,
    this.showEs = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.cardBackground,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showEn)
            Text(
              textEn,
              style: enStyle ??
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
            ),
          if (showEn && showEs) const SizedBox(height: 6),
          if (showEs)
            Text(
              textEs,
              style: esStyle ??
                  const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
            ),
        ],
      ),
    );
  }
}
