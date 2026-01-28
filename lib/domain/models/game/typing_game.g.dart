// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typing_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypingGameImpl _$$TypingGameImplFromJson(Map<String, dynamic> json) =>
    _$TypingGameImpl(
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
      content: TypingGameContent.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$TypingGameImplToJson(_$TypingGameImpl instance) =>
    <String, dynamic>{
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

_$TypingGameContentImpl _$$TypingGameContentImplFromJson(
  Map<String, dynamic> json,
) => _$TypingGameContentImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => TypingItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$TypingGameContentImplToJson(
  _$TypingGameContentImpl instance,
) => <String, dynamic>{'items': instance.items};

_$TypingItemImpl _$$TypingItemImplFromJson(Map<String, dynamic> json) =>
    _$TypingItemImpl(
      id: (json['id'] as num).toInt(),
      promptEs: json['prompt_es'] as String,
      answerEn: json['answer_en'] as String,
      hint: json['hint'] as String?,
      hintEs: json['hint_es'] as String?,
    );

Map<String, dynamic> _$$TypingItemImplToJson(_$TypingItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt_es': instance.promptEs,
      'answer_en': instance.answerEn,
      'hint': instance.hint,
      'hint_es': instance.hintEs,
    };
