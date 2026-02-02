import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'fill_blank_game.freezed.dart';
part 'fill_blank_game.g.dart';

/// Juego de completar espacios en blanco
/// El jugador debe seleccionar la palabra correcta para completar la oración
@freezed
class FillBlankGame with _$FillBlankGame implements Game {
  const FillBlankGame._();
  
  /// Constructor del juego de completar espacios en blanco
  const factory FillBlankGame({
    /// ID único del juego
    @JsonKey(name: 'game_id') required String gameId,
    
    /// Tipo de juego (siempre 'fill_blank')
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
    required FillBlankGameContent content, /// Si el juego es opcional
    @Default(true) bool optional,
    
    /// Si se desbloquea después del episodio
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    
    /// Límite de tiempo en segundos
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    
    /// Recompensa en XP
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
  }) = _FillBlankGame;

  /// Factory para crear [FillBlankGame] desde JSON
  factory FillBlankGame.fromJson(Map<String, dynamic> json) =>
      _$FillBlankGameFromJson(json);
      
  @override
  bool validateAnswer(dynamic answer) {
    // Esperamos que answer sea un Map<int, String> con itemId -> respuesta seleccionada
    if (answer is! Map<int, String>) {
      return false;
    }
    
    for (final entry in answer.entries) {
      final itemId = entry.key;
      final selectedAnswer = entry.value.trim().toLowerCase();
      
      // Buscar el item correspondiente
      final item = content.items.where((item) => item.id == itemId).firstOrNull;
      if (item == null) {
        return false;
      }
      
      // Comparar con la respuesta correcta (case insensitive)
      final correctAnswer = item.answer.trim().toLowerCase();
      if (selectedAnswer != correctAnswer) {
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
    
    // Puntuación base: 10 puntos por respuesta correcta
    int baseScore = correctAnswers * 10;
    
    // Bonus por responder todo correctamente
    if (correctAnswers == totalQuestions) {
      baseScore += 20; // Bonus de perfección
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
    return (efficiency * 15).round(); // Hasta 15 puntos de bonus por velocidad
  }
}

/// Contenido del juego de completar espacios
@freezed
class FillBlankGameContent with _$FillBlankGameContent {
  /// Constructor del contenido del juego de completar espacios
  const factory FillBlankGameContent({
    /// Lista de oraciones con espacios en blanco
    @Default([]) List<FillBlankItem> items,
  }) = _FillBlankGameContent;

  /// Factory para crear [FillBlankGameContent] desde JSON
  factory FillBlankGameContent.fromJson(Map<String, dynamic> json) =>
      _$FillBlankGameContentFromJson(json);
}

/// Item individual de completar espacio en blanco
@freezed
class FillBlankItem with _$FillBlankItem {
  /// Constructor del item de completar espacio en blanco
  const factory FillBlankItem({
    /// ID del ítem
    required int id,
    
    /// Oración con el espacio en blanco (_____) en inglés
    required String sentence,
    
    /// Oración en español
    @JsonKey(name: 'sentence_es') required String sentenceEs,
    
    /// Respuesta correcta
    required String answer,
    
    /// Opciones de respuesta
    @Default([]) List<String> options,
    
    /// Pista en inglés
    String? hint,
    
    /// Pista en español
    @JsonKey(name: 'hint_es') String? hintEs,
    
    /// Personaje que dice la frase (con template variable)
    String? character,
  }) = _FillBlankItem;

  /// Factory para crear [FillBlankItem] desde JSON
  factory FillBlankItem.fromJson(Map<String, dynamic> json) =>
      _$FillBlankItemFromJson(json);
}
