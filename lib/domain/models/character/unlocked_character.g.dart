// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unlocked_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnlockedCharacterImpl _$$UnlockedCharacterImplFromJson(
  Map<String, dynamic> json,
) => _$UnlockedCharacterImpl(
  characterId: json['characterId'] as String,
  defaultName: json['defaultName'] as String,
  customName: json['customName'] as String?,
  unlockedAt: (json['unlockedAt'] as num).toInt(),
  episodeNumber: (json['episodeNumber'] as num).toInt(),
);

Map<String, dynamic> _$$UnlockedCharacterImplToJson(
  _$UnlockedCharacterImpl instance,
) => <String, dynamic>{
  'characterId': instance.characterId,
  'defaultName': instance.defaultName,
  'customName': instance.customName,
  'unlockedAt': instance.unlockedAt,
  'episodeNumber': instance.episodeNumber,
};
