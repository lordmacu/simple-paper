import '../../../domain/models/game/game.dart';

/// Juego de repaso para ordenar formas verbales (Base → Past → Participle).
class ReviewOrderFormsGame implements Game {
  @override
  final String gameId;

  @override
  final String gameType;

  @override
  final String title;

  @override
  final String titleEs;

  @override
  final String instructions;

  @override
  final String instructionsEs;

  /// La lista de verbos con sus formas a ordenar.
  final List<ReviewOrderFormsItem> items;

  /// Crea una instancia de [ReviewOrderFormsGame].
  ReviewOrderFormsGame({
    required this.gameId,
    required this.gameType,
    required this.title,
    required this.titleEs,
    required this.instructions,
    required this.instructionsEs,
    required this.items,
  });

  @override
  bool get optional => true;

  @override
  bool get unlockedAfterEpisode => true;

  @override
  int? get timeLimitSeconds => null;

  @override
  int get xpReward => 0;

  @override
  Map<String, dynamic> toJson() => {
        'game_id': gameId,
        'game_type': gameType,
        'title': title,
        'title_es': titleEs,
        'instructions': instructions,
        'instructions_es': instructionsEs,
      };

  @override
  bool validateAnswer(dynamic answer) => false;

  @override
  int calculateScore(List answers, {int? timeSpent}) => 0;
}

/// Representa un verbo irregular con sus tres formas.
class ReviewOrderFormsItem {
  /// La forma base del verbo.
  final String base;
  
  /// La forma en pasado del verbo.
  final String past;
  
  /// El participio pasado del verbo.
  final String participle;

  /// Crea una instancia de [ReviewOrderFormsItem].
  const ReviewOrderFormsItem({
    required this.base,
    required this.past,
    required this.participle,
  });
}
