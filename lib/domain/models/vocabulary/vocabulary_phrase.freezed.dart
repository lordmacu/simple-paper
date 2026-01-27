// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_phrase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VocabularyPhrase _$VocabularyPhraseFromJson(Map<String, dynamic> json) {
  return _VocabularyPhrase.fromJson(json);
}

/// @nodoc
mixin _$VocabularyPhrase {
  /// The phrase itself
  String get phrase => throw _privateConstructorUsedError;

  /// Translation to Spanish
  @JsonKey(name: 'translation_es')
  String get translationEs => throw _privateConstructorUsedError;

  /// Context where it's used
  @JsonKey(name: 'usage_context')
  String get usageContext => throw _privateConstructorUsedError;

  /// Context in Spanish
  @JsonKey(name: 'usage_context_es')
  String get usageContextEs => throw _privateConstructorUsedError;

  /// Serializes this VocabularyPhrase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyPhrase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyPhraseCopyWith<VocabularyPhrase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyPhraseCopyWith<$Res> {
  factory $VocabularyPhraseCopyWith(
    VocabularyPhrase value,
    $Res Function(VocabularyPhrase) then,
  ) = _$VocabularyPhraseCopyWithImpl<$Res, VocabularyPhrase>;
  @useResult
  $Res call({
    String phrase,
    @JsonKey(name: 'translation_es') String translationEs,
    @JsonKey(name: 'usage_context') String usageContext,
    @JsonKey(name: 'usage_context_es') String usageContextEs,
  });
}

/// @nodoc
class _$VocabularyPhraseCopyWithImpl<$Res, $Val extends VocabularyPhrase>
    implements $VocabularyPhraseCopyWith<$Res> {
  _$VocabularyPhraseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyPhrase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phrase = null,
    Object? translationEs = null,
    Object? usageContext = null,
    Object? usageContextEs = null,
  }) {
    return _then(
      _value.copyWith(
            phrase: null == phrase
                ? _value.phrase
                : phrase // ignore: cast_nullable_to_non_nullable
                      as String,
            translationEs: null == translationEs
                ? _value.translationEs
                : translationEs // ignore: cast_nullable_to_non_nullable
                      as String,
            usageContext: null == usageContext
                ? _value.usageContext
                : usageContext // ignore: cast_nullable_to_non_nullable
                      as String,
            usageContextEs: null == usageContextEs
                ? _value.usageContextEs
                : usageContextEs // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VocabularyPhraseImplCopyWith<$Res>
    implements $VocabularyPhraseCopyWith<$Res> {
  factory _$$VocabularyPhraseImplCopyWith(
    _$VocabularyPhraseImpl value,
    $Res Function(_$VocabularyPhraseImpl) then,
  ) = __$$VocabularyPhraseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String phrase,
    @JsonKey(name: 'translation_es') String translationEs,
    @JsonKey(name: 'usage_context') String usageContext,
    @JsonKey(name: 'usage_context_es') String usageContextEs,
  });
}

/// @nodoc
class __$$VocabularyPhraseImplCopyWithImpl<$Res>
    extends _$VocabularyPhraseCopyWithImpl<$Res, _$VocabularyPhraseImpl>
    implements _$$VocabularyPhraseImplCopyWith<$Res> {
  __$$VocabularyPhraseImplCopyWithImpl(
    _$VocabularyPhraseImpl _value,
    $Res Function(_$VocabularyPhraseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VocabularyPhrase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phrase = null,
    Object? translationEs = null,
    Object? usageContext = null,
    Object? usageContextEs = null,
  }) {
    return _then(
      _$VocabularyPhraseImpl(
        phrase: null == phrase
            ? _value.phrase
            : phrase // ignore: cast_nullable_to_non_nullable
                  as String,
        translationEs: null == translationEs
            ? _value.translationEs
            : translationEs // ignore: cast_nullable_to_non_nullable
                  as String,
        usageContext: null == usageContext
            ? _value.usageContext
            : usageContext // ignore: cast_nullable_to_non_nullable
                  as String,
        usageContextEs: null == usageContextEs
            ? _value.usageContextEs
            : usageContextEs // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyPhraseImpl implements _VocabularyPhrase {
  const _$VocabularyPhraseImpl({
    required this.phrase,
    @JsonKey(name: 'translation_es') required this.translationEs,
    @JsonKey(name: 'usage_context') required this.usageContext,
    @JsonKey(name: 'usage_context_es') required this.usageContextEs,
  });

  factory _$VocabularyPhraseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyPhraseImplFromJson(json);

  /// The phrase itself
  @override
  final String phrase;

  /// Translation to Spanish
  @override
  @JsonKey(name: 'translation_es')
  final String translationEs;

  /// Context where it's used
  @override
  @JsonKey(name: 'usage_context')
  final String usageContext;

  /// Context in Spanish
  @override
  @JsonKey(name: 'usage_context_es')
  final String usageContextEs;

  @override
  String toString() {
    return 'VocabularyPhrase(phrase: $phrase, translationEs: $translationEs, usageContext: $usageContext, usageContextEs: $usageContextEs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyPhraseImpl &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.translationEs, translationEs) ||
                other.translationEs == translationEs) &&
            (identical(other.usageContext, usageContext) ||
                other.usageContext == usageContext) &&
            (identical(other.usageContextEs, usageContextEs) ||
                other.usageContextEs == usageContextEs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    phrase,
    translationEs,
    usageContext,
    usageContextEs,
  );

  /// Create a copy of VocabularyPhrase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyPhraseImplCopyWith<_$VocabularyPhraseImpl> get copyWith =>
      __$$VocabularyPhraseImplCopyWithImpl<_$VocabularyPhraseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyPhraseImplToJson(this);
  }
}

abstract class _VocabularyPhrase implements VocabularyPhrase {
  const factory _VocabularyPhrase({
    required final String phrase,
    @JsonKey(name: 'translation_es') required final String translationEs,
    @JsonKey(name: 'usage_context') required final String usageContext,
    @JsonKey(name: 'usage_context_es') required final String usageContextEs,
  }) = _$VocabularyPhraseImpl;

  factory _VocabularyPhrase.fromJson(Map<String, dynamic> json) =
      _$VocabularyPhraseImpl.fromJson;

  /// The phrase itself
  @override
  String get phrase;

  /// Translation to Spanish
  @override
  @JsonKey(name: 'translation_es')
  String get translationEs;

  /// Context where it's used
  @override
  @JsonKey(name: 'usage_context')
  String get usageContext;

  /// Context in Spanish
  @override
  @JsonKey(name: 'usage_context_es')
  String get usageContextEs;

  /// Create a copy of VocabularyPhrase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyPhraseImplCopyWith<_$VocabularyPhraseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
