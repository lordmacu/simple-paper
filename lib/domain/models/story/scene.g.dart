// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SceneImpl _$$SceneImplFromJson(Map<String, dynamic> json) => _$SceneImpl(
  sceneId: json['scene_id'] as String,
  sceneNumber: (json['scene_number'] as num).toInt(),
  location: json['location'] as String,
  locationEs: json['location_es'] as String,
  time: json['time'] as String,
  timeEs: json['time_es'] as String,
  description: json['description'] as String,
  descriptionEs: json['description_es'] as String,
  dialogue:
      (json['dialogue'] as List<dynamic>?)
          ?.map((e) => Dialogue.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$SceneImplToJson(_$SceneImpl instance) =>
    <String, dynamic>{
      'scene_id': instance.sceneId,
      'scene_number': instance.sceneNumber,
      'location': instance.location,
      'location_es': instance.locationEs,
      'time': instance.time,
      'time_es': instance.timeEs,
      'description': instance.description,
      'description_es': instance.descriptionEs,
      'dialogue': instance.dialogue,
    };
