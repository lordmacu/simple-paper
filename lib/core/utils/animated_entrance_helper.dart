import 'package:flutter/material.dart';

/// Envuelve un widget con animación de entrada fade + slide.
///
/// Útil para animar la aparición de elementos en pantalla.
Widget buildAnimatedEntrance({
  required Widget child,
  int delayMs = 0,
  Duration duration = const Duration(milliseconds: 400),
  Curve curve = Curves.easeOut,
  double offsetY = 20,
}) {
  return TweenAnimationBuilder<double>(
    duration: duration + Duration(milliseconds: delayMs),
    curve: curve,
    tween: Tween<double>(begin: 0.0, end: 1.0),
    builder: (context, value, _) {
      return Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, offsetY * (1 - value)),
          child: child,
        ),
      );
    },
  );
}
