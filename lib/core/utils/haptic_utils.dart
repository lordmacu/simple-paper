import 'package:flutter/services.dart';

/// Utilidades para feedback háptico.
///
/// Proporciona métodos convenientes para vibración táctil.
class HapticUtils {
  /// Vibración ligera.
  static void light() {
    HapticFeedback.lightImpact();
  }

  /// Vibración media.
  static void medium() {
    HapticFeedback.mediumImpact();
  }

  /// Vibración de selección.
  static void selection() {
    HapticFeedback.selectionClick();
  }

  /// Envuelve un callback con vibración ligera.
  static VoidCallback? wrap(VoidCallback? onTap) {
    if (onTap == null) {
      return null;
    }
    return () {
      light();
      onTap();
    };
  }
}
