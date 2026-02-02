import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'spot_word_game.freezed.dart';
part 'spot_word_game.g.dart';

/// Spot-the-word: show an image and prompt, user selects the correct word.
@freezed
class SpotWordGame with _$SpotWordGame implements Game {
  const SpotWordGame._();

  /// Constructor del juego de identificar palabra
  const factory SpotWordGame({
    /// ID único del juego
    @JsonKey(name: 'game_id') required String gameId,
    /// Tipo de juego (siempre 'spot_word')
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
    required SpotWordContent content,
    /// Si el juego es opcional
    @Default(false) bool optional,
    /// Si se desbloquea después del episodio
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    /// Límite de tiempo en segundos
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    /// Recompensa en XP
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
  }) = _SpotWordGame;

  /// Factory para crear [SpotWordGame] desde JSON
  factory SpotWordGame.fromJson(Map<String, dynamic> json) =>
      _$SpotWordGameFromJson(json);

  @override
  bool validateAnswer(dynamic answer) => answer is int;

  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) =>
      answers.whereType<int>().length * 10;
}

/// Contenido del juego de identificar palabra
@freezed
class SpotWordContent with _$SpotWordContent {
  /// Constructor del contenido del juego de identificar palabra
  const factory SpotWordContent({
    /// Lista de ítems del juego
    @Default([]) List<SpotWordItem> items,
  }) = _SpotWordContent;

  /// Factory para crear [SpotWordContent] desde JSON
  factory SpotWordContent.fromJson(Map<String, dynamic> json) =>
      _$SpotWordContentFromJson(json);
}

/// Item individual del juego de identificar palabra
@freezed
class SpotWordItem with _$SpotWordItem {
  /// Constructor del item de identificar palabra
  const factory SpotWordItem({
    /// ID del ítem
    required int id,
    /// Índice de la respuesta correcta (0-based)
    @JsonKey(name: 'correct_answer') required int correctAnswer,
    /// URL de la imagen (opcional)
    @JsonKey(name: 'image_url') String? imageUrl,
    /// Texto de la pregunta en inglés
    String? prompt,
    /// Texto de la pregunta en español
    @JsonKey(name: 'prompt_es') String? promptEs,
    /// Opciones de respuesta en inglés
    @Default([]) List<String> options,
    /// Opciones de respuesta en español
    @JsonKey(name: 'options_es') @Default([]) List<String> optionsEs,
  }) = _SpotWordItem;

  /// Factory para crear [SpotWordItem] desde JSON
  factory SpotWordItem.fromJson(Map<String, dynamic> json) =>
      _$SpotWordItemFromJson(json);
}
