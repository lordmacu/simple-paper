import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_phrase.freezed.dart';
part 'vocabulary_phrase.g.dart';

/// Vocabulary phrase model
@freezed
class VocabularyPhrase with _$VocabularyPhrase {
  /// Factory constructor
  const factory VocabularyPhrase({
    /// The phrase itself
    required String phrase,
    
    /// Translation to Spanish
    @JsonKey(name: 'translation_es') required String translationEs,
    
    /// Context where it's used
    @JsonKey(name: 'usage_context') required String usageContext,
    
    /// Context in Spanish
    @JsonKey(name: 'usage_context_es') required String usageContextEs,
  }) = _VocabularyPhrase;

  /// Create from JSON
  factory VocabularyPhrase.fromJson(Map<String, dynamic> json) =>
      _$VocabularyPhraseFromJson(json);
}
