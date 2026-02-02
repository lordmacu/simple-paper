import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Burbuja de diálogo estilizada.
///
/// Muestra contenido en una burbuja con colores diferentes
/// según si es del lado derecho (usuario) o izquierdo (personaje).
class DialogueBubble extends StatelessWidget {
  /// Si es `true`, usa estilos del lado derecho (usuario).
  final bool isRight;

  /// Contenido de la burbuja.
  final Widget child;

  /// Padding interno de la burbuja.
  final EdgeInsetsGeometry padding;

  /// Radio del borde redondeado.
  final double borderRadius;

  /// Crea un [DialogueBubble].
  const DialogueBubble({
    required this.isRight,
    required this.child,
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isRight
        ? AppColors.secondaryBlue.withValues(alpha: 0.12)
        : AppColors.cardBackground;
    final borderColor = isRight
        ? AppColors.secondaryBlue.withValues(alpha: 0.4)
        : AppColors.primaryGreen.withValues(alpha: 0.2);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
