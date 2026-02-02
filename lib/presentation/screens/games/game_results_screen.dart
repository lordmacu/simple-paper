import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/atoms/primary_button.dart';
import '../../widgets/molecules/section_header.dart';

/// Pantalla que muestra los resultados de un juego completado
class GameResultsScreen extends StatelessWidget {
  /// Puntos totales obtenidos
  final int totalPoints;
  
  /// Puntos máximos posibles
  final int maxPoints;
  
  /// Callback cuando el usuario presiona continuar
  final VoidCallback onContinue;
  
  /// Override opcional para las estrellas (0-3)
  final int? starsOverride;

  /// Crea la pantalla de resultados de juego.
  ///
  /// Parámetros:
  /// - [totalPoints]: Puntos totales obtenidos
  /// - [maxPoints]: Puntos máximos posibles
  /// - [onContinue]: Callback cuando el usuario presiona continuar
  /// - [starsOverride]: Override opcional para las estrellas (0-3)
  const GameResultsScreen({
    required this.totalPoints, required this.maxPoints, required this.onContinue, super.key,
    this.starsOverride,
  });

  int get _stars {
    if (starsOverride != null) {
      return starsOverride!.clamp(0, 3);
    }
    if (maxPoints <= 0) {
      return 3;
    }
    final ratio = totalPoints / maxPoints;
    if (ratio >= 0.9) {
      return 3;
    }
    if (ratio >= 0.65) {
      return 2;
    }
    if (ratio >= 0.35) {
      return 1;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final xpEarned = totalPoints;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              const SectionHeader(
                title: 'Results',
                padding: EdgeInsets.zero,
                titleStyle: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 32),
              _buildStars(),
              const SizedBox(height: 24),
              _buildScoreCard(),
              const SizedBox(height: 12),
              _buildXpRow(xpEarned),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  text: 'Continue',
                  onPressed: onContinue,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final filled = index < _stars;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Icon(
            filled ? Icons.star : Icons.star_border,
            size: 36,
            color: filled ? AppColors.warningOrange : AppColors.cardBackground,
          ),
        );
      }),
    );
  }

  Widget _buildScoreCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          _row('Total Points', '$totalPoints'),
          const SizedBox(height: 10),
          _row('Max Points', '$maxPoints'),
          const SizedBox(height: 10),
          _row('Performance', '${_performancePercent.toStringAsFixed(0)}%'),
        ],
      ),
    );
  }

  Widget _buildXpRow(int xp) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_fire_department, color: AppColors.primaryGreen),
          const SizedBox(width: 10),
          const Text(
            'XP ganado',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Text(
            '+$xp',
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.primaryGreen,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  double get _performancePercent {
    if (maxPoints <= 0) {
      return 100;
    }
    return (totalPoints / maxPoints) * 100;
  }
}
