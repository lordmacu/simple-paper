import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'audio_choice_game.freezed.dart';
part 'audio_choice_game.g.dart';

/// Listening quiz: play an audio clip and choose the correct option.
@freezed
class AudioChoiceGame with _$AudioChoiceGame implements Game {
  const AudioChoiceGame._();

  const factory AudioChoiceGame({
    @JsonKey(name: 'game_id') required String gameId,
    @JsonKey(name: 'game_type') required String gameType,
    required String title,
    @JsonKey(name: 'title_es') required String titleEs,
    required String instructions,
    @JsonKey(name: 'instructions_es') required String instructionsEs,
    @Default(false) bool optional,
    @JsonKey(name: 'unlocked_after_episode') @Default(true) bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
    required AudioChoiceContent content,
  }) = _AudioChoiceGame;

  factory AudioChoiceGame.fromJson(Map<String, dynamic> json) =>
      _$AudioChoiceGameFromJson(json);

  @override
  bool validateAnswer(dynamic answer) => answer is int;

  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) {
    if (answers.isEmpty) return 0;
    return answers.whereType<int>().length * 10;
  }
}

@freezed
class AudioChoiceContent with _$AudioChoiceContent {
  const factory AudioChoiceContent({
    @Default([]) List<AudioChoiceItem> items,
  }) = _AudioChoiceContent;

  factory AudioChoiceContent.fromJson(Map<String, dynamic> json) =>
      _$AudioChoiceContentFromJson(json);
}

@freezed
class AudioChoiceItem with _$AudioChoiceItem {
  const factory AudioChoiceItem({
    required int id,
    @JsonKey(name: 'audio_url') required String audioUrl,
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    @Default([]) List<String> options,
    @JsonKey(name: 'options_es') @Default([]) List<String> optionsEs,
    @JsonKey(name: 'correct_answer') required int correctAnswer,
  }) = _AudioChoiceItem;

  factory AudioChoiceItem.fromJson(Map<String, dynamic> json) =>
      _$AudioChoiceItemFromJson(json);
}
