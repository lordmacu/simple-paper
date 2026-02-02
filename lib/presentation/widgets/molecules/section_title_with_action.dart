import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Título de sección con acción opcional.
///
/// Muestra un título expandido con un widget de acción a la derecha.
class SectionTitleWithAction extends StatelessWidget {
  /// Texto del título.
  final String title;

  /// Widget de acción a la derecha.
  final Widget? action;

  /// Estilo personalizado del título.
  final TextStyle? titleStyle;

  /// Padding del contenedor.
  final EdgeInsetsGeometry padding;

  /// Crea un [SectionTitleWithAction].
  const SectionTitleWithAction({
    required this.title,
    super.key,
    this.action,
    this.titleStyle,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: titleStyle ??
                  const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
            ),
          ),
          if (action != null) action!,
        ],
      ),
    );
  }
}
