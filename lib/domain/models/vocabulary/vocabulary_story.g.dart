// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocabularyStoryImpl _$$VocabularyStoryImplFromJson(
  Map<String, dynamic> json,
) => _$VocabularyStoryImpl(
  title: json['title'] as String,
  titleEs: json['title_es'] as String,
  description: json['description'] as String,
  descriptionEs: json['description_es'] as String,
  segments: (json['segments'] as List<dynamic>)
      .map((e) => VocabularySegment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$VocabularyStoryImplToJson(
  _$VocabularyStoryImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'title_es': instance.titleEs,
  'description': instance.description,
  'description_es': instance.descriptionEs,
  'segments': instance.segments,
};
