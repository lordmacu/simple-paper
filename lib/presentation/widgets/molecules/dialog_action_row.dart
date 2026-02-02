import 'package:flutter/material.dart';

/// Fila de acciones para diálogos.
///
/// Muestra botones de acción primaria y secundaria en una fila.
class DialogActionRow extends StatelessWidget {
  /// Acción principal (a la derecha).
  final Widget primaryAction;

  /// Acción secundaria opcional (a la izquierda).
  final Widget? secondaryAction;

  /// Espaciado entre las acciones.
  final double spacing;

  /// Crea un [DialogActionRow].
  const DialogActionRow({
    required this.primaryAction,
    super.key,
    this.secondaryAction,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    if (secondaryAction == null) {
      return Align(
        alignment: Alignment.centerRight,
        child: primaryAction,
      );
    }

    return Row(
      children: [
        Expanded(child: secondaryAction!),
        SizedBox(width: spacing),
        Expanded(child: primaryAction),
      ],
    );
  }
}
