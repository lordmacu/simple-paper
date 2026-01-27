// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_wrappers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentWrappersImpl _$$ContentWrappersImplFromJson(
  Map<String, dynamic> json,
) => _$ContentWrappersImpl(
  introText: BilingualText.fromJson(json['intro_text'] as Map<String, dynamic>),
  transition: BilingualText.fromJson(
    json['transition'] as Map<String, dynamic>,
  ),
  conclusion: BilingualText.fromJson(
    json['conclusion'] as Map<String, dynamic>,
  ),
  reflectionPrompt: json['reflection_prompt'] == null
      ? null
      : ReflectionPrompt.fromJson(
          json['reflection_prompt'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$ContentWrappersImplToJson(
  _$ContentWrappersImpl instance,
) => <String, dynamic>{
  'intro_text': instance.introText,
  'transition': instance.transition,
  'conclusion': instance.conclusion,
  'reflection_prompt': instance.reflectionPrompt,
};

_$BilingualTextImpl _$$BilingualTextImplFromJson(Map<String, dynamic> json) =>
    _$BilingualTextImpl(en: json['en'] as String, es: json['es'] as String);

Map<String, dynamic> _$$BilingualTextImplToJson(_$BilingualTextImpl instance) =>
    <String, dynamic>{'en': instance.en, 'es': instance.es};
