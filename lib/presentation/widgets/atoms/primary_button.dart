import 'package:flutter/material.dart';
import 'package:office_app/presentation/widgets/common/duolingo_button.dart';

/// Botón primario con estilo Duolingo.
///
/// Envuelve [DuolingoButton] con configuración de estilo primario.
class PrimaryButton extends StatelessWidget {
  /// Texto a mostrar en el botón.
  final String text;

  /// Callback cuando se presiona el botón.
  final VoidCallback? onPressed;

  /// Ícono opcional a mostrar junto al texto.
  final IconData? icon;

  /// Widget hijo personalizado en lugar del texto.
  final Widget? child;

  /// Si es `true`, usa un tamaño más compacto.
  final bool compact;

  /// Padding personalizado del botón.
  final EdgeInsetsGeometry? padding;

  /// Tamaño de fuente del texto.
  final double? fontSize;

  /// Tamaño del ícono.
  final double? iconSize;

  /// Radio del borde redondeado.
  final double? borderRadius;

  /// Crea un [PrimaryButton].
  const PrimaryButton({
    required this.text,
    super.key,
    this.onPressed,
    this.icon,
    this.child,
    this.compact = false,
    this.padding,
    this.fontSize,
    this.iconSize,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ??
        (compact
            ? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
            : null);
    final effectiveFontSize = fontSize ?? (compact ? 16 : null);
    final effectiveIconSize = iconSize ?? (compact ? 18 : null);
    final effectiveRadius = borderRadius ?? (compact ? 12 : null);

    return DuolingoButton(
      text: text,
      onPressed: onPressed,
      icon: icon,
      padding: effectivePadding,
      fontSize: effectiveFontSize,
      iconSize: effectiveIconSize,
      borderRadius: effectiveRadius,
      child: child,
    );
  }
}
