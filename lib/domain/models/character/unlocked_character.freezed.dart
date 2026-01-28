// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unlocked_character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UnlockedCharacter _$UnlockedCharacterFromJson(Map<String, dynamic> json) {
  return _UnlockedCharacter.fromJson(json);
}

/// @nodoc
mixin _$UnlockedCharacter {
  /// ID del personaje
  String get characterId => throw _privateConstructorUsedError;

  /// Nombre por defecto del personaje
  String get defaultName => throw _privateConstructorUsedError;

  /// Nombre personalizado por el usuario (si existe)
  String? get customName => throw _privateConstructorUsedError;

  /// Fecha/hora en que se desbloqueó (timestamp en milisegundos)
  int get unlockedAt => throw _privateConstructorUsedError;

  /// Número de episodio donde se desbloqueó
  int get episodeNumber => throw _privateConstructorUsedError;

  /// Serializes this UnlockedCharacter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnlockedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnlockedCharacterCopyWith<UnlockedCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnlockedCharacterCopyWith<$Res> {
  factory $UnlockedCharacterCopyWith(
    UnlockedCharacter value,
    $Res Function(UnlockedCharacter) then,
  ) = _$UnlockedCharacterCopyWithImpl<$Res, UnlockedCharacter>;
  @useResult
  $Res call({
    String characterId,
    String defaultName,
    String? customName,
    int unlockedAt,
    int episodeNumber,
  });
}

/// @nodoc
class _$UnlockedCharacterCopyWithImpl<$Res, $Val extends UnlockedCharacter>
    implements $UnlockedCharacterCopyWith<$Res> {
  _$UnlockedCharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnlockedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? defaultName = null,
    Object? customName = freezed,
    Object? unlockedAt = null,
    Object? episodeNumber = null,
  }) {
    return _then(
      _value.copyWith(
            characterId: null == characterId
                ? _value.characterId
                : characterId // ignore: cast_nullable_to_non_nullable
                      as String,
            defaultName: null == defaultName
                ? _value.defaultName
                : defaultName // ignore: cast_nullable_to_non_nullable
                      as String,
            customName: freezed == customName
                ? _value.customName
                : customName // ignore: cast_nullable_to_non_nullable
                      as String?,
            unlockedAt: null == unlockedAt
                ? _value.unlockedAt
                : unlockedAt // ignore: cast_nullable_to_non_nullable
                      as int,
            episodeNumber: null == episodeNumber
                ? _value.episodeNumber
                : episodeNumber // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UnlockedCharacterImplCopyWith<$Res>
    implements $UnlockedCharacterCopyWith<$Res> {
  factory _$$UnlockedCharacterImplCopyWith(
    _$UnlockedCharacterImpl value,
    $Res Function(_$UnlockedCharacterImpl) then,
  ) = __$$UnlockedCharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String characterId,
    String defaultName,
    String? customName,
    int unlockedAt,
    int episodeNumber,
  });
}

/// @nodoc
class __$$UnlockedCharacterImplCopyWithImpl<$Res>
    extends _$UnlockedCharacterCopyWithImpl<$Res, _$UnlockedCharacterImpl>
    implements _$$UnlockedCharacterImplCopyWith<$Res> {
  __$$UnlockedCharacterImplCopyWithImpl(
    _$UnlockedCharacterImpl _value,
    $Res Function(_$UnlockedCharacterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UnlockedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? defaultName = null,
    Object? customName = freezed,
    Object? unlockedAt = null,
    Object? episodeNumber = null,
  }) {
    return _then(
      _$UnlockedCharacterImpl(
        characterId: null == characterId
            ? _value.characterId
            : characterId // ignore: cast_nullable_to_non_nullable
                  as String,
        defaultName: null == defaultName
            ? _value.defaultName
            : defaultName // ignore: cast_nullable_to_non_nullable
                  as String,
        customName: freezed == customName
            ? _value.customName
            : customName // ignore: cast_nullable_to_non_nullable
                  as String?,
        unlockedAt: null == unlockedAt
            ? _value.unlockedAt
            : unlockedAt // ignore: cast_nullable_to_non_nullable
                  as int,
        episodeNumber: null == episodeNumber
            ? _value.episodeNumber
            : episodeNumber // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UnlockedCharacterImpl implements _UnlockedCharacter {
  const _$UnlockedCharacterImpl({
    required this.characterId,
    required this.defaultName,
    this.customName,
    required this.unlockedAt,
    required this.episodeNumber,
  });

  factory _$UnlockedCharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnlockedCharacterImplFromJson(json);

  /// ID del personaje
  @override
  final String characterId;

  /// Nombre por defecto del personaje
  @override
  final String defaultName;

  /// Nombre personalizado por el usuario (si existe)
  @override
  final String? customName;

  /// Fecha/hora en que se desbloqueó (timestamp en milisegundos)
  @override
  final int unlockedAt;

  /// Número de episodio donde se desbloqueó
  @override
  final int episodeNumber;

  @override
  String toString() {
    return 'UnlockedCharacter(characterId: $characterId, defaultName: $defaultName, customName: $customName, unlockedAt: $unlockedAt, episodeNumber: $episodeNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlockedCharacterImpl &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.defaultName, defaultName) ||
                other.defaultName == defaultName) &&
            (identical(other.customName, customName) ||
                other.customName == customName) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    characterId,
    defaultName,
    customName,
    unlockedAt,
    episodeNumber,
  );

  /// Create a copy of UnlockedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlockedCharacterImplCopyWith<_$UnlockedCharacterImpl> get copyWith =>
      __$$UnlockedCharacterImplCopyWithImpl<_$UnlockedCharacterImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UnlockedCharacterImplToJson(this);
  }
}

abstract class _UnlockedCharacter implements UnlockedCharacter {
  const factory _UnlockedCharacter({
    required final String characterId,
    required final String defaultName,
    final String? customName,
    required final int unlockedAt,
    required final int episodeNumber,
  }) = _$UnlockedCharacterImpl;

  factory _UnlockedCharacter.fromJson(Map<String, dynamic> json) =
      _$UnlockedCharacterImpl.fromJson;

  /// ID del personaje
  @override
  String get characterId;

  /// Nombre por defecto del personaje
  @override
  String get defaultName;

  /// Nombre personalizado por el usuario (si existe)
  @override
  String? get customName;

  /// Fecha/hora en que se desbloqueó (timestamp en milisegundos)
  @override
  int get unlockedAt;

  /// Número de episodio donde se desbloqueó
  @override
  int get episodeNumber;

  /// Create a copy of UnlockedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnlockedCharacterImplCopyWith<_$UnlockedCharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
