// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChoiceImpl _$$ChoiceImplFromJson(Map<String, dynamic> json) => _$ChoiceImpl(
  choiceId: json['choice_id'] as String,
  text: json['text'] as String,
  translationEs: json['translation_es'] as String,
  points: (json['points'] as num?)?.toInt() ?? 0,
  personalityImpact: json['personality_impact'] as String?,
  vocabUsed:
      (json['vocab_used'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ChoiceImplToJson(_$ChoiceImpl instance) =>
    <String, dynamic>{
      'choice_id': instance.choiceId,
      'text': instance.text,
      'translation_es': instance.translationEs,
      'points': instance.points,
      'personality_impact': instance.personalityImpact,
      'vocab_used': instance.vocabUsed,
    };
