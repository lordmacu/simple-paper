import 'package:flutter/services.dart';

class HapticUtils {
  static VoidCallback? wrap(VoidCallback? onTap) {
    if (onTap == null) return null;
    return () {
      HapticFeedback.lightImpact();
      onTap();
    };
  }
}
