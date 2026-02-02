import 'package:flutter/material.dart';

/// Chip informativo con ícono opcional.
///
/// Muestra una etiqueta con color personalizado y fondo translúcido.
class InfoChip extends StatelessWidget {
  /// Texto a mostrar en el chip.
  final String label;

  /// Ícono opcional a mostrar junto al texto.
  final IconData? icon;

  /// Color principal del chip (texto e ícono).
  final Color color;

  /// Color de fondo del chip.
  final Color? backgroundColor;

  /// Padding interno del chip.
  final EdgeInsetsGeometry padding;

  /// Radio del borde redondeado.
  final double borderRadius;

  /// Estilo de texto personalizado.
  final TextStyle? textStyle;

  /// Crea un [InfoChip].
  const InfoChip({
    required this.label,
    required this.color,
    super.key,
    this.icon,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.borderRadius = 12,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? color.withValues(alpha: 0.1);
    final style = textStyle ??
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: color,
        );

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
          ],
          Text(label, style: style),
        ],
      ),
    );
  }
}
