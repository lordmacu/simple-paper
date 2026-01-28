import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'typing_game.freezed.dart';
part 'typing_game.g.dart';

/// Typing/spelling mini-game: user types the English phrase from a prompt.
@freezed
class TypingGame with _$TypingGame implements Game {
  const TypingGame._();

  const factory TypingGame({
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
    required TypingGameContent content,
  }) = _TypingGame;

  factory TypingGame.fromJson(Map<String, dynamic> json) =>
      _$TypingGameFromJson(json);

  @override
  bool validateAnswer(dynamic answer) => answer is String;

  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) =>
      answers.whereType<String>().length * 10;
}

@freezed
class TypingGameContent with _$TypingGameContent {
  const factory TypingGameContent({
    @Default([]) List<TypingItem> items,
  }) = _TypingGameContent;

  factory TypingGameContent.fromJson(Map<String, dynamic> json) =>
      _$TypingGameContentFromJson(json);
}

@freezed
class TypingItem with _$TypingItem {
  const factory TypingItem({
    required int id,
    @JsonKey(name: 'prompt_es') required String promptEs,
    @JsonKey(name: 'answer_en') required String answerEn,
    String? hint,
    @JsonKey(name: 'hint_es') String? hintEs,
  }) = _TypingItem;

  factory TypingItem.fromJson(Map<String, dynamic> json) =>
      _$TypingItemFromJson(json);
}
