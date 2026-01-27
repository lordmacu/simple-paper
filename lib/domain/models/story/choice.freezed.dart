// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return _Choice.fromJson(json);
}

/// @nodoc
mixin _$Choice {
  /// ID único de la opción (ej: "a", "b", "c")
  @JsonKey(name: 'choice_id')
  String get choiceId => throw _privateConstructorUsedError;

  /// Texto de la opción en inglés
  String get text => throw _privateConstructorUsedError;

  /// Traducción al español
  @JsonKey(name: 'translation_es')
  String get translationEs => throw _privateConstructorUsedError;

  /// Puntos otorgados al elegir esta opción
  int get points => throw _privateConstructorUsedError;

  /// Impacto en la personalidad del jugador
  @JsonKey(name: 'personality_impact')
  String? get personalityImpact => throw _privateConstructorUsedError;

  /// Palabras de vocabulario usadas en esta opción
  @JsonKey(name: 'vocab_used')
  List<String> get vocabUsed => throw _privateConstructorUsedError;

  /// Serializes this Choice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Choice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChoiceCopyWith<Choice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceCopyWith<$Res> {
  factory $ChoiceCopyWith(Choice value, $Res Function(Choice) then) =
      _$ChoiceCopyWithImpl<$Res, Choice>;
  @useResult
  $Res call({
    @JsonKey(name: 'choice_id') String choiceId,
    String text,
    @JsonKey(name: 'translation_es') String translationEs,
    int points,
    @JsonKey(name: 'personality_impact') String? personalityImpact,
    @JsonKey(name: 'vocab_used') List<String> vocabUsed,
  });
}

/// @nodoc
class _$ChoiceCopyWithImpl<$Res, $Val extends Choice>
    implements $ChoiceCopyWith<$Res> {
  _$ChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Choice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choiceId = null,
    Object? text = null,
    Object? translationEs = null,
    Object? points = null,
    Object? personalityImpact = freezed,
    Object? vocabUsed = null,
  }) {
    return _then(
      _value.copyWith(
            choiceId: null == choiceId
                ? _value.choiceId
                : choiceId // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            translationEs: null == translationEs
                ? _value.translationEs
                : translationEs // ignore: cast_nullable_to_non_nullable
                      as String,
            points: null == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                      as int,
            personalityImpact: freezed == personalityImpact
                ? _value.personalityImpact
                : personalityImpact // ignore: cast_nullable_to_non_nullable
                      as String?,
            vocabUsed: null == vocabUsed
                ? _value.vocabUsed
                : vocabUsed // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChoiceImplCopyWith<$Res> implements $ChoiceCopyWith<$Res> {
  factory _$$ChoiceImplCopyWith(
    _$ChoiceImpl value,
    $Res Function(_$ChoiceImpl) then,
  ) = __$$ChoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'choice_id') String choiceId,
    String text,
    @JsonKey(name: 'translation_es') String translationEs,
    int points,
    @JsonKey(name: 'personality_impact') String? personalityImpact,
    @JsonKey(name: 'vocab_used') List<String> vocabUsed,
  });
}

/// @nodoc
class __$$ChoiceImplCopyWithImpl<$Res>
    extends _$ChoiceCopyWithImpl<$Res, _$ChoiceImpl>
    implements _$$ChoiceImplCopyWith<$Res> {
  __$$ChoiceImplCopyWithImpl(
    _$ChoiceImpl _value,
    $Res Function(_$ChoiceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Choice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choiceId = null,
    Object? text = null,
    Object? translationEs = null,
    Object? points = null,
    Object? personalityImpact = freezed,
    Object? vocabUsed = null,
  }) {
    return _then(
      _$ChoiceImpl(
        choiceId: null == choiceId
            ? _value.choiceId
            : choiceId // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        translationEs: null == translationEs
            ? _value.translationEs
            : translationEs // ignore: cast_nullable_to_non_nullable
                  as String,
        points: null == points
            ? _value.points
            : points // ignore: cast_nullable_to_non_nullable
                  as int,
        personalityImpact: freezed == personalityImpact
            ? _value.personalityImpact
            : personalityImpact // ignore: cast_nullable_to_non_nullable
                  as String?,
        vocabUsed: null == vocabUsed
            ? _value._vocabUsed
            : vocabUsed // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChoiceImpl implements _Choice {
  const _$ChoiceImpl({
    @JsonKey(name: 'choice_id') required this.choiceId,
    required this.text,
    @JsonKey(name: 'translation_es') required this.translationEs,
    this.points = 0,
    @JsonKey(name: 'personality_impact') this.personalityImpact,
    @JsonKey(name: 'vocab_used') final List<String> vocabUsed = const [],
  }) : _vocabUsed = vocabUsed;

  factory _$ChoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChoiceImplFromJson(json);

  /// ID único de la opción (ej: "a", "b", "c")
  @override
  @JsonKey(name: 'choice_id')
  final String choiceId;

  /// Texto de la opción en inglés
  @override
  final String text;

  /// Traducción al español
  @override
  @JsonKey(name: 'translation_es')
  final String translationEs;

  /// Puntos otorgados al elegir esta opción
  @override
  @JsonKey()
  final int points;

  /// Impacto en la personalidad del jugador
  @override
  @JsonKey(name: 'personality_impact')
  final String? personalityImpact;

  /// Palabras de vocabulario usadas en esta opción
  final List<String> _vocabUsed;

  /// Palabras de vocabulario usadas en esta opción
  @override
  @JsonKey(name: 'vocab_used')
  List<String> get vocabUsed {
    if (_vocabUsed is EqualUnmodifiableListView) return _vocabUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vocabUsed);
  }

  @override
  String toString() {
    return 'Choice(choiceId: $choiceId, text: $text, translationEs: $translationEs, points: $points, personalityImpact: $personalityImpact, vocabUsed: $vocabUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoiceImpl &&
            (identical(other.choiceId, choiceId) ||
                other.choiceId == choiceId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.translationEs, translationEs) ||
                other.translationEs == translationEs) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.personalityImpact, personalityImpact) ||
                other.personalityImpact == personalityImpact) &&
            const DeepCollectionEquality().equals(
              other._vocabUsed,
              _vocabUsed,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    choiceId,
    text,
    translationEs,
    points,
    personalityImpact,
    const DeepCollectionEquality().hash(_vocabUsed),
  );

  /// Create a copy of Choice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoiceImplCopyWith<_$ChoiceImpl> get copyWith =>
      __$$ChoiceImplCopyWithImpl<_$ChoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChoiceImplToJson(this);
  }
}

abstract class _Choice implements Choice {
  const factory _Choice({
    @JsonKey(name: 'choice_id') required final String choiceId,
    required final String text,
    @JsonKey(name: 'translation_es') required final String translationEs,
    final int points,
    @JsonKey(name: 'personality_impact') final String? personalityImpact,
    @JsonKey(name: 'vocab_used') final List<String> vocabUsed,
  }) = _$ChoiceImpl;

  factory _Choice.fromJson(Map<String, dynamic> json) = _$ChoiceImpl.fromJson;

  /// ID único de la opción (ej: "a", "b", "c")
  @override
  @JsonKey(name: 'choice_id')
  String get choiceId;

  /// Texto de la opción en inglés
  @override
  String get text;

  /// Traducción al español
  @override
  @JsonKey(name: 'translation_es')
  String get translationEs;

  /// Puntos otorgados al elegir esta opción
  @override
  int get points;

  /// Impacto en la personalidad del jugador
  @override
  @JsonKey(name: 'personality_impact')
  String? get personalityImpact;

  /// Palabras de vocabulario usadas en esta opción
  @override
  @JsonKey(name: 'vocab_used')
  List<String> get vocabUsed;

  /// Create a copy of Choice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChoiceImplCopyWith<_$ChoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
