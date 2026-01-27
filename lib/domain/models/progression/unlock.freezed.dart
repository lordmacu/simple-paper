// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unlock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Unlock _$UnlockFromJson(Map<String, dynamic> json) {
  return _Unlock.fromJson(json);
}

/// @nodoc
mixin _$Unlock {
  /// Tipo de desbloqueo ('character', 'location', etc.)
  String get type => throw _privateConstructorUsedError;

  /// IDs de personajes desbloqueados (si type='character')
  @JsonKey(name: 'character_ids')
  List<String>? get characterIds => throw _privateConstructorUsedError;

  /// IDs de ubicaciones desbloqueadas (si type='location')
  @JsonKey(name: 'location_ids')
  List<String>? get locationIds => throw _privateConstructorUsedError;

  /// Serializes this Unlock to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Unlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnlockCopyWith<Unlock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnlockCopyWith<$Res> {
  factory $UnlockCopyWith(Unlock value, $Res Function(Unlock) then) =
      _$UnlockCopyWithImpl<$Res, Unlock>;
  @useResult
  $Res call({
    String type,
    @JsonKey(name: 'character_ids') List<String>? characterIds,
    @JsonKey(name: 'location_ids') List<String>? locationIds,
  });
}

/// @nodoc
class _$UnlockCopyWithImpl<$Res, $Val extends Unlock>
    implements $UnlockCopyWith<$Res> {
  _$UnlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Unlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? characterIds = freezed,
    Object? locationIds = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            characterIds: freezed == characterIds
                ? _value.characterIds
                : characterIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            locationIds: freezed == locationIds
                ? _value.locationIds
                : locationIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UnlockImplCopyWith<$Res> implements $UnlockCopyWith<$Res> {
  factory _$$UnlockImplCopyWith(
    _$UnlockImpl value,
    $Res Function(_$UnlockImpl) then,
  ) = __$$UnlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    @JsonKey(name: 'character_ids') List<String>? characterIds,
    @JsonKey(name: 'location_ids') List<String>? locationIds,
  });
}

/// @nodoc
class __$$UnlockImplCopyWithImpl<$Res>
    extends _$UnlockCopyWithImpl<$Res, _$UnlockImpl>
    implements _$$UnlockImplCopyWith<$Res> {
  __$$UnlockImplCopyWithImpl(
    _$UnlockImpl _value,
    $Res Function(_$UnlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Unlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? characterIds = freezed,
    Object? locationIds = freezed,
  }) {
    return _then(
      _$UnlockImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        characterIds: freezed == characterIds
            ? _value._characterIds
            : characterIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        locationIds: freezed == locationIds
            ? _value._locationIds
            : locationIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UnlockImpl implements _Unlock {
  const _$UnlockImpl({
    required this.type,
    @JsonKey(name: 'character_ids') final List<String>? characterIds,
    @JsonKey(name: 'location_ids') final List<String>? locationIds,
  }) : _characterIds = characterIds,
       _locationIds = locationIds;

  factory _$UnlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnlockImplFromJson(json);

  /// Tipo de desbloqueo ('character', 'location', etc.)
  @override
  final String type;

  /// IDs de personajes desbloqueados (si type='character')
  final List<String>? _characterIds;

  /// IDs de personajes desbloqueados (si type='character')
  @override
  @JsonKey(name: 'character_ids')
  List<String>? get characterIds {
    final value = _characterIds;
    if (value == null) return null;
    if (_characterIds is EqualUnmodifiableListView) return _characterIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// IDs de ubicaciones desbloqueadas (si type='location')
  final List<String>? _locationIds;

  /// IDs de ubicaciones desbloqueadas (si type='location')
  @override
  @JsonKey(name: 'location_ids')
  List<String>? get locationIds {
    final value = _locationIds;
    if (value == null) return null;
    if (_locationIds is EqualUnmodifiableListView) return _locationIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Unlock(type: $type, characterIds: $characterIds, locationIds: $locationIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlockImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._characterIds,
              _characterIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._locationIds,
              _locationIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    const DeepCollectionEquality().hash(_characterIds),
    const DeepCollectionEquality().hash(_locationIds),
  );

  /// Create a copy of Unlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlockImplCopyWith<_$UnlockImpl> get copyWith =>
      __$$UnlockImplCopyWithImpl<_$UnlockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnlockImplToJson(this);
  }
}

abstract class _Unlock implements Unlock {
  const factory _Unlock({
    required final String type,
    @JsonKey(name: 'character_ids') final List<String>? characterIds,
    @JsonKey(name: 'location_ids') final List<String>? locationIds,
  }) = _$UnlockImpl;

  factory _Unlock.fromJson(Map<String, dynamic> json) = _$UnlockImpl.fromJson;

  /// Tipo de desbloqueo ('character', 'location', etc.)
  @override
  String get type;

  /// IDs de personajes desbloqueados (si type='character')
  @override
  @JsonKey(name: 'character_ids')
  List<String>? get characterIds;

  /// IDs de ubicaciones desbloqueadas (si type='location')
  @override
  @JsonKey(name: 'location_ids')
  List<String>? get locationIds;

  /// Create a copy of Unlock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnlockImplCopyWith<_$UnlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
