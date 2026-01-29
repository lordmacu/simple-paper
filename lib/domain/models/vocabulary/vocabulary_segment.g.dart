// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocabularyInteractiveImpl _$$VocabularyInteractiveImplFromJson(
  Map<String, dynamic> json,
) => _$VocabularyInteractiveImpl(
  type: json['type'] as String,
  question: json['question'] as String,
  questionEs: json['question_es'] as String,
  inputType: json['input_type'] as String,
  saveAs: json['save_as'] as String,
  example: json['example'] as String?,
);

Map<String, dynamic> _$$VocabularyInteractiveImplToJson(
  _$VocabularyInteractiveImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'question': instance.question,
  'question_es': instance.questionEs,
  'input_type': instance.inputType,
  'save_as': instance.saveAs,
  'example': instance.example,
};

_$BilingualTextImpl _$$BilingualTextImplFromJson(Map<String, dynamic> json) =>
    _$BilingualTextImpl(en: json['en'] as String, es: json['es'] as String);

Map<String, dynamic> _$$BilingualTextImplToJson(_$BilingualTextImpl instance) =>
    <String, dynamic>{'en': instance.en, 'es': instance.es};

_$VocabularySegmentImpl _$$VocabularySegmentImplFromJson(
  Map<String, dynamic> json,
) => _$VocabularySegmentImpl(
  segmentId: json['segment_id'] as String,
  imageUrl: json['image_url'] as String?,
  wordFocus: json['word_focus'] as String?,
  text: BilingualText.fromJson(json['text'] as Map<String, dynamic>),
  emphasisStyle: json['emphasis_style'] as String?,
  interactive: json['interactive'] == null
      ? null
      : VocabularyInteractive.fromJson(
          json['interactive'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$VocabularySegmentImplToJson(
  _$VocabularySegmentImpl instance,
) => <String, dynamic>{
  'segment_id': instance.segmentId,
  'image_url': instance.imageUrl,
  'word_focus': instance.wordFocus,
  'text': instance.text,
  'emphasis_style': instance.emphasisStyle,
  'interactive': instance.interactive,
};
