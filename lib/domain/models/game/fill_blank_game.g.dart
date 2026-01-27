// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_blank_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FillBlankGameImpl _$$FillBlankGameImplFromJson(Map<String, dynamic> json) =>
    _$FillBlankGameImpl(
      gameId: json['game_id'] as String,
      gameType: json['game_type'] as String,
      title: json['title'] as String,
      titleEs: json['title_es'] as String,
      instructions: json['instructions'] as String,
      instructionsEs: json['instructions_es'] as String,
      optional: json['optional'] as bool? ?? true,
      unlockedAfterEpisode: json['unlocked_after_episode'] as bool? ?? true,
      timeLimitSeconds: (json['time_limit_seconds'] as num?)?.toInt(),
      xpReward: (json['xp_reward'] as num?)?.toInt() ?? 0,
      content: FillBlankGameContent.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$FillBlankGameImplToJson(_$FillBlankGameImpl instance) =>
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

_$FillBlankGameContentImpl _$$FillBlankGameContentImplFromJson(
  Map<String, dynamic> json,
) => _$FillBlankGameContentImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => FillBlankItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$FillBlankGameContentImplToJson(
  _$FillBlankGameContentImpl instance,
) => <String, dynamic>{'items': instance.items};

_$FillBlankItemImpl _$$FillBlankItemImplFromJson(Map<String, dynamic> json) =>
    _$FillBlankItemImpl(
      id: (json['id'] as num).toInt(),
      sentence: json['sentence'] as String,
      sentenceEs: json['sentence_es'] as String,
      answer: json['answer'] as String,
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      hint: json['hint'] as String?,
      hintEs: json['hint_es'] as String?,
      character: json['character'] as String?,
    );

Map<String, dynamic> _$$FillBlankItemImplToJson(_$FillBlankItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sentence': instance.sentence,
      'sentence_es': instance.sentenceEs,
      'answer': instance.answer,
      'options': instance.options,
      'hint': instance.hint,
      'hint_es': instance.hintEs,
      'character': instance.character,
    };
