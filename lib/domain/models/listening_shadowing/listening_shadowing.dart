import 'package:freezed_annotation/freezed_annotation.dart';

part 'listening_shadowing.freezed.dart';
part 'listening_shadowing.g.dart';

@freezed
class ListeningShadowingSection with _$ListeningShadowingSection {
  const factory ListeningShadowingSection({
    @JsonKey(name: 'section_name') String? sectionName,
    @JsonKey(name: 'section_name_es') String? sectionNameEs,
    String? image,
    required String instructions,
    @JsonKey(name: 'instructions_es') required String instructionsEs,
    @Default([]) List<ListeningShadowingItem> data,
  }) = _ListeningShadowingSection;

  factory ListeningShadowingSection.fromJson(Map<String, dynamic> json) =>
      _$ListeningShadowingSectionFromJson(json);
}

@freezed
class ListeningShadowingItem with _$ListeningShadowingItem {
  const factory ListeningShadowingItem({
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'character_id') String? characterId,
    @JsonKey(name: 'character_display_name') String? characterDisplayName,
    required String text,
    @JsonKey(name: 'text_es') required String textEs,
    @JsonKey(name: 'tts_text') required String ttsText,
    @JsonKey(name: 'tts_voice_id') String? ttsVoiceId,
    @JsonKey(name: 'estimated_audio_duration_seconds')
    int? estimatedAudioDurationSeconds,
    @JsonKey(name: 'repeat_timer_seconds') int? repeatTimerSeconds,
    @JsonKey(name: 'repeat_count') int? repeatCount,
    @JsonKey(name: 'focus_vocab') @Default([]) List<String> focusVocab,
  }) = _ListeningShadowingItem;

  factory ListeningShadowingItem.fromJson(Map<String, dynamic> json) =>
      _$ListeningShadowingItemFromJson(json);
}
