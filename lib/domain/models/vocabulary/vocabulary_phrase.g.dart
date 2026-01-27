// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_phrase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocabularyPhraseImpl _$$VocabularyPhraseImplFromJson(
  Map<String, dynamic> json,
) => _$VocabularyPhraseImpl(
  phrase: json['phrase'] as String,
  translationEs: json['translation_es'] as String,
  usageContext: json['usage_context'] as String,
  usageContextEs: json['usage_context_es'] as String,
);

Map<String, dynamic> _$$VocabularyPhraseImplToJson(
  _$VocabularyPhraseImpl instance,
) => <String, dynamic>{
  'phrase': instance.phrase,
  'translation_es': instance.translationEs,
  'usage_context': instance.usageContext,
  'usage_context_es': instance.usageContextEs,
};
