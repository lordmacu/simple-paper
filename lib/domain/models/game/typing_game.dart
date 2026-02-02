import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'typing_game.freezed.dart';
part 'typing_game.g.dart';

/// Typing/spelling mini-game: user types the English phrase from a prompt.
@freezed
class TypingGame with _$TypingGame implements Game {
  const TypingGame._();

  /// Constructor del juego de escritura/deletreo
  const factory TypingGame({
    /// ID único del juego
    @JsonKey(name: 'game_id') required String gameId,
    /// Tipo de juego (siempre 'typing')
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
    required TypingGameContent content,
    /// Si el juego es opcional
    @Default(false) bool optional,
    /// Si se desbloquea después del episodio
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    /// Límite de tiempo en segundos
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    /// Recompensa en XP
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
  }) = _TypingGame;

  /// Factory para crear [TypingGame] desde JSON
  factory TypingGame.fromJson(Map<String, dynamic> json) =>
      _$TypingGameFromJson(json);

  @override
  bool validateAnswer(dynamic answer) => answer is String;

  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) =>
      answers.whereType<String>().length * 10;
}

/// Contenido del juego de escritura
@freezed
class TypingGameContent with _$TypingGameContent {
  /// Constructor del contenido del juego de escritura
  const factory TypingGameContent({
    /// Lista de ítems del juego
    @Default([]) List<TypingItem> items,
  }) = _TypingGameContent;

  /// Factory para crear [TypingGameContent] desde JSON
  factory TypingGameContent.fromJson(Map<String, dynamic> json) =>
      _$TypingGameContentFromJson(json);
}

/// Item individual del juego de escritura
@freezed
class TypingItem with _$TypingItem {
  /// Constructor del item de escritura
  const factory TypingItem({
    /// ID del ítem
    required int id,
    /// Texto de la pregunta en español
    @JsonKey(name: 'prompt_es') required String promptEs,
    /// Respuesta correcta en inglés
    @JsonKey(name: 'answer_en') required String answerEn,
    /// Pista en inglés (opcional)
    String? hint,
    /// Pista en español (opcional)
    @JsonKey(name: 'hint_es') String? hintEs,
  }) = _TypingItem;

  /// Factory para crear [TypingItem] desde JSON
  factory TypingItem.fromJson(Map<String, dynamic> json) =>
      _$TypingItemFromJson(json);
}
