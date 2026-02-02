import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'order_sentence_game.freezed.dart';
part 'order_sentence_game.g.dart';

/// Juego de ordenar oraciones
/// El jugador debe ordenar palabras para formar la oración correcta
@freezed
class OrderSentenceGame with _$OrderSentenceGame implements Game {
  const OrderSentenceGame._();

  /// Constructor del juego de ordenar oraciones
  const factory OrderSentenceGame({
    /// ID único del juego
    @JsonKey(name: 'game_id') required String gameId,
    /// Tipo de juego (siempre 'order_sentence')
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
    required OrderSentenceContent content,
    /// Si el juego es opcional
    @Default(false) bool optional,
    /// Si se desbloquea después del episodio
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    /// Límite de tiempo en segundos
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    /// Recompensa en XP
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
  }) = _OrderSentenceGame;

  /// Factory para crear [OrderSentenceGame] desde JSON
  factory OrderSentenceGame.fromJson(Map<String, dynamic> json) =>
      _$OrderSentenceGameFromJson(json);

  @override
  bool validateAnswer(dynamic answer) => answer is List<String>;

  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) {
    return answers.length * 10;
  }
}

/// Contenido del juego de ordenar oraciones
@freezed
class OrderSentenceContent with _$OrderSentenceContent {
  /// Constructor del contenido del juego de ordenar oraciones
  const factory OrderSentenceContent({
    /// Lista de ítems de oraciones a ordenar
    @Default([]) List<OrderSentenceItem> items,
  }) = _OrderSentenceContent;

  /// Factory para crear [OrderSentenceContent] desde JSON
  factory OrderSentenceContent.fromJson(Map<String, dynamic> json) =>
      _$OrderSentenceContentFromJson(json);
}

/// Item individual de oración a ordenar
@freezed
class OrderSentenceItem with _$OrderSentenceItem {
  /// Constructor del item de oración a ordenar
  const factory OrderSentenceItem({
    /// ID del ítem
    required int id,
    /// Oración correcta completa
    @JsonKey(name: 'correct_sentence') required String correctSentence,
    /// Texto de la pregunta en inglés
    String? prompt,
    /// Texto de la pregunta en español
    @JsonKey(name: 'prompt_es') String? promptEs,
    /// Lista de palabras desordenadas
    @JsonKey(name: 'words') @Default([]) List<String> words,
  }) = _OrderSentenceItem;

  /// Factory para crear [OrderSentenceItem] desde JSON
  factory OrderSentenceItem.fromJson(Map<String, dynamic> json) =>
      _$OrderSentenceItemFromJson(json);
}
