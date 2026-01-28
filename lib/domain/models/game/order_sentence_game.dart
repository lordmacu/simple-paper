import 'package:freezed_annotation/freezed_annotation.dart';
import 'game.dart';

part 'order_sentence_game.freezed.dart';
part 'order_sentence_game.g.dart';

@freezed
class OrderSentenceGame with _$OrderSentenceGame implements Game {
  const OrderSentenceGame._();

  const factory OrderSentenceGame({
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
    required OrderSentenceContent content,
  }) = _OrderSentenceGame;

  factory OrderSentenceGame.fromJson(Map<String, dynamic> json) =>
      _$OrderSentenceGameFromJson(json);

  @override
  bool validateAnswer(dynamic answer) => answer is List<String>;

  @override
  int calculateScore(List<dynamic> answers, {int? timeSpent}) {
    return answers.length * 10;
  }
}

@freezed
class OrderSentenceContent with _$OrderSentenceContent {
  const factory OrderSentenceContent({
    @Default([]) List<OrderSentenceItem> items,
  }) = _OrderSentenceContent;

  factory OrderSentenceContent.fromJson(Map<String, dynamic> json) =>
      _$OrderSentenceContentFromJson(json);
}

@freezed
class OrderSentenceItem with _$OrderSentenceItem {
  const factory OrderSentenceItem({
    required int id,
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    @JsonKey(name: 'correct_sentence') required String correctSentence,
    @JsonKey(name: 'words') @Default([]) List<String> words,
  }) = _OrderSentenceItem;

  factory OrderSentenceItem.fromJson(Map<String, dynamic> json) =>
      _$OrderSentenceItemFromJson(json);
}
