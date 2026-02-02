import '../../../domain/models/game/game.dart';

/// Juego de repaso tipo bingo rápido con selección de opciones.
class ReviewBingoGame implements Game {
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

  /// La lista de rondas del juego de bingo.
  final List<ReviewBingoRound> rounds;

  /// Crea una instancia de [ReviewBingoGame].
  ReviewBingoGame({
    required this.gameId,
    required this.gameType,
    required this.title,
    required this.titleEs,
    required this.instructions,
    required this.instructionsEs,
    required this.rounds,
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

/// Representa una ronda del juego de bingo con pregunta y opciones.
class ReviewBingoRound {
  /// La pregunta o indicación en inglés.
  final String prompt;
  
  /// La pregunta o indicación en español.
  final String promptEs;
  
  /// Las opciones de respuesta disponibles.
  final List<String> options;
  
  /// El índice de la opción correcta.
  final int correctIndex;

  /// Crea una instancia de [ReviewBingoRound].
  const ReviewBingoRound({
    required this.prompt,
    required this.promptEs,
    required this.options,
    required this.correctIndex,
  });
}
