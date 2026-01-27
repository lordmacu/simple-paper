import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'multiple_choice_game.freezed.dart';
part 'multiple_choice_game.g.dart';

/// Juego de selección múltiple (quiz)
/// El jugador debe seleccionar la respuesta correcta entre varias opciones
@freezed
class MultipleChoiceGame with _$MultipleChoiceGame implements Game {
  const MultipleChoiceGame._();
  
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
    
    /// Si el juego es opcional
    @Default(true) bool optional,
    
    /// Si se desbloquea después del episodio
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    
    /// Límite de tiempo en segundos
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    
    /// Recompensa en XP
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
    
    /// Contenido del juego
    required MultipleChoiceGameContent content,
  }) = _MultipleChoiceGame;

  factory MultipleChoiceGame.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceGameFromJson(json);
      
  @override
  bool validateAnswer(dynamic answer) {
    // TODO: Implementar lógica de validación
    return false;
  }
  
  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) {
    // TODO: Implementar cálculo de puntuación
    return 0;
  }
}

/// Contenido del juego de selección múltiple
@freezed
class MultipleChoiceGameContent with _$MultipleChoiceGameContent {
  const factory MultipleChoiceGameContent({
    /// Lista de preguntas
    @Default([]) List<MultipleChoiceItem> items,
  }) = _MultipleChoiceGameContent;

  factory MultipleChoiceGameContent.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceGameContentFromJson(json);
}

/// Pregunta individual de selección múltiple
@freezed
class MultipleChoiceItem with _$MultipleChoiceItem {
  const factory MultipleChoiceItem({
    /// ID de la pregunta
    required int id,
    
    /// Pregunta en inglés
    required String question,
    
    /// Pregunta en español
    @JsonKey(name: 'question_es') required String questionEs,
    
    /// Opciones de respuesta en inglés
    @Default([]) List<String> options,
    
    /// Opciones de respuesta en español
    @JsonKey(name: 'options_es') @Default([]) List<String> optionsEs,
    
    /// Índice de la respuesta correcta (0-based)
    @JsonKey(name: 'correct_answer') required int correctAnswer,
    
    /// Explicación de la respuesta en inglés
    String? explanation,
    
    /// Explicación en español
    @JsonKey(name: 'explanation_es') String? explanationEs,
    
    /// URL de imagen opcional
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _MultipleChoiceItem;

  factory MultipleChoiceItem.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceItemFromJson(json);
}
