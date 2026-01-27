// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reflection_prompt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReflectionPrompt _$ReflectionPromptFromJson(Map<String, dynamic> json) {
  return _ReflectionPrompt.fromJson(json);
}

/// @nodoc
mixin _$ReflectionPrompt {
  /// Pregunta del prompt en inglés
  @JsonKey(name: 'question_en')
  String get questionEn => throw _privateConstructorUsedError;

  /// Pregunta en español
  @JsonKey(name: 'question_es')
  String get questionEs => throw _privateConstructorUsedError;

  /// Tipo de input ('free_text', 'structured', etc.)
  String get type => throw _privateConstructorUsedError;

  /// Si el prompt es opcional
  bool get optional => throw _privateConstructorUsedError;

  /// Longitud máxima de la respuesta
  @JsonKey(name: 'max_length')
  int get maxLength => throw _privateConstructorUsedError;

  /// Palabras de vocabulario a practicar
  @JsonKey(name: 'vocab_practice')
  List<String> get vocabPractice => throw _privateConstructorUsedError;

  /// Serializes this ReflectionPrompt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReflectionPrompt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReflectionPromptCopyWith<ReflectionPrompt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReflectionPromptCopyWith<$Res> {
  factory $ReflectionPromptCopyWith(
    ReflectionPrompt value,
    $Res Function(ReflectionPrompt) then,
  ) = _$ReflectionPromptCopyWithImpl<$Res, ReflectionPrompt>;
  @useResult
  $Res call({
    @JsonKey(name: 'question_en') String questionEn,
    @JsonKey(name: 'question_es') String questionEs,
    String type,
    bool optional,
    @JsonKey(name: 'max_length') int maxLength,
    @JsonKey(name: 'vocab_practice') List<String> vocabPractice,
  });
}

/// @nodoc
class _$ReflectionPromptCopyWithImpl<$Res, $Val extends ReflectionPrompt>
    implements $ReflectionPromptCopyWith<$Res> {
  _$ReflectionPromptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReflectionPrompt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionEn = null,
    Object? questionEs = null,
    Object? type = null,
    Object? optional = null,
    Object? maxLength = null,
    Object? vocabPractice = null,
  }) {
    return _then(
      _value.copyWith(
            questionEn: null == questionEn
                ? _value.questionEn
                : questionEn // ignore: cast_nullable_to_non_nullable
                      as String,
            questionEs: null == questionEs
                ? _value.questionEs
                : questionEs // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            optional: null == optional
                ? _value.optional
                : optional // ignore: cast_nullable_to_non_nullable
                      as bool,
            maxLength: null == maxLength
                ? _value.maxLength
                : maxLength // ignore: cast_nullable_to_non_nullable
                      as int,
            vocabPractice: null == vocabPractice
                ? _value.vocabPractice
                : vocabPractice // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReflectionPromptImplCopyWith<$Res>
    implements $ReflectionPromptCopyWith<$Res> {
  factory _$$ReflectionPromptImplCopyWith(
    _$ReflectionPromptImpl value,
    $Res Function(_$ReflectionPromptImpl) then,
  ) = __$$ReflectionPromptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'question_en') String questionEn,
    @JsonKey(name: 'question_es') String questionEs,
    String type,
    bool optional,
    @JsonKey(name: 'max_length') int maxLength,
    @JsonKey(name: 'vocab_practice') List<String> vocabPractice,
  });
}

/// @nodoc
class __$$ReflectionPromptImplCopyWithImpl<$Res>
    extends _$ReflectionPromptCopyWithImpl<$Res, _$ReflectionPromptImpl>
    implements _$$ReflectionPromptImplCopyWith<$Res> {
  __$$ReflectionPromptImplCopyWithImpl(
    _$ReflectionPromptImpl _value,
    $Res Function(_$ReflectionPromptImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReflectionPrompt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionEn = null,
    Object? questionEs = null,
    Object? type = null,
    Object? optional = null,
    Object? maxLength = null,
    Object? vocabPractice = null,
  }) {
    return _then(
      _$ReflectionPromptImpl(
        questionEn: null == questionEn
            ? _value.questionEn
            : questionEn // ignore: cast_nullable_to_non_nullable
                  as String,
        questionEs: null == questionEs
            ? _value.questionEs
            : questionEs // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        optional: null == optional
            ? _value.optional
            : optional // ignore: cast_nullable_to_non_nullable
                  as bool,
        maxLength: null == maxLength
            ? _value.maxLength
            : maxLength // ignore: cast_nullable_to_non_nullable
                  as int,
        vocabPractice: null == vocabPractice
            ? _value._vocabPractice
            : vocabPractice // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReflectionPromptImpl implements _ReflectionPrompt {
  const _$ReflectionPromptImpl({
    @JsonKey(name: 'question_en') required this.questionEn,
    @JsonKey(name: 'question_es') required this.questionEs,
    required this.type,
    this.optional = true,
    @JsonKey(name: 'max_length') this.maxLength = 100,
    @JsonKey(name: 'vocab_practice')
    final List<String> vocabPractice = const [],
  }) : _vocabPractice = vocabPractice;

  factory _$ReflectionPromptImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReflectionPromptImplFromJson(json);

  /// Pregunta del prompt en inglés
  @override
  @JsonKey(name: 'question_en')
  final String questionEn;

  /// Pregunta en español
  @override
  @JsonKey(name: 'question_es')
  final String questionEs;

  /// Tipo de input ('free_text', 'structured', etc.)
  @override
  final String type;

  /// Si el prompt es opcional
  @override
  @JsonKey()
  final bool optional;

  /// Longitud máxima de la respuesta
  @override
  @JsonKey(name: 'max_length')
  final int maxLength;

  /// Palabras de vocabulario a practicar
  final List<String> _vocabPractice;

  /// Palabras de vocabulario a practicar
  @override
  @JsonKey(name: 'vocab_practice')
  List<String> get vocabPractice {
    if (_vocabPractice is EqualUnmodifiableListView) return _vocabPractice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vocabPractice);
  }

  @override
  String toString() {
    return 'ReflectionPrompt(questionEn: $questionEn, questionEs: $questionEs, type: $type, optional: $optional, maxLength: $maxLength, vocabPractice: $vocabPractice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReflectionPromptImpl &&
            (identical(other.questionEn, questionEn) ||
                other.questionEn == questionEn) &&
            (identical(other.questionEs, questionEs) ||
                other.questionEs == questionEs) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.optional, optional) ||
                other.optional == optional) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            const DeepCollectionEquality().equals(
              other._vocabPractice,
              _vocabPractice,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    questionEn,
    questionEs,
    type,
    optional,
    maxLength,
    const DeepCollectionEquality().hash(_vocabPractice),
  );

  /// Create a copy of ReflectionPrompt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReflectionPromptImplCopyWith<_$ReflectionPromptImpl> get copyWith =>
      __$$ReflectionPromptImplCopyWithImpl<_$ReflectionPromptImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReflectionPromptImplToJson(this);
  }
}

abstract class _ReflectionPrompt implements ReflectionPrompt {
  const factory _ReflectionPrompt({
    @JsonKey(name: 'question_en') required final String questionEn,
    @JsonKey(name: 'question_es') required final String questionEs,
    required final String type,
    final bool optional,
    @JsonKey(name: 'max_length') final int maxLength,
    @JsonKey(name: 'vocab_practice') final List<String> vocabPractice,
  }) = _$ReflectionPromptImpl;

  factory _ReflectionPrompt.fromJson(Map<String, dynamic> json) =
      _$ReflectionPromptImpl.fromJson;

  /// Pregunta del prompt en inglés
  @override
  @JsonKey(name: 'question_en')
  String get questionEn;

  /// Pregunta en español
  @override
  @JsonKey(name: 'question_es')
  String get questionEs;

  /// Tipo de input ('free_text', 'structured', etc.)
  @override
  String get type;

  /// Si el prompt es opcional
  @override
  bool get optional;

  /// Longitud máxima de la respuesta
  @override
  @JsonKey(name: 'max_length')
  int get maxLength;

  /// Palabras de vocabulario a practicar
  @override
  @JsonKey(name: 'vocab_practice')
  List<String> get vocabPractice;

  /// Create a copy of ReflectionPrompt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReflectionPromptImplCopyWith<_$ReflectionPromptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
