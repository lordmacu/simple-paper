import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'spot_word_game.freezed.dart';
part 'spot_word_game.g.dart';

/// Spot-the-word: show an image and prompt, user selects the correct word.
@freezed
class SpotWordGame with _$SpotWordGame implements Game {
  const SpotWordGame._();

  const factory SpotWordGame({
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
    required SpotWordContent content,
  }) = _SpotWordGame;

  factory SpotWordGame.fromJson(Map<String, dynamic> json) =>
      _$SpotWordGameFromJson(json);

  @override
  bool validateAnswer(dynamic answer) => answer is int;

  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) =>
      answers.whereType<int>().length * 10;
}

@freezed
class SpotWordContent with _$SpotWordContent {
  const factory SpotWordContent({
    @Default([]) List<SpotWordItem> items,
  }) = _SpotWordContent;

  factory SpotWordContent.fromJson(Map<String, dynamic> json) =>
      _$SpotWordContentFromJson(json);
}

@freezed
class SpotWordItem with _$SpotWordItem {
  const factory SpotWordItem({
    required int id,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    @Default([]) List<String> options,
    @JsonKey(name: 'options_es') @Default([]) List<String> optionsEs,
    @JsonKey(name: 'correct_answer') required int correctAnswer,
  }) = _SpotWordItem;

  factory SpotWordItem.fromJson(Map<String, dynamic> json) =>
      _$SpotWordItemFromJson(json);
}
