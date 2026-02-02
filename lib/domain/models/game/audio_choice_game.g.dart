// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_choice_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioChoiceGameImpl _$$AudioChoiceGameImplFromJson(
  Map<String, dynamic> json,
) => _$AudioChoiceGameImpl(
  gameId: json['game_id'] as String,
  gameType: json['game_type'] as String,
  title: json['title'] as String,
  titleEs: json['title_es'] as String,
  instructions: json['instructions'] as String,
  instructionsEs: json['instructions_es'] as String,
  content: AudioChoiceContent.fromJson(json['content'] as Map<String, dynamic>),
  optional: json['optional'] as bool? ?? false,
  unlockedAfterEpisode: json['unlocked_after_episode'] as bool? ?? true,
  timeLimitSeconds: (json['time_limit_seconds'] as num?)?.toInt(),
  xpReward: (json['xp_reward'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$AudioChoiceGameImplToJson(
  _$AudioChoiceGameImpl instance,
) => <String, dynamic>{
  'game_id': instance.gameId,
  'game_type': instance.gameType,
  'title': instance.title,
  'title_es': instance.titleEs,
  'instructions': instance.instructions,
  'instructions_es': instance.instructionsEs,
  'content': instance.content,
  'optional': instance.optional,
  'unlocked_after_episode': instance.unlockedAfterEpisode,
  'time_limit_seconds': instance.timeLimitSeconds,
  'xp_reward': instance.xpReward,
};

_$AudioChoiceContentImpl _$$AudioChoiceContentImplFromJson(
  Map<String, dynamic> json,
) => _$AudioChoiceContentImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => AudioChoiceItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$AudioChoiceContentImplToJson(
  _$AudioChoiceContentImpl instance,
) => <String, dynamic>{'items': instance.items};

_$AudioChoiceItemImpl _$$AudioChoiceItemImplFromJson(
  Map<String, dynamic> json,
) => _$AudioChoiceItemImpl(
  id: (json['id'] as num).toInt(),
  audioUrl: json['audio_url'] as String,
  correctAnswer: (json['correct_answer'] as num).toInt(),
  prompt: json['prompt'] as String?,
  promptEs: json['prompt_es'] as String?,
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  optionsEs:
      (json['options_es'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$AudioChoiceItemImplToJson(
  _$AudioChoiceItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'audio_url': instance.audioUrl,
  'correct_answer': instance.correctAnswer,
  'prompt': instance.prompt,
  'prompt_es': instance.promptEs,
  'options': instance.options,
  'options_es': instance.optionsEs,
};
