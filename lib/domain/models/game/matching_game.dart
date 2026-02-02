import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'matching_game.freezed.dart';
part 'matching_game.g.dart';

/// Juego de emparejar palabras/frases (izquierda con derecha)
/// Ejemplo: Emparejar palabras en inglés con su traducción al español
@freezed
class MatchingGame with _$MatchingGame implements Game {
  const MatchingGame._();
  
  /// Constructor del juego de emparejamiento
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
    
    /// Contenido del juego
    required MatchingGameContent content, /// Si el juego es opcional
    @Default(true) bool optional,
    
    /// Si se desbloquea después del episodio
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    
    /// Límite de tiempo en segundos
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    
    /// Recompensa en XP
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
    
    /// Configuración del juego
    MatchingGameSettings? settings,
  }) = _MatchingGame;

  /// Factory para crear [MatchingGame] desde JSON
  factory MatchingGame.fromJson(Map<String, dynamic> json) =>
      _$MatchingGameFromJson(json);
      
  @override
  @override
  bool validateAnswer(dynamic answer) {
    // Esperamos que answer sea un Map<int, int> con leftItemId -> rightItemId
    if (answer is! Map<int, int>) {
      return false;
    }
    
    for (final entry in answer.entries) {
      final leftItemId = entry.key;
      final rightItemId = entry.value;
      
      // Buscar los items correspondientes
      final leftItem = content.items.where((item) => item.id == leftItemId).firstOrNull;
      final rightItem = content.items.where((item) => item.id == rightItemId).firstOrNull;
      
      if (leftItem == null || rightItem == null) {
        return false;
      }
      
      // En matching game, los items correctos tienen el mismo ID (se emparejan entre sí)
      if (leftItemId != rightItemId) {
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
    
    int correctMatches = 0;
    final int totalItems = content.items.length;
    
    for (final answer in answers) {
      if (validateAnswer(answer)) {
        if (answer is Map<int, int>) {
          correctMatches += answer.length; // Cada emparejamiento correcto cuenta
        }
      }
    }
    
    // Puntuación base: 12 puntos por emparejamiento correcto
    int baseScore = correctMatches * 12;
    
    // Bonus por emparejar todo correctamente
    if (correctMatches == totalItems) {
      baseScore += 30; // Bonus de perfección
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
    return (efficiency * 25).round(); // Hasta 25 puntos de bonus por velocidad
  }
}

/// Contenido del juego de emparejamiento
@freezed
class MatchingGameContent with _$MatchingGameContent {
  /// Constructor del contenido del juego de emparejamiento
  const factory MatchingGameContent({
    /// Lista de ítems a emparejar
    @Default([]) List<MatchingItem> items,
  }) = _MatchingGameContent;

  /// Factory para crear [MatchingGameContent] desde JSON
  factory MatchingGameContent.fromJson(Map<String, dynamic> json) =>
      _$MatchingGameContentFromJson(json);
}

/// Item individual para emparejar
@freezed
class MatchingItem with _$MatchingItem {
  /// Constructor del item de emparejamiento
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

  /// Factory para crear [MatchingItem] desde JSON
  factory MatchingItem.fromJson(Map<String, dynamic> json) =>
      _$MatchingItemFromJson(json);
}

/// Configuración del juego de emparejamiento
@freezed
class MatchingGameSettings with _$MatchingGameSettings {
  /// Constructor de la configuración del juego de emparejamiento
  const factory MatchingGameSettings({
    /// Si se deben mezclar los ítems
    @Default(true) bool shuffle,
    
    /// Si se deben mostrar imágenes
    @JsonKey(name: 'show_images') @Default(true) bool showImages,
  }) = _MatchingGameSettings;

  /// Factory para crear [MatchingGameSettings] desde JSON
  factory MatchingGameSettings.fromJson(Map<String, dynamic> json) =>
      _$MatchingGameSettingsFromJson(json);
}
