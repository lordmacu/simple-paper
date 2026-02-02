import '../../../domain/models/game/game.dart';

/// Juego de repaso de memoria para emparejar elementos relacionados.
class ReviewMemoryGame implements Game {
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

  /// La lista de pares a emparejar en el juego.
  final List<ReviewMemoryPair> pairs;

  /// Crea una instancia de [ReviewMemoryGame].
  ReviewMemoryGame({
    required this.gameId,
    required this.gameType,
    required this.title,
    required this.titleEs,
    required this.instructions,
    required this.instructionsEs,
    required this.pairs,
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

/// Representa un par de elementos relacionados para el juego de memoria.
class ReviewMemoryPair {
  /// El identificador único del par.
  final int id;
  
  /// El elemento del lado izquierdo.
  final String left;
  
  /// El elemento del lado derecho.
  final String right;

  /// Crea una instancia de [ReviewMemoryPair].
  const ReviewMemoryPair({
    required this.id,
    required this.left,
    required this.right,
  });
}
