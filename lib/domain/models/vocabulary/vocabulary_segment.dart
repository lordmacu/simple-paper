import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_segment.freezed.dart';
part 'vocabulary_segment.g.dart';

/// Interactive element for vocabulary segment
@freezed
class VocabularyInteractive with _$VocabularyInteractive {
  /// Factory constructor
  const factory VocabularyInteractive({
    /// Type of interactive element
    required String type,
    
    /// Question in English
    required String question,
    
    /// Question in Spanish
    @JsonKey(name: 'question_es') required String questionEs,
    
    /// Input type
    @JsonKey(name: 'input_type') required String inputType,
    
    /// Variable name to save the input
    @JsonKey(name: 'save_as') required String saveAs,
    
    /// Example value
    String? example,
  }) = _VocabularyInteractive;

  /// Create from JSON
  factory VocabularyInteractive.fromJson(Map<String, dynamic> json) =>
      _$VocabularyInteractiveFromJson(json);
}

/// Text in both languages
@freezed
class BilingualText with _$BilingualText {
  /// Factory constructor
  const factory BilingualText({
    /// Text in English
    required String en,
    
    /// Text in Spanish
    required String es,
  }) = _BilingualText;

  /// Create from JSON
  factory BilingualText.fromJson(Map<String, dynamic> json) =>
      _$BilingualTextFromJson(json);
}

/// Vocabulary segment model (one slide in the vocabulary story)
@freezed
class VocabularySegment with _$VocabularySegment {
  /// Factory constructor
  const factory VocabularySegment({
    /// Unique segment ID
    @JsonKey(name: 'segment_id') required String segmentId,
    
    /// Image URL
    @JsonKey(name: 'image_url') String? imageUrl,
    
    /// Word being focused on
    @JsonKey(name: 'word_focus') String? wordFocus,
    
    /// Text in both languages
    required BilingualText text,
    
    /// Visual aid (emojis)
    @JsonKey(name: 'visual_aid') String? visualAid,
    
    /// Emphasis style for the word
    @JsonKey(name: 'emphasis_style') String? emphasisStyle,
    
    /// Interactive element
    VocabularyInteractive? interactive,
  }) = _VocabularySegment;

  /// Create from JSON
  factory VocabularySegment.fromJson(Map<String, dynamic> json) =>
      _$VocabularySegmentFromJson(json);
}
