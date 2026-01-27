import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'matching_game.freezed.dart';
part 'matching_game.g.dart';

/// Juego de emparejar palabras/frases (izquierda con derecha)
/// Ejemplo: Emparejar palabras en inglés con su traducción al español
@freezed
class MatchingGame with _$MatchingGame implements Game {
  const MatchingGame._();
  
  const factory MatchingGame({
    /// ID único del juego
    @JsonKey(name: 'game_id') required String gameId,
    
    /// Tipo de juego (siempre 'matching')
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
    required MatchingGameContent content,
    
    /// Configuración del juego
    MatchingGameSettings? settings,
  }) = _MatchingGame;

  factory MatchingGame.fromJson(Map<String, dynamic> json) =>
      _$MatchingGameFromJson(json);
      
  @override
  bool validateAnswer(dynamic answer) {
    // Implementación simple: verificar si el emparejamiento es correcto
    // TODO: Implementar lógica de validación completa
    return false;
  }
  
  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) {
    // TODO: Implementar cálculo de puntuación
    return 0;
  }
}

/// Contenido del juego de emparejamiento
@freezed
class MatchingGameContent with _$MatchingGameContent {
  const factory MatchingGameContent({
    /// Lista de ítems a emparejar
    @Default([]) List<MatchingItem> items,
  }) = _MatchingGameContent;

  factory MatchingGameContent.fromJson(Map<String, dynamic> json) =>
      _$MatchingGameContentFromJson(json);
}

/// Item individual para emparejar
@freezed
class MatchingItem with _$MatchingItem {
  const factory MatchingItem({
    /// ID del ítem
    required int id,
    
    /// Texto del lado izquierdo (ej: palabra en inglés)
    required String left,
    
    /// Texto del lado derecho (ej: traducción al español)
    required String right,
    
    /// URL de imagen opcional
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _MatchingItem;

  factory MatchingItem.fromJson(Map<String, dynamic> json) =>
      _$MatchingItemFromJson(json);
}

/// Configuración del juego de emparejamiento
@freezed
class MatchingGameSettings with _$MatchingGameSettings {
  const factory MatchingGameSettings({
    /// Si se deben mezclar los ítems
    @Default(true) bool shuffle,
    
    /// Si se deben mostrar imágenes
    @JsonKey(name: 'show_images') @Default(true) bool showImages,
  }) = _MatchingGameSettings;

  factory MatchingGameSettings.fromJson(Map<String, dynamic> json) =>
      _$MatchingGameSettingsFromJson(json);
}
