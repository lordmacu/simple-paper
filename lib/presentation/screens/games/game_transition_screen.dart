import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/atoms/primary_button.dart';
import '../../widgets/molecules/section_header.dart';
import '../../widgets/molecules/game_meta_row.dart';
import '../../../domain/models/game/game.dart';

/// Pantalla de transición entre juegos en una sesión
class GameTransitionScreen extends StatelessWidget {
  /// Siguiente juego a mostrar
  final Game nextGame;
  
  /// Índice del siguiente juego (0-based)
  final int nextIndex;
  
  /// Total de juegos en la sesión
  final int totalGames;
  
  /// Puntos acumulados hasta ahora
  final int accumulatedPoints;
  
  /// Callback cuando el usuario presiona comenzar
  final VoidCallback onStart;

  /// Crea la pantalla de transición entre juegos.
  ///
  /// Parámetros:
  /// - [nextGame]: Siguiente juego a mostrar
  /// - [nextIndex]: Índice del siguiente juego (0-based)
  /// - [totalGames]: Total de juegos en la sesión
  /// - [accumulatedPoints]: Puntos acumulados hasta ahora
  /// - [onStart]: Callback cuando el usuario presiona comenzar
  const GameTransitionScreen({
    required this.nextGame, required this.nextIndex, required this.totalGames, required this.accumulatedPoints, required this.onStart, super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -60,
            child: _Bubble(
              color: AppColors.secondaryBlue.withValues(alpha: 0.18),
              size: 240,
            ),
          ),
          Positioned(
            bottom: -140,
            left: -40,
            child: _Bubble(
              color: AppColors.primaryGreen.withValues(alpha: 0.16),
              size: 260,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(height: 12),
                  const SectionHeader(
                    title: 'Siguiente juego',
                    padding: EdgeInsets.zero,
                    titleStyle: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    nextGame.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GameMetaRow(
                    chips: [
                      GameMetaChip(
                        icon: _iconForType(nextGame.gameType),
                        label: _labelForType(nextGame.gameType),
                        color: AppColors.secondaryBlue,
                      ),
                      GameMetaChip(
                        icon: Icons.stars,
                        label: '$accumulatedPoints pts acumulados',
                        color: AppColors.warningOrange,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: (nextIndex) / totalGames,
                    backgroundColor: AppColors.cardBackground,
                    valueColor: const AlwaysStoppedAnimation(AppColors.secondaryBlue),
                    minHeight: 8,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _iconForType(nextGame.gameType),
                              size: 72,
                              color: AppColors.secondaryBlue,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _labelForType(nextGame.gameType),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Juego $nextIndex de $totalGames',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      text: 'Empezar juego',
                      onPressed: onStart,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'matching':
        return Icons.swap_horiz;
      case 'fill_blank':
        return Icons.text_fields;
      case 'multiple_choice':
        return Icons.quiz;
      default:
        return Icons.extension;
    }
  }

  String _labelForType(String type) {
    switch (type) {
      case 'matching':
        return 'Matching';
      case 'fill_blank':
        return 'Fill in the Blank';
      case 'multiple_choice':
        return 'Multiple Choice';
      default:
        return 'Mini-Game';
    }
  }
}

class _Bubble extends StatelessWidget {
  final Color color;
  final double size;

  const _Bubble({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
