// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VocabularyWord _$VocabularyWordFromJson(Map<String, dynamic> json) {
  return _VocabularyWord.fromJson(json);
}

/// @nodoc
mixin _$VocabularyWord {
  /// The word itself
  String get word => throw _privateConstructorUsedError;

  /// Translation to Spanish
  @JsonKey(name: 'translation_es')
  String get translationEs => throw _privateConstructorUsedError;

  /// Type of word (noun, verb, adjective, etc.)
  @JsonKey(name: 'word_type')
  String get wordType => throw _privateConstructorUsedError;

  /// Type of word in Spanish
  @JsonKey(name: 'word_type_es')
  String get wordTypeEs => throw _privateConstructorUsedError;

  /// Difficulty level (1-5)
  int get difficulty => throw _privateConstructorUsedError;

  /// Example sentence with the word
  @JsonKey(name: 'context_sentence')
  String get contextSentence => throw _privateConstructorUsedError;

  /// Example sentence in Spanish
  @JsonKey(name: 'context_sentence_es')
  String get contextSentenceEs => throw _privateConstructorUsedError;

  /// Image URL for the word
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this VocabularyWord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyWordCopyWith<VocabularyWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyWordCopyWith<$Res> {
  factory $VocabularyWordCopyWith(
    VocabularyWord value,
    $Res Function(VocabularyWord) then,
  ) = _$VocabularyWordCopyWithImpl<$Res, VocabularyWord>;
  @useResult
  $Res call({
    String word,
    @JsonKey(name: 'translation_es') String translationEs,
    @JsonKey(name: 'word_type') String wordType,
    @JsonKey(name: 'word_type_es') String wordTypeEs,
    int difficulty,
    @JsonKey(name: 'context_sentence') String contextSentence,
    @JsonKey(name: 'context_sentence_es') String contextSentenceEs,
    @JsonKey(name: 'image_url') String? imageUrl,
  });
}

/// @nodoc
class _$VocabularyWordCopyWithImpl<$Res, $Val extends VocabularyWord>
    implements $VocabularyWordCopyWith<$Res> {
  _$VocabularyWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? translationEs = null,
    Object? wordType = null,
    Object? wordTypeEs = null,
    Object? difficulty = null,
    Object? contextSentence = null,
    Object? contextSentenceEs = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            word: null == word
                ? _value.word
                : word // ignore: cast_nullable_to_non_nullable
                      as String,
            translationEs: null == translationEs
                ? _value.translationEs
                : translationEs // ignore: cast_nullable_to_non_nullable
                      as String,
            wordType: null == wordType
                ? _value.wordType
                : wordType // ignore: cast_nullable_to_non_nullable
                      as String,
            wordTypeEs: null == wordTypeEs
                ? _value.wordTypeEs
                : wordTypeEs // ignore: cast_nullable_to_non_nullable
                      as String,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as int,
            contextSentence: null == contextSentence
                ? _value.contextSentence
                : contextSentence // ignore: cast_nullable_to_non_nullable
                      as String,
            contextSentenceEs: null == contextSentenceEs
                ? _value.contextSentenceEs
                : contextSentenceEs // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VocabularyWordImplCopyWith<$Res>
    implements $VocabularyWordCopyWith<$Res> {
  factory _$$VocabularyWordImplCopyWith(
    _$VocabularyWordImpl value,
    $Res Function(_$VocabularyWordImpl) then,
  ) = __$$VocabularyWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String word,
    @JsonKey(name: 'translation_es') String translationEs,
    @JsonKey(name: 'word_type') String wordType,
    @JsonKey(name: 'word_type_es') String wordTypeEs,
    int difficulty,
    @JsonKey(name: 'context_sentence') String contextSentence,
    @JsonKey(name: 'context_sentence_es') String contextSentenceEs,
    @JsonKey(name: 'image_url') String? imageUrl,
  });
}

/// @nodoc
class __$$VocabularyWordImplCopyWithImpl<$Res>
    extends _$VocabularyWordCopyWithImpl<$Res, _$VocabularyWordImpl>
    implements _$$VocabularyWordImplCopyWith<$Res> {
  __$$VocabularyWordImplCopyWithImpl(
    _$VocabularyWordImpl _value,
    $Res Function(_$VocabularyWordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? translationEs = null,
    Object? wordType = null,
    Object? wordTypeEs = null,
    Object? difficulty = null,
    Object? contextSentence = null,
    Object? contextSentenceEs = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$VocabularyWordImpl(
        word: null == word
            ? _value.word
            : word // ignore: cast_nullable_to_non_nullable
                  as String,
        translationEs: null == translationEs
            ? _value.translationEs
            : translationEs // ignore: cast_nullable_to_non_nullable
                  as String,
        wordType: null == wordType
            ? _value.wordType
            : wordType // ignore: cast_nullable_to_non_nullable
                  as String,
        wordTypeEs: null == wordTypeEs
            ? _value.wordTypeEs
            : wordTypeEs // ignore: cast_nullable_to_non_nullable
                  as String,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as int,
        contextSentence: null == contextSentence
            ? _value.contextSentence
            : contextSentence // ignore: cast_nullable_to_non_nullable
                  as String,
        contextSentenceEs: null == contextSentenceEs
            ? _value.contextSentenceEs
            : contextSentenceEs // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyWordImpl implements _VocabularyWord {
  const _$VocabularyWordImpl({
    required this.word,
    @JsonKey(name: 'translation_es') required this.translationEs,
    @JsonKey(name: 'word_type') required this.wordType,
    @JsonKey(name: 'word_type_es') required this.wordTypeEs,
    required this.difficulty,
    @JsonKey(name: 'context_sentence') required this.contextSentence,
    @JsonKey(name: 'context_sentence_es') required this.contextSentenceEs,
    @JsonKey(name: 'image_url') this.imageUrl,
  });

  factory _$VocabularyWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyWordImplFromJson(json);

  /// The word itself
  @override
  final String word;

  /// Translation to Spanish
  @override
  @JsonKey(name: 'translation_es')
  final String translationEs;

  /// Type of word (noun, verb, adjective, etc.)
  @override
  @JsonKey(name: 'word_type')
  final String wordType;

  /// Type of word in Spanish
  @override
  @JsonKey(name: 'word_type_es')
  final String wordTypeEs;

  /// Difficulty level (1-5)
  @override
  final int difficulty;

  /// Example sentence with the word
  @override
  @JsonKey(name: 'context_sentence')
  final String contextSentence;

  /// Example sentence in Spanish
  @override
  @JsonKey(name: 'context_sentence_es')
  final String contextSentenceEs;

  /// Image URL for the word
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'VocabularyWord(word: $word, translationEs: $translationEs, wordType: $wordType, wordTypeEs: $wordTypeEs, difficulty: $difficulty, contextSentence: $contextSentence, contextSentenceEs: $contextSentenceEs, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyWordImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.translationEs, translationEs) ||
                other.translationEs == translationEs) &&
            (identical(other.wordType, wordType) ||
                other.wordType == wordType) &&
            (identical(other.wordTypeEs, wordTypeEs) ||
                other.wordTypeEs == wordTypeEs) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.contextSentence, contextSentence) ||
                other.contextSentence == contextSentence) &&
            (identical(other.contextSentenceEs, contextSentenceEs) ||
                other.contextSentenceEs == contextSentenceEs) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    word,
    translationEs,
    wordType,
    wordTypeEs,
    difficulty,
    contextSentence,
    contextSentenceEs,
    imageUrl,
  );

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyWordImplCopyWith<_$VocabularyWordImpl> get copyWith =>
      __$$VocabularyWordImplCopyWithImpl<_$VocabularyWordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyWordImplToJson(this);
  }
}

abstract class _VocabularyWord implements VocabularyWord {
  const factory _VocabularyWord({
    required final String word,
    @JsonKey(name: 'translation_es') required final String translationEs,
    @JsonKey(name: 'word_type') required final String wordType,
    @JsonKey(name: 'word_type_es') required final String wordTypeEs,
    required final int difficulty,
    @JsonKey(name: 'context_sentence') required final String contextSentence,
    @JsonKey(name: 'context_sentence_es')
    required final String contextSentenceEs,
    @JsonKey(name: 'image_url') final String? imageUrl,
  }) = _$VocabularyWordImpl;

  factory _VocabularyWord.fromJson(Map<String, dynamic> json) =
      _$VocabularyWordImpl.fromJson;

  /// The word itself
  @override
  String get word;

  /// Translation to Spanish
  @override
  @JsonKey(name: 'translation_es')
  String get translationEs;

  /// Type of word (noun, verb, adjective, etc.)
  @override
  @JsonKey(name: 'word_type')
  String get wordType;

  /// Type of word in Spanish
  @override
  @JsonKey(name: 'word_type_es')
  String get wordTypeEs;

  /// Difficulty level (1-5)
  @override
  int get difficulty;

  /// Example sentence with the word
  @override
  @JsonKey(name: 'context_sentence')
  String get contextSentence;

  /// Example sentence in Spanish
  @override
  @JsonKey(name: 'context_sentence_es')
  String get contextSentenceEs;

  /// Image URL for the word
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyWordImplCopyWith<_$VocabularyWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
