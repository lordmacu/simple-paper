// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_choice_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MultipleChoiceGameImpl _$$MultipleChoiceGameImplFromJson(
  Map<String, dynamic> json,
) => _$MultipleChoiceGameImpl(
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
  content: MultipleChoiceGameContent.fromJson(
    json['content'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$MultipleChoiceGameImplToJson(
  _$MultipleChoiceGameImpl instance,
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

_$MultipleChoiceGameContentImpl _$$MultipleChoiceGameContentImplFromJson(
  Map<String, dynamic> json,
) => _$MultipleChoiceGameContentImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => MultipleChoiceItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$MultipleChoiceGameContentImplToJson(
  _$MultipleChoiceGameContentImpl instance,
) => <String, dynamic>{'items': instance.items};

_$MultipleChoiceItemImpl _$$MultipleChoiceItemImplFromJson(
  Map<String, dynamic> json,
) => _$MultipleChoiceItemImpl(
  id: (json['id'] as num).toInt(),
  question: json['question'] as String,
  questionEs: json['question_es'] as String,
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  optionsEs:
      (json['options_es'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  correctAnswer: (json['correct_answer'] as num).toInt(),
  explanation: json['explanation'] as String?,
  explanationEs: json['explanation_es'] as String?,
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$$MultipleChoiceItemImplToJson(
  _$MultipleChoiceItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'question_es': instance.questionEs,
  'options': instance.options,
  'options_es': instance.optionsEs,
  'correct_answer': instance.correctAnswer,
  'explanation': instance.explanation,
  'explanation_es': instance.explanationEs,
  'image_url': instance.imageUrl,
};
