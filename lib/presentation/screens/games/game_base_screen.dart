import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../domain/models/game/fill_blank_game.dart';
import '../../../domain/models/game/game.dart';
import '../../../domain/models/game/matching_game.dart';
import '../../../domain/models/game/multiple_choice_game.dart';
import '../../widgets/common/duolingo_button.dart';
import '../../../core/utils/navigation_utils.dart';

/// Scaffold base para cualquier mini-juego.
/// Muestra header con progreso, puntos acumulados y el cuerpo específico del juego.
class GameBaseScreen extends StatelessWidget {
  final Game game;
  final int gameNumber;
  final int totalGames;
  final int accumulatedPoints;
  final ValueChanged<int> onComplete;
  final Widget? body;

  const GameBaseScreen({
    Key? key,
    required this.game,
    required this.gameNumber,
    required this.totalGames,
    required this.accumulatedPoints,
    required this.onComplete,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => NavigationUtils.closeToHome(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mini-Games',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Game $gameNumber/$totalGames',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Row(
                children: [
                  const Icon(
                    Icons.stars,
                    color: AppColors.warningOrange,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$accumulatedPoints',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: gameNumber / totalGames,
            backgroundColor: AppColors.cardBackground,
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.secondaryBlue,
            ),
            minHeight: 6,
          ),
          Expanded(
            child: body ?? _GamePlaceholder(game: game, onComplete: onComplete),
          ),
        ],
      ),
    );
  }
}

/// Placeholder reutilizable hasta que se implemente cada tipo de juego.
class _GamePlaceholder extends StatelessWidget {
  final Game game;
  final ValueChanged<int> onComplete;

  const _GamePlaceholder({
    required this.game,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final maxPoints = _getMaxPoints(game);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondaryBlue,
                    AppColors.primaryGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondaryBlue.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Icon(
                _getGameIcon(game.gameType),
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              _getGameTitle(game.gameType),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                _getGameDescription(game.gameType),
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.secondaryBlue.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  _buildInfoRow(Icons.psychology, 'Game', game.title),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    Icons.timer,
                    'Questions',
                    '${_getGameItemCount(game)}',
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    Icons.emoji_events,
                    'Max Points',
                    '$maxPoints',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            DuolingoButton(
              text: 'Continuar (placeholder)',
              onPressed: () {
                onComplete(maxPoints);
              },
              icon: Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.secondaryBlue),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  IconData _getGameIcon(String gameType) {
    switch (gameType) {
      case 'matching':
        return Icons.swap_horiz;
      case 'fill_blank':
        return Icons.text_fields;
      case 'multiple_choice':
        return Icons.quiz;
      default:
        return Icons.games;
    }
  }

  String _getGameTitle(String gameType) {
    switch (gameType) {
      case 'matching':
        return 'Empareja las parejas';
      case 'fill_blank':
        return 'Completa los espacios';
      case 'multiple_choice':
        return 'Opción múltiple';
      default:
        return 'Mini-juego';
    }
  }

  String _getGameDescription(String gameType) {
    switch (gameType) {
      case 'matching':
        return 'Empareja palabras en inglés con sus traducciones al español';
      case 'fill_blank':
        return 'Completa las oraciones con la palabra correcta';
      case 'multiple_choice':
        return 'Elige la respuesta correcta entre las opciones';
      default:
        return 'Completa este juego para continuar';
    }
  }

  int _getGameItemCount(Game game) {
    if (game is MatchingGame) {
      return game.content.items.length;
    } else if (game is FillBlankGame) {
      return game.content.items.length;
    } else if (game is MultipleChoiceGame) {
      return game.content.items.length;
    }
    return 0;
  }

  int _getMaxPoints(Game game) => _getGameItemCount(game) * 10;
}
