import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';
import 'package:office_app/presentation/widgets/molecules/bilingual_text_card.dart';

/// Fila de pista con ícono de bombilla.
///
/// Muestra una pista bilingüe con un ícono de luz.
class HintRow extends StatelessWidget {
  /// Texto de la pista en inglés.
  final String? hint;

  /// Texto de la pista en español.
  final String? hintEs;

  /// Padding externo del widget.
  final EdgeInsetsGeometry padding;

  /// Estilo para el texto en inglés.
  final TextStyle? enStyle;

  /// Estilo para el texto en español.
  final TextStyle? esStyle;

  /// Crea un [HintRow].
  const HintRow({
    required this.hint,
    required this.hintEs,
    super.key,
    this.padding = EdgeInsets.zero,
    this.enStyle,
    this.esStyle,
  });

  bool get _hasHint =>
      (hint != null && hint!.trim().isNotEmpty) ||
      (hintEs != null && hintEs!.trim().isNotEmpty);

  @override
  Widget build(BuildContext context) {
    if (!_hasHint) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: padding,
      child: Row(
        children: [
          const Icon(
            Icons.lightbulb_outline,
            size: 18,
            color: AppColors.secondaryBlue,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: BilingualTextCard(
              textEn: hint ?? '',
              textEs: hintEs ?? '',
              showEn: hint != null && hint!.trim().isNotEmpty,
              showEs: hintEs != null && hintEs!.trim().isNotEmpty,
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              enStyle: enStyle ??
                  const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
              esStyle: esStyle ??
                  const TextStyle(
                    color: AppColors.textSecondary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
