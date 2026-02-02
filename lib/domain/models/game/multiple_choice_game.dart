import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'multiple_choice_game.freezed.dart';
part 'multiple_choice_game.g.dart';

/// Juego de selección múltiple (quiz)
/// El jugador debe seleccionar la respuesta correcta entre varias opciones
@freezed
class MultipleChoiceGame with _$MultipleChoiceGame implements Game {
  const MultipleChoiceGame._();
  
  /// Constructor del juego de selección múltiple
  const factory MultipleChoiceGame({
    /// ID único del juego
    @JsonKey(name: 'game_id') required String gameId,
    
    /// Tipo de juego (siempre 'multiple_choice')
    @JsonKey(name: 'game_type') required String gameType,
    
    /// Título del juego en inglés
    required String title,
    
    /// Título en español
    @JsonKey(name: 'title_es') required String titleEs,
    
    /// Instrucciones en inglés
    required String instructions,
    
    /// Instrucciones en español
    @JsonKey(name: 'instructions_es') required String instructionsEs,
    
    /// Contenido del juego
    required MultipleChoiceGameContent content, /// Si el juego es opcional
    @Default(true) bool optional,
    
    /// Si se desbloquea después del episodio
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    
    /// Límite de tiempo en segundos
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    
    /// Recompensa en XP
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
  }) = _MultipleChoiceGame;

  /// Factory para crear [MultipleChoiceGame] desde JSON
  factory MultipleChoiceGame.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceGameFromJson(json);
      
  @override
  bool validateAnswer(dynamic answer) {
    // Esperamos que answer sea un Map<int, int> con itemId -> índice de respuesta seleccionada
    if (answer is! Map<int, int>) {
      return false;
    }
    
    for (final entry in answer.entries) {
      final itemId = entry.key;
      final selectedOptionIndex = entry.value;
      
      // Buscar el item correspondiente
      final item = content.items.where((item) => item.id == itemId).firstOrNull;
      if (item == null) {
        return false;
      }
      
      // Validar que el índice esté en rango
      if (selectedOptionIndex < 0 || selectedOptionIndex >= item.options.length) {
        return false;
      }
      
      // Comparar con la respuesta correcta
      if (selectedOptionIndex != item.correctAnswer) {
        return false;
      }
    }
    
    return true;
  }
  
  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) {
    if (answers.isEmpty) {
      return 0;
    }
    
    int correctAnswers = 0;
    final int totalQuestions = content.items.length;
    
    for (final answer in answers) {
      if (validateAnswer(answer)) {
        correctAnswers++;
      }
    }
    
    // Puntuación base: 15 puntos por respuesta correcta
    int baseScore = correctAnswers * 15;
    
    // Bonus por responder todo correctamente
    if (correctAnswers == totalQuestions) {
      baseScore += 25; // Bonus de perfección
    }
    
    // Bonus por tiempo (si se especifica límite de tiempo)
    if (timeSpent != null && timeLimitSeconds != null) {
      final timeBonus = _calculateTimeBonus(timeSpent, timeLimitSeconds!);
      baseScore += timeBonus;
    }
    
    return baseScore;
  }
  
  /// Calcula bonus de tiempo basado en qué tan rápido se completó
  int _calculateTimeBonus(int timeSpent, int timeLimit) {
    if (timeSpent >= timeLimit) {
      return 0;
    }
    
    final efficiency = 1.0 - (timeSpent / timeLimit);
    return (efficiency * 20).round(); // Hasta 20 puntos de bonus por velocidad
  }
}

/// Contenido del juego de selección múltiple
@freezed
class MultipleChoiceGameContent with _$MultipleChoiceGameContent {
  /// Constructor del contenido del juego de selección múltiple
  const factory MultipleChoiceGameContent({
    /// Lista de preguntas
    @Default([]) List<MultipleChoiceItem> items,
  }) = _MultipleChoiceGameContent;

  /// Factory para crear [MultipleChoiceGameContent] desde JSON
  factory MultipleChoiceGameContent.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceGameContentFromJson(json);
}

/// Pregunta individual de selección múltiple
@freezed
class MultipleChoiceItem with _$MultipleChoiceItem {
  /// Constructor del item de selección múltiple
  const factory MultipleChoiceItem({
    /// ID de la pregunta
    required int id,
    
    /// Pregunta en inglés
    required String question,
    
    /// Pregunta en español
    @JsonKey(name: 'question_es') required String questionEs,
    
    /// Índice de la respuesta correcta (0-based)
    @JsonKey(name: 'correct_answer') required int correctAnswer, /// Opciones de respuesta en inglés
    @Default([]) List<String> options,
    
    /// Opciones de respuesta en español
    @JsonKey(name: 'options_es') @Default([]) List<String> optionsEs,
    
    /// Explicación de la respuesta en inglés
    String? explanation,
    
    /// Explicación en español
    @JsonKey(name: 'explanation_es') String? explanationEs,
    
    /// URL de imagen opcional
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _MultipleChoiceItem;

  /// Factory para crear [MultipleChoiceItem] desde JSON
  factory MultipleChoiceItem.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceItemFromJson(json);
}
