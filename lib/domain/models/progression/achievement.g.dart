// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementImpl _$$AchievementImplFromJson(Map<String, dynamic> json) =>
    _$AchievementImpl(
      achievementId: json['achievement_id'] as String,
      name: json['name'] as String,
      nameEs: json['name_es'] as String,
      description: json['description'] as String,
      descriptionEs: json['description_es'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$AchievementImplToJson(_$AchievementImpl instance) =>
    <String, dynamic>{
      'achievement_id': instance.achievementId,
      'name': instance.name,
      'name_es': instance.nameEs,
      'description': instance.description,
      'description_es': instance.descriptionEs,
      'icon': instance.icon,
    };
