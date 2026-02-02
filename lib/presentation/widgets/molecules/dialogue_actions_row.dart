import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Fila de acciones para diálogos (traducir, escuchar).
///
/// Muestra botones de acción para interactuar con el diálogo.
class DialogueActionsRow extends StatelessWidget {
  /// Si está mostrando la traducción.
  final bool isShowingTranslation;

  /// Callback para alternar traducción.
  final VoidCallback? onToggleTranslation;

  /// Callback para reproducir audio.
  final VoidCallback? onSpeak;

  /// Etiqueta del botón de traducir.
  final String translateLabel;

  /// Etiqueta del botón de ver original.
  final String originalLabel;

  /// Etiqueta del botón de escuchar.
  final String speakLabel;

  /// Crea un [DialogueActionsRow].
  const DialogueActionsRow({
    required this.isShowingTranslation,
    required this.onToggleTranslation,
    required this.onSpeak,
    super.key,
    this.translateLabel = 'Ver traducción',
    this.originalLabel = 'Ver original',
    this.speakLabel = 'Escuchar',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (onToggleTranslation != null)
          _ActionLink(
            icon: isShowingTranslation
                ? Icons.translate_outlined
                : Icons.translate,
            label: isShowingTranslation ? originalLabel : translateLabel,
            color: AppColors.secondaryBlue,
            onTap: onToggleTranslation,
          ),
        if (onToggleTranslation != null && onSpeak != null)
          const SizedBox(width: 12),
        if (onSpeak != null)
          _ActionLink(
            icon: Icons.volume_up,
            label: speakLabel,
            color: AppColors.primaryGreen,
            onTap: onSpeak,
          ),
      ],
    );
  }
}

class _ActionLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _ActionLink({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
