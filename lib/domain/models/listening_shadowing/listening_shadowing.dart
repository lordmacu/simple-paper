/// Modelos para ejercicios de listening y shadowing.
library;

/// Modelos para ejercicios de listening y shadowing.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'listening_shadowing.freezed.dart';
part 'listening_shadowing.g.dart';

/// Sección de listening y shadowing
@freezed
class ListeningShadowingSection with _$ListeningShadowingSection {
  /// Crea una sección de listening y shadowing.
  /// 
  /// Parámetros:
  /// - [instructions]: Instrucciones en inglés
  /// - [instructionsEs]: Instrucciones en español  
  /// - [sectionName]: Nombre de la sección
  /// - [sectionNameEs]: Nombre de la sección en español
  /// - [image]: Imagen asociada
  /// - [data]: Lista de items de listening/shadowing
  const factory ListeningShadowingSection({
    required String instructions,
    @JsonKey(name: 'instructions_es') required String instructionsEs,
    @JsonKey(name: 'section_name') String? sectionName,
    @JsonKey(name: 'section_name_es') String? sectionNameEs,
    String? image,
    @Default([]) List<ListeningShadowingItem> data,
  }) = _ListeningShadowingSection;

  /// Crea ListeningShadowingSection desde JSON.
  factory ListeningShadowingSection.fromJson(Map<String, dynamic> json) =>
      _$ListeningShadowingSectionFromJson(json);
}

/// Item de listening y shadowing
@freezed
class ListeningShadowingItem with _$ListeningShadowingItem {
  /// Crea un item de listening y shadowing.
  /// 
  /// Parámetros:
  /// - [itemId]: ID único del item
  /// - [text]: Texto en inglés
  /// - [textEs]: Texto en español
  /// - [ttsText]: Texto para TTS
  /// - [characterId]: ID del personaje
  /// - [characterDisplayName]: Nombre del personaje para mostrar
  /// - [ttsVoiceId]: ID de voz TTS
  /// - [estimatedAudioDurationSeconds]: Duración estimada del audio en segundos
  /// - [repeatTimerSeconds]: Segundos para repetir
  /// - [repeatCount]: Número de repeticiones
  /// - [focusVocab]: Vocabulario de foco
  const factory ListeningShadowingItem({
    @JsonKey(name: 'item_id') required String itemId,
    required String text,
    @JsonKey(name: 'text_es') required String textEs,
    @JsonKey(name: 'tts_text') required String ttsText,
    @JsonKey(name: 'character_id') String? characterId,
    @JsonKey(name: 'character_display_name') String? characterDisplayName,
    @JsonKey(name: 'tts_voice_id') String? ttsVoiceId,
    @JsonKey(name: 'estimated_audio_duration_seconds')
    int? estimatedAudioDurationSeconds,
    @JsonKey(name: 'repeat_timer_seconds') int? repeatTimerSeconds,
    @JsonKey(name: 'repeat_count') int? repeatCount,
    @JsonKey(name: 'focus_vocab') @Default([]) List<String> focusVocab,
  }) = _ListeningShadowingItem;

  /// Crea ListeningShadowingItem desde JSON.
  factory ListeningShadowingItem.fromJson(Map<String, dynamic> json) =>
      _$ListeningShadowingItemFromJson(json);
}