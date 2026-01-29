// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listening_shadowing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListeningShadowingSectionImpl _$$ListeningShadowingSectionImplFromJson(
  Map<String, dynamic> json,
) => _$ListeningShadowingSectionImpl(
  sectionName: json['section_name'] as String?,
  sectionNameEs: json['section_name_es'] as String?,
  image: json['image'] as String?,
  instructions: json['instructions'] as String,
  instructionsEs: json['instructions_es'] as String,
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) => ListeningShadowingItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ListeningShadowingSectionImplToJson(
  _$ListeningShadowingSectionImpl instance,
) => <String, dynamic>{
  'section_name': instance.sectionName,
  'section_name_es': instance.sectionNameEs,
  'image': instance.image,
  'instructions': instance.instructions,
  'instructions_es': instance.instructionsEs,
  'data': instance.data,
};

_$ListeningShadowingItemImpl _$$ListeningShadowingItemImplFromJson(
  Map<String, dynamic> json,
) => _$ListeningShadowingItemImpl(
  itemId: json['item_id'] as String,
  characterId: json['character_id'] as String?,
  characterDisplayName: json['character_display_name'] as String?,
  text: json['text'] as String,
  textEs: json['text_es'] as String,
  ttsText: json['tts_text'] as String,
  ttsVoiceId: json['tts_voice_id'] as String?,
  estimatedAudioDurationSeconds:
      (json['estimated_audio_duration_seconds'] as num?)?.toInt(),
  repeatTimerSeconds: (json['repeat_timer_seconds'] as num?)?.toInt(),
  repeatCount: (json['repeat_count'] as num?)?.toInt(),
  focusVocab:
      (json['focus_vocab'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ListeningShadowingItemImplToJson(
  _$ListeningShadowingItemImpl instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'character_id': instance.characterId,
  'character_display_name': instance.characterDisplayName,
  'text': instance.text,
  'text_es': instance.textEs,
  'tts_text': instance.ttsText,
  'tts_voice_id': instance.ttsVoiceId,
  'estimated_audio_duration_seconds': instance.estimatedAudioDurationSeconds,
  'repeat_timer_seconds': instance.repeatTimerSeconds,
  'repeat_count': instance.repeatCount,
  'focus_vocab': instance.focusVocab,
};
