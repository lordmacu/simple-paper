import 'package:flutter/material.dart';

/// Botón 3D con efecto de apilamiento visual.
///
/// Crea un efecto de profundidad usando capas superpuestas.
class Stacked3DButton extends StatelessWidget {
  /// Desplazamiento de presión (0 = sin presionar, max = presionado).
  final double pressOffset;

  /// Ancho del botón.
  final double width;

  /// Altura del botón.
  final double height;

  /// Color de la capa superior.
  final Color topColor;

  /// Color de la base.
  final Color? baseColor;

  /// Color del borde/cresta.
  final Color? ridgeColor;

  /// Si está habilitado para interacción.
  final bool isEnabled;

  /// Color cuando está deshabilitado.
  final Color? disabledColor;

  /// Ícono a mostrar.
  final IconData? icon;

  /// Tamaño del ícono.
  final double iconSize;

  /// Color del ícono.
  final Color? iconColor;

  /// Factor de aplastamiento de la capa superior.
  final double topSquash;

  /// Factor de aplastamiento de la base.
  final double baseSquash;

  /// Fracción del offset de la capa superior.
  final double topOffsetFraction;

  /// Fracción del offset de la cresta.
  final double ridgeOffsetFraction;

  /// Fracción de altura de la cresta.
  final double ridgeHeightFraction;

  /// Delta de oscurecimiento para sombras.
  final double shadeDelta;

  /// Crea un [Stacked3DButton].
  const Stacked3DButton({
    required this.topColor,
    super.key,
    this.pressOffset = 0,
    this.width = 72,
    this.height = 75,
    this.baseColor,
    this.ridgeColor,
    this.isEnabled = true,
    this.disabledColor,
    this.icon,
    this.iconSize = 24,
    this.iconColor,
    this.topSquash = 0.75,
    this.baseSquash = 0.78,
    this.topOffsetFraction = 0.13,
    this.ridgeOffsetFraction = 0.50,
    this.ridgeHeightFraction = 0.13,
    this.shadeDelta = 0.05,
  });

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final topOffset = height * topOffsetFraction;
    final ridgeOffset = height * ridgeOffsetFraction;
    final baseRidgeHeight = height * ridgeHeightFraction;
    const maxPress = 10.0;
    final t = (pressOffset / maxPress).clamp(0.0, 1.0);
    final ridgeHeight = baseRidgeHeight * (1 - t);
    final baseSeed =
        isEnabled ? topColor : (disabledColor ?? Colors.grey.shade400);
    final effectiveTopColor = baseColor ?? _darken(baseSeed, shadeDelta);
    final effectiveBaseColor = baseSeed;
    final effectiveRidgeColor = ridgeColor ?? effectiveTopColor;
    final effectiveIconColor =
        (iconColor ?? (isEnabled ? Colors.white : Colors.white70))
            .withValues(alpha: isEnabled ? 1 : 0.6);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: topOffset,
            child: Transform.scale(
              scaleY: topSquash,
              child: ClipOval(
                child: Container(
                  width: width,
                  height: width,
                  color: effectiveTopColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: ridgeOffset,
            child: Transform.scale(
              scaleY: topSquash,
              child: Container(
                width: width,
                height: ridgeHeight,
                color: effectiveRidgeColor,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, pressOffset),
            child: Transform.scale(
              scaleY: baseSquash,
              child: ClipOval(
                child: Container(
                  width: width,
                  height: width,
                  color: effectiveBaseColor,
                ),
              ),
            ),
          ),
          if (icon != null)
            Transform.translate(
              offset: Offset(0, pressOffset),
              child: SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: Icon(
                    icon,
                    size: iconSize,
                    color: effectiveIconColor,
                    shadows: [
                      Shadow(
                        color: effectiveTopColor
                            .withValues(alpha: isEnabled ? 0.85 : 0.6),
                        offset: const Offset(5, 5),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
