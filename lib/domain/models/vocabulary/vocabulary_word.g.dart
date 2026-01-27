// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocabularyWordImpl _$$VocabularyWordImplFromJson(Map<String, dynamic> json) =>
    _$VocabularyWordImpl(
      word: json['word'] as String,
      translationEs: json['translation_es'] as String,
      wordType: json['word_type'] as String,
      wordTypeEs: json['word_type_es'] as String,
      difficulty: (json['difficulty'] as num).toInt(),
      contextSentence: json['context_sentence'] as String,
      contextSentenceEs: json['context_sentence_es'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$VocabularyWordImplToJson(
  _$VocabularyWordImpl instance,
) => <String, dynamic>{
  'word': instance.word,
  'translation_es': instance.translationEs,
  'word_type': instance.wordType,
  'word_type_es': instance.wordTypeEs,
  'difficulty': instance.difficulty,
  'context_sentence': instance.contextSentence,
  'context_sentence_es': instance.contextSentenceEs,
  'image_url': instance.imageUrl,
};
