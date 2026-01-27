import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_word.freezed.dart';
part 'vocabulary_word.g.dart';

/// Vocabulary word model
@freezed
class VocabularyWord with _$VocabularyWord {
  /// Factory constructor
  const factory VocabularyWord({
    /// The word itself
    required String word,
    
    /// Translation to Spanish
    @JsonKey(name: 'translation_es') required String translationEs,
    
    /// Type of word (noun, verb, adjective, etc.)
    @JsonKey(name: 'word_type') required String wordType,
    
    /// Type of word in Spanish
    @JsonKey(name: 'word_type_es') required String wordTypeEs,
    
    /// Difficulty level (1-5)
    required int difficulty,
    
    /// Example sentence with the word
    @JsonKey(name: 'context_sentence') required String contextSentence,
    
    /// Example sentence in Spanish
    @JsonKey(name: 'context_sentence_es') required String contextSentenceEs,
    
    /// Image URL for the word
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _VocabularyWord;

  /// Create from JSON
  factory VocabularyWord.fromJson(Map<String, dynamic> json) =>
      _$VocabularyWordFromJson(json);
}
