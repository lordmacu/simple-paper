import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'fill_blank_game.freezed.dart';
part 'fill_blank_game.g.dart';

/// Juego de completar espacios en blanco
/// El jugador debe seleccionar la palabra correcta para completar la oración
@freezed
class FillBlankGame with _$FillBlankGame implements Game {
  const FillBlankGame._();
  
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
    
    /// Si el juego es opcional
    @Default(true) bool optional,
    
    /// Si se desbloquea después del episodio
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    
    /// Límite de tiempo en segundos
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    
    /// Recompensa en XP
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
    
    /// Contenido del juego
    required FillBlankGameContent content,
  }) = _FillBlankGame;

  factory FillBlankGame.fromJson(Map<String, dynamic> json) =>
      _$FillBlankGameFromJson(json);
      
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

/// Contenido del juego de completar espacios
@freezed
class FillBlankGameContent with _$FillBlankGameContent {
  const factory FillBlankGameContent({
    /// Lista de oraciones con espacios en blanco
    @Default([]) List<FillBlankItem> items,
  }) = _FillBlankGameContent;

  factory FillBlankGameContent.fromJson(Map<String, dynamic> json) =>
      _$FillBlankGameContentFromJson(json);
}

/// Item individual de completar espacio en blanco
@freezed
class FillBlankItem with _$FillBlankItem {
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

  factory FillBlankItem.fromJson(Map<String, dynamic> json) =>
      _$FillBlankItemFromJson(json);
}
