import 'package:flutter/material.dart';

/// Layout de fila para diálogos con avatar y contenido.
///
/// Posiciona avatar y contenido con espaciado configurable.
class DialogueLayoutRow extends StatelessWidget {
  /// Widget del avatar.
  final Widget avatar;

  /// Widget del contenido principal.
  final Widget content;

  /// Si el avatar va a la derecha.
  final bool avatarOnRight;

  /// Espacio entre avatar y contenido.
  final double spacing;

  /// Crea un [DialogueLayoutRow].
  const DialogueLayoutRow({
    required this.avatar,
    required this.content,
    super.key,
    this.avatarOnRight = false,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          avatarOnRight ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!avatarOnRight) ...[
          avatar,
          SizedBox(width: spacing),
        ],
        Expanded(child: content),
        if (avatarOnRight) ...[
          SizedBox(width: spacing),
          avatar,
        ],
      ],
    );
  }
}
