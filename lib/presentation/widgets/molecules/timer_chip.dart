import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Chip que muestra un temporizador con segundos restantes.
///
/// Incluye un ícono de reloj y el tiempo en formato "{n}s".
class TimerChip extends StatelessWidget {
  /// Segundos a mostrar.
  final int seconds;

  /// Color del chip y el texto.
  final Color color;

  /// Padding interno del chip.
  final EdgeInsetsGeometry padding;

  /// Tamaño del ícono del reloj.
  final double iconSize;

  /// Estilo de texto personalizado.
  final TextStyle? textStyle;

  /// Crea un [TimerChip].
  const TimerChip({
    required this.seconds,
    super.key,
    this.color = AppColors.warningOrange,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.iconSize = 18,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer, size: iconSize, color: color),
          const SizedBox(width: 6),
          Text(
            '${seconds}s',
            style: textStyle ??
                TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
        ],
      ),
    );
  }
}
