import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'audio_choice_game.freezed.dart';
part 'audio_choice_game.g.dart';

/// Listening quiz: play an audio clip and choose the correct option.
@freezed
class AudioChoiceGame with _$AudioChoiceGame implements Game {
  const AudioChoiceGame._();

  /// Constructor del juego de elección de audio
  const factory AudioChoiceGame({
    /// ID único del juego
    @JsonKey(name: 'game_id') required String gameId,
    /// Tipo de juego (siempre 'audio_choice')
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
    required AudioChoiceContent content,
    /// Si el juego es opcional
    @Default(false) bool optional,
    /// Si se desbloquea después del episodio
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    /// Límite de tiempo en segundos
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    /// Recompensa en XP
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
  }) = _AudioChoiceGame;

  /// Factory para crear [AudioChoiceGame] desde JSON
  factory AudioChoiceGame.fromJson(Map<String, dynamic> json) =>
      _$AudioChoiceGameFromJson(json);

  @override
  bool validateAnswer(dynamic answer) => answer is int;

  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) {
    if (answers.isEmpty) {
      return 0;
    }
    return answers.whereType<int>().length * 10;
  }
}

/// Contenido del juego de elección de audio
@freezed
class AudioChoiceContent with _$AudioChoiceContent {
  /// Constructor del contenido del juego de elección de audio
  const factory AudioChoiceContent({
    /// Lista de ítems de audio
    @Default([]) List<AudioChoiceItem> items,
  }) = _AudioChoiceContent;

  /// Factory para crear [AudioChoiceContent] desde JSON
  factory AudioChoiceContent.fromJson(Map<String, dynamic> json) =>
      _$AudioChoiceContentFromJson(json);
}

/// Item individual de elección de audio
@freezed
class AudioChoiceItem with _$AudioChoiceItem {
  /// Constructor del item de elección de audio
  const factory AudioChoiceItem({
    /// ID del ítem
    required int id,
    /// URL del archivo de audio
    @JsonKey(name: 'audio_url') required String audioUrl,
    /// Índice de la respuesta correcta (0-based)
    @JsonKey(name: 'correct_answer') required int correctAnswer,
    /// Texto de la pregunta en inglés
    String? prompt,
    /// Texto de la pregunta en español
    @JsonKey(name: 'prompt_es') String? promptEs,
    /// Opciones de respuesta en inglés
    @Default([]) List<String> options,
    /// Opciones de respuesta en español
    @JsonKey(name: 'options_es') @Default([]) List<String> optionsEs,
  }) = _AudioChoiceItem;

  /// Factory para crear [AudioChoiceItem] desde JSON
  factory AudioChoiceItem.fromJson(Map<String, dynamic> json) =>
      _$AudioChoiceItemFromJson(json);
}
