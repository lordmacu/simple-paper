import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:office_app/domain/models/vocabulary/vocabulary_segment.dart';

part 'vocabulary_story.freezed.dart';
part 'vocabulary_story.g.dart';

/// Vocabulary story model (introduction to new vocabulary)
@freezed
class VocabularyStory with _$VocabularyStory {
  /// Factory constructor
  const factory VocabularyStory({
    /// Story title in English
    required String title,
    
    /// Story title in Spanish
    @JsonKey(name: 'title_es') required String titleEs,
    
    /// Story description in English
    required String description,
    
    /// Story description in Spanish
    @JsonKey(name: 'description_es') required String descriptionEs,
    
    /// Segments (slides) of the story
    required List<VocabularySegment> segments,
  }) = _VocabularyStory;

  /// Create from JSON
  factory VocabularyStory.fromJson(Map<String, dynamic> json) =>
      _$VocabularyStoryFromJson(json);
}
