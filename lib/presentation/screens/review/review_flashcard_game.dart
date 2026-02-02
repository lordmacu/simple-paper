import '../../../domain/models/game/game.dart';

/// Juego de repaso usando tarjetas de memoria (flashcards).
class ReviewFlashcardGame implements Game {
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

  /// La lista de tarjetas de memoria para este juego.
  final List<ReviewFlashcardCard> cards;

  /// Crea una instancia de [ReviewFlashcardGame].
  ReviewFlashcardGame({
    required this.gameId,
    required this.gameType,
    required this.title,
    required this.titleEs,
    required this.instructions,
    required this.instructionsEs,
    required this.cards,
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

/// Representa una tarjeta de memoria con contenido frontal y trasero.
class ReviewFlashcardCard {
  /// El contenido del frente de la tarjeta.
  final String front;
  
  /// El contenido de la parte trasera de la tarjeta.
  final String back;
  
  /// Pista opcional para ayudar al usuario.
  final String? hint;
  
  /// Traducción en español de la pista.
  final String? hintEs;

  /// Crea una instancia de [ReviewFlashcardCard].
  const ReviewFlashcardCard({
    required this.front,
    required this.back,
    this.hint,
    this.hintEs,
  });
}
