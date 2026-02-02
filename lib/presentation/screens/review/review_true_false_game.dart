import '../../../domain/models/game/game.dart';

/// Juego de repaso de verdadero o falso.
class ReviewTrueFalseGame implements Game {
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

  /// La lista de afirmaciones para evaluar.
  final List<ReviewTrueFalseItem> items;

  /// Crea una instancia de [ReviewTrueFalseGame].
  ReviewTrueFalseGame({
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
  bool validateAnswer(dynamic answer) {
    if (answer is! Map<int, bool>) {
      return false;
    }
    
    // Validar que todas las respuestas sean correctas
    for (final entry in answer.entries) {
      final itemIndex = entry.key;
      final userAnswer = entry.value;
      
      if (itemIndex < 0 || itemIndex >= items.length) {
        return false;
      }
      
      if (userAnswer != items[itemIndex].isTrue) {
        return false;
      }
    }
    
    return true;
  }

  @override
  int calculateScore(List answers, {int? timeSpent}) {
    if (answers.isEmpty) {
      return 0;
    }
    
    int totalScore = 0;
    
    for (final answer in answers) {
      if (answer is Map<int, bool>) {
        for (final entry in answer.entries) {
          final itemIndex = entry.key;
          final userAnswer = entry.value;
          
          if (itemIndex >= 0 && itemIndex < items.length) {
            final isCorrect = userAnswer == items[itemIndex].isTrue;
            totalScore += isCorrect ? 10 : 0;
          }
        }
      }
    }
    
    // Bonus por completar todo el juego
    if (answers.length == items.length) {
      totalScore += 5; // Bonus de completitud
    }
    
    return totalScore;
  }
}

/// Representa una afirmación para evaluar como verdadera o falsa.
class ReviewTrueFalseItem {
  /// La afirmación en inglés.
  final String statement;
  
  /// La afirmación en español.
  final String statementEs;
  
  /// Indica si la afirmación es verdadera.
  final bool isTrue;

  /// Crea una instancia de [ReviewTrueFalseItem].
  const ReviewTrueFalseItem({
    required this.statement,
    required this.statementEs,
    required this.isTrue,
  });
}
