import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';
import 'package:office_app/presentation/widgets/atoms/info_chip.dart';
import 'package:office_app/presentation/widgets/molecules/section_header.dart';

/// Fila de encabezado para pantallas de revisión con puntaje.
///
/// Muestra un título con un chip de puntaje opcional o widget trailing.
class ReviewHeaderRow extends StatelessWidget {
  /// Título del encabezado.
  final String title;

  /// Puntaje numérico a mostrar.
  final int? score;

  /// Etiqueta del puntaje.
  final String scoreLabel;

  /// Color del chip de puntaje.
  final Color scoreColor;

  /// Widget trailing personalizado (reemplaza el chip de puntaje).
  final Widget? trailing;

  /// Padding del encabezado.
  final EdgeInsetsGeometry padding;

  /// Crea un [ReviewHeaderRow].
  const ReviewHeaderRow({
    required this.title,
    super.key,
    this.score,
    this.scoreLabel = 'Puntaje',
    this.scoreColor = AppColors.secondaryBlue,
    this.trailing,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: title,
      trailing: trailing ??
          (score == null
              ? null
              : InfoChip(
                  label: '$scoreLabel: $score',
                  color: scoreColor,
                )),
      padding: padding,
    );
  }
}
