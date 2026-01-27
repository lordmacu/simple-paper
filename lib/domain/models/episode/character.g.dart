// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      characterId: json['character_id'] as String,
      defaultName: json['default_name'] as String,
      role: json['role'] as String,
      roleEs: json['role_es'] as String,
      personality: json['personality'] as String,
      personalityEs: json['personality_es'] as String,
      firstAppearance: json['first_appearance'] as bool? ?? false,
      customizableName: json['customizable_name'] as bool? ?? false,
      userCustomName: json['user_custom_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      introText: json['intro_text'] as String?,
      introTextEs: json['intro_text_es'] as String?,
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'character_id': instance.characterId,
      'default_name': instance.defaultName,
      'role': instance.role,
      'role_es': instance.roleEs,
      'personality': instance.personality,
      'personality_es': instance.personalityEs,
      'first_appearance': instance.firstAppearance,
      'customizable_name': instance.customizableName,
      'user_custom_name': instance.userCustomName,
      'avatar_url': instance.avatarUrl,
      'intro_text': instance.introText,
      'intro_text_es': instance.introTextEs,
    };
