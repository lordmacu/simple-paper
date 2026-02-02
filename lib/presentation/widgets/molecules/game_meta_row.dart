import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Fila de chips de metadatos para juegos.
///
/// Muestra múltiples [GameMetaChip] en un wrap horizontal.
class GameMetaRow extends StatelessWidget {
  /// Lista de chips a mostrar.
  final List<GameMetaChip> chips;

  /// Espacio horizontal entre chips.
  final double spacing;

  /// Crea un [GameMetaRow].
  const GameMetaRow({
    required this.chips,
    super.key,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: 8,
      children: chips
          .map(
            (chip) => GameMetaChip(
              icon: chip.icon,
              label: chip.label,
              color: chip.color,
            ),
          )
          .toList(),
    );
  }
}

/// Chip individual con ícono y etiqueta para metadatos de juego.
class GameMetaChip extends StatelessWidget {
  /// Ícono a mostrar.
  final IconData icon;

  /// Texto de la etiqueta.
  final String label;

  /// Color del chip.
  final Color color;

  /// Crea un [GameMetaChip].
  const GameMetaChip({
    required this.icon,
    required this.label,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
