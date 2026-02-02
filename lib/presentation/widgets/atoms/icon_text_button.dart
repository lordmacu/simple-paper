import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';
import 'package:office_app/core/utils/haptic_utils.dart';

/// Botón con ícono y texto.
///
/// Muestra un ícono seguido de texto con estilo personalizable.
class IconTextButton extends StatelessWidget {
  /// Texto a mostrar junto al ícono.
  final String label;

  /// Ícono a mostrar.
  final IconData icon;

  /// Callback cuando se toca el botón.
  final VoidCallback? onTap;

  /// Color del texto y el ícono.
  final Color foregroundColor;

  /// Color de fondo del botón.
  final Color? backgroundColor;

  /// Padding interno del botón.
  final EdgeInsetsGeometry padding;

  /// Tamaño del ícono.
  final double iconSize;

  /// Radio del borde redondeado.
  final double borderRadius;

  /// Altura mínima del botón.
  final double minHeight;

  /// Si es `true`, expande el botón al ancho disponible.
  final bool expand;

  /// Crea un [IconTextButton].
  const IconTextButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
    this.foregroundColor = AppColors.textPrimary,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.iconSize = 18,
    this.borderRadius = 16,
    this.minHeight = 48,
    this.expand = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool enabled = onTap != null;
    final bg = backgroundColor ?? Colors.transparent;
    final fg =
        enabled ? foregroundColor : foregroundColor.withValues(alpha: 0.6);
    final border = backgroundColor == null
        ? Border.all(color: AppColors.textSecondary.withValues(alpha: 0.2))
        : null;

    final child = Container(
      constraints: BoxConstraints(minHeight: minHeight),
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
      ),
      child: Row(
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment:
            expand ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(icon, size: iconSize, color: fg),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              textAlign: expand ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: fg,
              ),
            ),
          ),
        ],
      ),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: enabled ? HapticUtils.wrap(onTap) : null,
        child: child,
      ),
    );
  }
}
