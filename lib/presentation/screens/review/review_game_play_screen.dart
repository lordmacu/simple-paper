import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../domain/models/game/fill_blank_game.dart';
import '../../../domain/models/game/game.dart';
import '../../../domain/models/game/matching_game.dart';
import '../../../domain/models/game/multiple_choice_game.dart';
import '../../../domain/models/game/typing_game.dart';
import '../games/game_base_screen.dart';
import '../games/game_results_screen.dart';
import '../games/widgets/fill_blank_game_widget.dart';
import '../games/widgets/matching_game_widget.dart';
import '../games/widgets/multiple_choice_game_widget.dart';
import '../games/widgets/typing_game_widget.dart';
import 'review_bingo_game.dart';
import 'review_bingo_widget.dart';
import 'review_flashcard_game.dart';
import 'review_flashcard_widget.dart';
import 'review_game_factory.dart';
import 'review_memory_game.dart';
import 'review_memory_widget.dart';
import 'review_order_forms_game.dart';
import 'review_order_forms_widget.dart';
import 'review_true_false_game.dart';
import 'review_true_false_widget.dart';
import 'review_types.dart';

class ReviewGamePlayScreen extends StatefulWidget {
  final ReviewCategory category;
  final ReviewGameType gameType;
  final List<Map<String, String>>? irregularVerbs;
  final List<Map<String, String>>? countries;
  final List<String>? cities;
  final List<Map<String, String>>? comparatives;

  const ReviewGamePlayScreen({
    super.key,
    required this.category,
    required this.gameType,
    this.irregularVerbs,
    this.countries,
    this.cities,
    this.comparatives,
  });

  @override
  State<ReviewGamePlayScreen> createState() => _ReviewGamePlayScreenState();
}

class _ReviewGamePlayScreenState extends State<ReviewGamePlayScreen> {
  late final Future<Game> _gameFuture;

  @override
  void initState() {
    super.initState();
    _gameFuture = ReviewGameFactory.build(
      category: widget.category.type,
      gameType: widget.gameType,
      irregularVerbs: widget.irregularVerbs,
      countries: widget.countries,
      cities: widget.cities,
      comparatives: widget.comparatives,
    );
  }

  void _showResults(Game game, int points) {
    final maxPoints = _getMaxPoints(game);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GameResultsScreen(
          totalPoints: points,
          maxPoints: maxPoints,
          onContinue: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  int _getMaxPoints(Game game) {
    if (game is MatchingGame) return game.content.items.length * 10;
    if (game is FillBlankGame) return game.content.items.length * 10;
    if (game is MultipleChoiceGame) return game.content.items.length * 10;
    if (game is ReviewFlashcardGame) return game.cards.length * 10;
    if (game is ReviewMemoryGame) return game.pairs.length * 10;
    if (game is ReviewOrderFormsGame) return game.items.length * 10;
    if (game is TypingGame) return game.content.items.length * 10;
    if (game is ReviewTrueFalseGame) return game.items.length * 10;
    if (game is ReviewBingoGame) return game.rounds.length * 10;
    return 10;
  }

  Widget _buildGameBody(Game game) {
    if (game is ReviewFlashcardGame) {
      return ReviewFlashcardWidget(
        game: game,
        onComplete: (points) => _showResults(game, points),
      );
    }
    if (game is ReviewBingoGame) {
      return ReviewBingoWidget(
        game: game,
        onComplete: (points) => _showResults(game, points),
      );
    }
    if (game is ReviewMemoryGame) {
      return ReviewMemoryWidget(
        game: game,
        onComplete: (points) => _showResults(game, points),
      );
    }
    if (game is ReviewOrderFormsGame) {
      return ReviewOrderFormsWidget(
        game: game,
        onComplete: (points) => _showResults(game, points),
      );
    }
    if (game is MatchingGame) {
      return MatchingGameWidget(
        game: game,
        onComplete: (points) => _showResults(game, points),
      );
    }
    if (game is MultipleChoiceGame) {
      return MultipleChoiceGameWidget(
        game: game,
        onComplete: (points) => _showResults(game, points),
      );
    }
    if (game is FillBlankGame) {
      return FillBlankGameWidget(
        game: game,
        onComplete: (points) => _showResults(game, points),
      );
    }
    if (game is TypingGame) {
      return TypingGameWidget(
        game: game,
        onComplete: (points) => _showResults(game, points),
      );
    }
    if (game is ReviewTrueFalseGame) {
      return ReviewTrueFalseWidget(
        game: game,
        onComplete: (points) => _showResults(game, points),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Game>(
      future: _gameFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryGreen,
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Repasar',
                style: TextStyle(color: AppColors.textPrimary),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(color: AppColors.textPrimary),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  snapshot.error.toString(),
                  style: const TextStyle(color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }

        final game = snapshot.data!;
        return GameBaseScreen(
          game: game,
          gameNumber: 1,
          totalGames: 1,
          accumulatedPoints: 0,
          onComplete: (_) {},
          body: _buildGameBody(game),
        );
      },
    );
  }
}
