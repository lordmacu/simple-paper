// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_word_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpotWordGameImpl _$$SpotWordGameImplFromJson(Map<String, dynamic> json) =>
    _$SpotWordGameImpl(
      gameId: json['game_id'] as String,
      gameType: json['game_type'] as String,
      title: json['title'] as String,
      titleEs: json['title_es'] as String,
      instructions: json['instructions'] as String,
      instructionsEs: json['instructions_es'] as String,
      content: SpotWordContent.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
      optional: json['optional'] as bool? ?? false,
      unlockedAfterEpisode: json['unlocked_after_episode'] as bool? ?? true,
      timeLimitSeconds: (json['time_limit_seconds'] as num?)?.toInt(),
      xpReward: (json['xp_reward'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SpotWordGameImplToJson(_$SpotWordGameImpl instance) =>
    <String, dynamic>{
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

_$SpotWordContentImpl _$$SpotWordContentImplFromJson(
  Map<String, dynamic> json,
) => _$SpotWordContentImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => SpotWordItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$SpotWordContentImplToJson(
  _$SpotWordContentImpl instance,
) => <String, dynamic>{'items': instance.items};

_$SpotWordItemImpl _$$SpotWordItemImplFromJson(Map<String, dynamic> json) =>
    _$SpotWordItemImpl(
      id: (json['id'] as num).toInt(),
      correctAnswer: (json['correct_answer'] as num).toInt(),
      imageUrl: json['image_url'] as String?,
      prompt: json['prompt'] as String?,
      promptEs: json['prompt_es'] as String?,
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      optionsEs:
          (json['options_es'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SpotWordItemImplToJson(_$SpotWordItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'correct_answer': instance.correctAnswer,
      'image_url': instance.imageUrl,
      'prompt': instance.prompt,
      'prompt_es': instance.promptEs,
      'options': instance.options,
      'options_es': instance.optionsEs,
    };
