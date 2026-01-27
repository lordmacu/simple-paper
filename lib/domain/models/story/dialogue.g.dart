// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialogue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DialogueImpl _$$DialogueImplFromJson(Map<String, dynamic> json) =>
    _$DialogueImpl(
      lineId: (json['line_id'] as num).toInt(),
      characterId: json['character_id'] as String?,
      characterDisplayName: json['character_display_name'] as String?,
      text: json['text'] as String?,
      translationEs: json['translation_es'] as String?,
      emotion: json['emotion'] as String?,
      notes: json['notes'] as String?,
      notesEs: json['notes_es'] as String?,
      highlightedVocab:
          (json['highlighted_vocab'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      templateVars:
          (json['template_vars'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isInteractive: json['is_interactive'] as bool? ?? false,
      interactionType: json['interaction_type'] as String?,
      choices:
          (json['choices'] as List<dynamic>?)
              ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DialogueImplToJson(_$DialogueImpl instance) =>
    <String, dynamic>{
      'line_id': instance.lineId,
      'character_id': instance.characterId,
      'character_display_name': instance.characterDisplayName,
      'text': instance.text,
      'translation_es': instance.translationEs,
      'emotion': instance.emotion,
      'notes': instance.notes,
      'notes_es': instance.notesEs,
      'highlighted_vocab': instance.highlightedVocab,
      'template_vars': instance.templateVars,
      'is_interactive': instance.isInteractive,
      'interaction_type': instance.interactionType,
      'choices': instance.choices,
    };
