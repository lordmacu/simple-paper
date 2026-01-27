// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflection_prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReflectionPromptImpl _$$ReflectionPromptImplFromJson(
  Map<String, dynamic> json,
) => _$ReflectionPromptImpl(
  questionEn: json['question_en'] as String,
  questionEs: json['question_es'] as String,
  type: json['type'] as String,
  optional: json['optional'] as bool? ?? true,
  maxLength: (json['max_length'] as num?)?.toInt() ?? 100,
  vocabPractice:
      (json['vocab_practice'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ReflectionPromptImplToJson(
  _$ReflectionPromptImpl instance,
) => <String, dynamic>{
  'question_en': instance.questionEn,
  'question_es': instance.questionEs,
  'type': instance.type,
  'optional': instance.optional,
  'max_length': instance.maxLength,
  'vocab_practice': instance.vocabPractice,
};
