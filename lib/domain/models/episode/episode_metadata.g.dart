// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeMetadataImpl _$$EpisodeMetadataImplFromJson(
  Map<String, dynamic> json,
) => _$EpisodeMetadataImpl(
  sectionName: json['section_name'] as String?,
  sectionNameEs: json['section_name_es'] as String?,
  image: json['image'] as String?,
  episodeNumber: (json['episode_number'] as num).toInt(),
  episodeId: json['episode_id'] as String,
  title: json['title'] as String,
  titleEs: json['title_es'] as String,
  description: json['description'] as String,
  descriptionEs: json['description_es'] as String,
  internalLevel: json['internal_level'] as String,
  estimatedTimeMinutes: (json['estimated_time_minutes'] as num).toInt(),
  unlockRequirements: json['unlock_requirements'] as String?,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  previousEpisode: json['previous_episode'] as String?,
  nextEpisode: json['next_episode'] as String?,
);

Map<String, dynamic> _$$EpisodeMetadataImplToJson(
  _$EpisodeMetadataImpl instance,
) => <String, dynamic>{
  'section_name': instance.sectionName,
  'section_name_es': instance.sectionNameEs,
  'image': instance.image,
  'episode_number': instance.episodeNumber,
  'episode_id': instance.episodeId,
  'title': instance.title,
  'title_es': instance.titleEs,
  'description': instance.description,
  'description_es': instance.descriptionEs,
  'internal_level': instance.internalLevel,
  'estimated_time_minutes': instance.estimatedTimeMinutes,
  'unlock_requirements': instance.unlockRequirements,
  'tags': instance.tags,
  'previous_episode': instance.previousEpisode,
  'next_episode': instance.nextEpisode,
};
