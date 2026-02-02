import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Encabezado de sección con título y widget opcional.
///
/// Muestra un título con un widget trailing opcional y divisor.
class SectionHeader extends StatelessWidget {
  /// Título de la sección.
  final String title;

  /// Widget opcional al final (ej: botón de acción).
  final Widget? trailing;

  /// Estilo del título.
  final TextStyle? titleStyle;

  /// Padding externo del widget.
  final EdgeInsetsGeometry padding;

  /// Si es `true`, muestra un divisor debajo.
  final bool showDivider;

  /// Crea un [SectionHeader].
  const SectionHeader({
    required this.title,
    super.key,
    this.trailing,
    this.titleStyle,
    this.padding = const EdgeInsets.only(bottom: 8),
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = titleStyle ??
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        );

    return Padding(
      padding: padding,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: style)),
              if (trailing != null) trailing!,
            ],
          ),
          if (showDivider)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Divider(height: 1),
            ),
        ],
      ),
    );
  }
}
