import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Card contenedor para prompts de juegos.
///
/// Contenedor simple con fondo y bordes redondeados para contenido de juegos.
class GamePromptCard extends StatelessWidget {
  /// Contenido del card.
  final Widget child;

  /// Padding interno.
  final EdgeInsetsGeometry padding;

  /// Color de fondo.
  final Color backgroundColor;

  /// Radio del borde redondeado.
  final double borderRadius;

  /// Crea un [GamePromptCard].
  const GamePromptCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor = AppColors.cardBackground,
    this.borderRadius = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
