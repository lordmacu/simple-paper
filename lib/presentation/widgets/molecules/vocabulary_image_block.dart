import 'package:flutter/material.dart';
import 'package:office_app/core/constants/app_colors.dart';

/// Bloque visual para mostrar vocabulario con ícono.
///
/// Contenedor decorativo con ícono, palabra y botón de reproducción opcional.
class VocabularyImageBlock extends StatelessWidget {
  /// Palabra de vocabulario a mostrar.
  final String word;

  /// Ícono representativo.
  final IconData icon;

  /// Callback para reproducir audio.
  final VoidCallback? onPlay;

  /// Color de fondo del bloque.
  final Color backgroundColor;

  /// Color del borde.
  final Color borderColor;

  /// Crea un [VocabularyImageBlock].
  const VocabularyImageBlock({
    required this.word,
    required this.icon,
    super.key,
    this.onPlay,
    this.backgroundColor = AppColors.cardBackground,
    this.borderColor = const Color(0x4D58CC02),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 80,
                  color: AppColors.primaryGreen,
                ),
                const SizedBox(height: 8),
                Text(
                  word.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          if (onPlay != null)
            Positioned(
              right: 12,
              bottom: 12,
              child: GestureDetector(
                onTap: onPlay,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
