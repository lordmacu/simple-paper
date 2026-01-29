import 'package:flutter/material.dart';

class Stacked3DButton extends StatelessWidget {
  final double pressOffset;
  final double width;
  final double height;
  final Color topColor;
  final Color? baseColor;
  final Color? ridgeColor;
  final bool isEnabled;
  final Color? disabledColor;
  final IconData? icon;
  final double iconSize;
  final Color? iconColor;
  final double topSquash;
  final double baseSquash;
  final double topOffsetFraction;
  final double ridgeOffsetFraction;
  final double ridgeHeightFraction;
  final double shadeDelta;

  const Stacked3DButton({
    super.key,
    this.pressOffset = 0,
    this.width = 72,
    this.height = 75,
    required this.topColor,
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
    final maxPress = 10.0;
    final t = (pressOffset / maxPress).clamp(0.0, 1.0);
    final ridgeHeight = baseRidgeHeight * (1 - t);
    final baseSeed =
        isEnabled ? topColor : (disabledColor ?? Colors.grey.shade400);
    final effectiveTopColor = baseColor ?? _darken(baseSeed, shadeDelta);
    final effectiveBaseColor = baseSeed;
    final effectiveRidgeColor = ridgeColor ?? effectiveTopColor;
    final effectiveIconColor =
        (iconColor ?? (isEnabled ? Colors.white : Colors.white70))
            .withOpacity(isEnabled ? 1 : 0.6);

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
                        color: effectiveTopColor.withOpacity(isEnabled ? 0.85 : 0.6),
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
