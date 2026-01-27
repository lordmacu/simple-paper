// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unlock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnlockImpl _$$UnlockImplFromJson(Map<String, dynamic> json) => _$UnlockImpl(
  type: json['type'] as String,
  characterIds: (json['character_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  locationIds: (json['location_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$UnlockImplToJson(_$UnlockImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'character_ids': instance.characterIds,
      'location_ids': instance.locationIds,
    };
