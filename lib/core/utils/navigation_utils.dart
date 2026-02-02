import 'package:flutter/material.dart';

/// Utilidades de navegación.
///
/// Proporciona métodos para navegación común en la app.
class NavigationUtils {
  const NavigationUtils._();

  /// Cierra todas las pantallas y vuelve a la raíz.
  static void closeToHome(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .popUntil((route) => route.isFirst);
  }
}
