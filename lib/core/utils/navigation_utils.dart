import 'package:flutter/material.dart';

class NavigationUtils {
  const NavigationUtils._();

  static void closeToHome(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .popUntil((route) => route.isFirst);
  }
}
