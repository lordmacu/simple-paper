// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_sentence_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderSentenceGameImpl _$$OrderSentenceGameImplFromJson(
  Map<String, dynamic> json,
) => _$OrderSentenceGameImpl(
  gameId: json['game_id'] as String,
  gameType: json['game_type'] as String,
  title: json['title'] as String,
  titleEs: json['title_es'] as String,
  instructions: json['instructions'] as String,
  instructionsEs: json['instructions_es'] as String,
  optional: json['optional'] as bool? ?? false,
  unlockedAfterEpisode: json['unlocked_after_episode'] as bool? ?? true,
  timeLimitSeconds: (json['time_limit_seconds'] as num?)?.toInt(),
  xpReward: (json['xp_reward'] as num?)?.toInt() ?? 0,
  content: OrderSentenceContent.fromJson(
    json['content'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$OrderSentenceGameImplToJson(
  _$OrderSentenceGameImpl instance,
) => <String, dynamic>{
  'game_id': instance.gameId,
  'game_type': instance.gameType,
  'title': instance.title,
  'title_es': instance.titleEs,
  'instructions': instance.instructions,
  'instructions_es': instance.instructionsEs,
  'optional': instance.optional,
  'unlocked_after_episode': instance.unlockedAfterEpisode,
  'time_limit_seconds': instance.timeLimitSeconds,
  'xp_reward': instance.xpReward,
  'content': instance.content,
};

_$OrderSentenceContentImpl _$$OrderSentenceContentImplFromJson(
  Map<String, dynamic> json,
) => _$OrderSentenceContentImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderSentenceItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$OrderSentenceContentImplToJson(
  _$OrderSentenceContentImpl instance,
) => <String, dynamic>{'items': instance.items};

_$OrderSentenceItemImpl _$$OrderSentenceItemImplFromJson(
  Map<String, dynamic> json,
) => _$OrderSentenceItemImpl(
  id: (json['id'] as num).toInt(),
  prompt: json['prompt'] as String?,
  promptEs: json['prompt_es'] as String?,
  correctSentence: json['correct_sentence'] as String,
  words:
      (json['words'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$OrderSentenceItemImplToJson(
  _$OrderSentenceItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'prompt': instance.prompt,
  'prompt_es': instance.promptEs,
  'correct_sentence': instance.correctSentence,
  'words': instance.words,
};
