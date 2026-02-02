import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/section_progress.dart';
import '../../../data/sources/content_db.dart';
import '../../../domain/models/episode/episode.dart';
import '../../../domain/models/game/game.dart';
import '../../../domain/models/game/matching_game.dart';
import '../../../domain/models/game/fill_blank_game.dart';
import '../../../domain/models/game/multiple_choice_game.dart';
import '../../../domain/models/game/audio_choice_game.dart';
import '../../../domain/models/game/order_sentence_game.dart';
import '../../../domain/models/game/typing_game.dart';
import '../../../domain/models/game/spot_word_game.dart';
import 'game_base_screen.dart';
import 'game_results_screen.dart';
import 'widgets/matching_game_widget.dart';
import 'widgets/fill_blank_game_widget.dart';
import 'widgets/multiple_choice_game_widget.dart';
import 'widgets/audio_choice_game_widget.dart';
import 'widgets/order_sentence_game_widget.dart';
import 'widgets/typing_game_widget.dart';
import 'widgets/spot_word_game_widget.dart';
import 'game_transition_screen.dart';
import '../../providers/progress_providers.dart';
import '../../widgets/atoms/primary_button.dart';

/// Pantalla de juegos del episodio
/// Muestra los mini-juegos secuencialmente
class GamesScreen extends ConsumerStatefulWidget {
  ///  episode
  final Episode episode;
  /// int
  final int pointsFromStory;
  /// void
  final void Function(int totalPoints, int maxPoints) onComplete;
  /// int
  final int initialIndex;

  /// Crea una instancia de games screen.
  const GamesScreen({
    required this.episode, required this.onComplete, super.key,
    this.pointsFromStory = 0,
    this.initialIndex = 0,
  });

  @override
  ConsumerState<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends ConsumerState<GamesScreen> {
  static const String _logTag = 'EPISODE_UNLOCK';
  int _currentGameIndex = 0;
  int _totalPoints = 0;
  late final int _maxTotalPoints;
  late final Stopwatch _gameTimer;

  @override
  void initState() {
    super.initState();
    _currentGameIndex = widget.initialIndex;
    _totalPoints = widget.pointsFromStory;
    _maxTotalPoints = widget.episode.games.data
        .map((game) => _getMaxPoints(game))
        .fold<int>(0, (sum, value) => sum + value);
    _gameTimer = Stopwatch()..start();
  }

  @override
  void dispose() {
    _gameTimer.stop();
    super.dispose();
  }

  Game get _currentGame => widget.episode.games.data[_currentGameIndex];
  int get _totalGames => widget.episode.games.data.length;
  bool get _isLastGame => _currentGameIndex == _totalGames - 1;

  /// Avanza al siguiente juego
  Future<void> _handleGameComplete(int points) async {
    _totalPoints += points;
    
    // NUEVO: Guardar resultado del juego individual
    await _saveIndividualGameResult(points);
    
    await ref.read(markSectionCompletedProvider)(
      episodeNumber: widget.episode.episodeMetadata.episodeNumber,
      sectionId: SectionProgressIds.gameId(_currentGameIndex + 1),
    );

    if (_isLastGame) {
      await ref.read(markSectionCompletedProvider)(
        episodeNumber: widget.episode.episodeMetadata.episodeNumber,
        sectionId: SectionProgressIds.games,
      );
      await _maybeCompleteEpisode();
      if (!mounted) {
        return;
      }
      // Mostrar pantalla de resultados antes de completar
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => GameResultsScreen(
            totalPoints: _totalPoints,
            maxPoints: _maxTotalPoints,
            onContinue: () {
              Navigator.pop(context); // close results
              widget.onComplete(_totalPoints, _maxTotalPoints);
            },
          ),
        ),
      );
    } else {
      _navigateToNextGame();
    }
  }

  Future<void> _maybeCompleteEpisode() async {
    final episodeNumber = widget.episode.episodeMetadata.episodeNumber;
    final repository = ref.read(progressRepositoryProvider);
    final episodeProgress = await repository.getEpisodeProgress(episodeNumber);
    if (episodeProgress?.isCompleted ?? false) {
      debugPrint('$_logTag already_completed episode=$episodeNumber');
      return;
    }
    final completed = await repository.getCompletedSections(episodeNumber);
    final hasInterview = await ContentDb().hasInterviewForEpisode(episodeNumber);
    final required =
        SectionProgressIds.buildOrderedIds(widget.episode).toSet();
    if (hasInterview) {
      required.add(SectionProgressIds.interview);
    }
    final missing = required.difference(completed);
    final done = required.intersection(completed).toList()..sort();
    final total = required.length;
    final doneCount = done.length;
    final percent = total == 0 ? 0 : ((doneCount / total) * 100).round();
    debugPrint(
      '$_logTag games_complete_check episode=$episodeNumber completed=${completed.length} '
      'required=${required.length} missing=${missing.toList()} done=$done '
      'progress=$doneCount/$total ($percent%)',
    );
    if (missing.isNotEmpty) {
      return;
    }
    final stars = _calculateStars(_totalPoints, _maxTotalPoints);
    debugPrint(
      '$_logTag games_complete_unlock episode=$episodeNumber stars=$stars '
      'xp=$_totalPoints max=$_maxTotalPoints',
    );
    await ref.read(completeEpisodeProvider)(
      episodeNumber: episodeNumber,
      starsEarned: stars,
      xpEarned: _totalPoints,
    );
    
    // NUEVO: Desbloquear achievements basados en el rendimiento
    await _unlockAchievements(episodeNumber, stars, _totalPoints, _maxTotalPoints);
  }

  /// Desbloquea achievements basados en el rendimiento
  Future<void> _unlockAchievements(int episodeNumber, int stars, int points, int maxPoints) async {
    final repository = ref.read(progressRepositoryProvider);
    
    try {
      // Achievement por completar primer episodio
      if (episodeNumber == 1) {
        await repository.unlockAchievement('first_episode_completed');
      }
      
      // Achievement por conseguir 3 estrellas
      if (stars == 3) {
        await repository.unlockAchievement('perfect_episode');
      }
      
      // Achievement por completar 5 episodios
      final userProgress = await repository.getUserProgress();
      final completedEpisodesCount = userProgress.completedEpisodes.length;
      
      if (completedEpisodesCount >= 5) {
        await repository.unlockAchievement('five_episodes_completed');
      }
      
      // Achievement por completar 10 episodios
      if (completedEpisodesCount >= 10) {
        await repository.unlockAchievement('ten_episodes_completed');
      }
      
      debugPrint('$_logTag achievements_checked episode=$episodeNumber stars=$stars total_completed=$completedEpisodesCount');
    } on Exception catch (e) {
      debugPrint('$_logTag achievement_unlock_error episode=$episodeNumber error=$e');
    }
  }

  int _calculateStars(int points, int maxPoints) {
    if (maxPoints <= 0) {
      return 3;
    }
    final ratio = points / maxPoints;
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

  /// Guarda el resultado de un juego individual
  Future<void> _saveIndividualGameResult(int points) async {
    final repository = ref.read(progressRepositoryProvider);
    final episodeNumber = widget.episode.episodeMetadata.episodeNumber;
    
    // Generar un gameId único para el juego actual
    final gameId = 'game_${_currentGameIndex + 1}';
    
    try {
      await repository.saveGameResult(
        episodeNumber,
        gameId,
        points,
        _gameTimer.elapsed.inSeconds,
      );
      debugPrint('$_logTag saved_game_result episode=$episodeNumber game=$gameId score=$points time=${_gameTimer.elapsed.inSeconds}s');
    } on Exception catch (e) {
      debugPrint('$_logTag save_game_result_error episode=$episodeNumber game=$gameId error=$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.episode.games.data.isEmpty) {
      // No hay juegos, completar directamente
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(markSectionCompletedProvider)(
          episodeNumber: widget.episode.episodeMetadata.episodeNumber,
          sectionId: SectionProgressIds.games,
        );
        _maybeCompleteEpisode();
        widget.onComplete(_totalPoints, _maxTotalPoints);
      });
      
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 80,
                color: AppColors.successGreen,
              ),
               SizedBox(height: 24),
              Text(
                'No games for this episode',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textSecondary,
                ),
              ),
               SizedBox(height: 16),
              Text(
                'Moving to next section...',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GameBaseScreen(
      game: _currentGame,
      gameNumber: _currentGameIndex + 1,
      totalGames: _totalGames,
      accumulatedPoints: _totalPoints,
      onComplete: _handleGameComplete,
      body: _buildGameBody(),
    );
  }

  Widget _buildGameBody() {
    final child = _buildCurrentGame();

    return RepaintBoundary(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, anim) {
          final offsetAnim = Tween<Offset>(
            begin: const Offset(0.05, 0.08),
            end: Offset.zero,
          ).animate(anim);
          return SlideTransition(
            position: offsetAnim,
            child: FadeTransition(opacity: anim, child: child),
          );
        },
        child: child,
      ),
    );
  }

  Widget _buildCurrentGame() {
    if (_currentGame is MatchingGame) {
      return MatchingGameWidget(
        key: ValueKey('matching-$_currentGameIndex'),
        game: _currentGame as MatchingGame,
        onComplete: _handleGameComplete,
      );
    }

    if (_currentGame is FillBlankGame) {
      return FillBlankGameWidget(
        key: ValueKey('fill-$_currentGameIndex'),
        game: _currentGame as FillBlankGame,
        onComplete: _handleGameComplete,
      );
    }

    if (_currentGame is MultipleChoiceGame) {
      return MultipleChoiceGameWidget(
        key: ValueKey('mc-$_currentGameIndex'),
        game: _currentGame as MultipleChoiceGame,
        onComplete: _handleGameComplete,
      );
    }

    if (_currentGame is AudioChoiceGame) {
      return AudioChoiceGameWidget(
        key: ValueKey('audio-$_currentGameIndex'),
        game: _currentGame as AudioChoiceGame,
        onComplete: _handleGameComplete,
      );
    }

    if (_currentGame is OrderSentenceGame) {
      return OrderSentenceGameWidget(
        key: ValueKey('order-$_currentGameIndex'),
        game: _currentGame as OrderSentenceGame,
        onComplete: _handleGameComplete,
      );
    }

    if (_currentGame is TypingGame) {
      return TypingGameWidget(
        key: ValueKey('typing-$_currentGameIndex'),
        game: _currentGame as TypingGame,
        onComplete: _handleGameComplete,
      );
    }

    if (_currentGame is SpotWordGame) {
      return SpotWordGameWidget(
        key: ValueKey('spot-$_currentGameIndex'),
        game: _currentGame as SpotWordGame,
        onComplete: _handleGameComplete,
      );
    }

    // Error: tipo de juego no reconocido
    final gameType = _currentGame.runtimeType.toString();
    debugPrint('🚨 GAME_ERROR: Unrecognized game type: $gameType for episode ${widget.episode.episodeMetadata.episodeNumber}');
    
    return Center(
      key: ValueKey('error-$_currentGameIndex'),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: AppColors.errorRed),
            const SizedBox(height: 16),
            const Text(
              'Game Error',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Unknown game type: $gameType\nPlease report this issue.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Skip Game',
              onPressed: () => _handleGameComplete(0), // Sin puntos por error
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNextGame() {
    final nextIndex = _currentGameIndex + 1;
    final nextGame = widget.episode.games.data[nextIndex];

    // Reiniciar timer para el siguiente juego
    _gameTimer.reset();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GameTransitionScreen(
          nextGame: nextGame,
          nextIndex: nextIndex + 1,
          totalGames: _totalGames,
          accumulatedPoints: _totalPoints,
          onStart: () {
            Navigator.pop(context);
            setState(() {
              _currentGameIndex = nextIndex;
            });
          },
        ),
      ),
    );
  }

  int _getMaxPoints(Game game) {
    if (game is MatchingGame) {
      return game.content.items.length * 10;
    }
    if (game is FillBlankGame) {
      return game.content.items.length * 10;
    }
    if (game is MultipleChoiceGame) {
      return game.content.items.length * 10;
    }
    // Default: 10 puntos por item si hay conteo, o 10 mínimo
    try {
      final dynamic items = (game as dynamic).content.items;
      if (items is List) {
        return max(10, items.length * 10);
      }
    } on Exception catch (_) {}
    return 10;
  }
}
