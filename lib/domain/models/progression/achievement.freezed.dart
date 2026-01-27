// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Achievement _$AchievementFromJson(Map<String, dynamic> json) {
  return _Achievement.fromJson(json);
}

/// @nodoc
mixin _$Achievement {
  /// ID único del logro
  @JsonKey(name: 'achievement_id')
  String get achievementId => throw _privateConstructorUsedError;

  /// Nombre del logro en inglés
  String get name => throw _privateConstructorUsedError;

  /// Nombre en español
  @JsonKey(name: 'name_es')
  String get nameEs => throw _privateConstructorUsedError;

  /// Descripción del logro en inglés
  String get description => throw _privateConstructorUsedError;

  /// Descripción en español
  @JsonKey(name: 'description_es')
  String get descriptionEs => throw _privateConstructorUsedError;

  /// URL del icono del logro
  String get icon => throw _privateConstructorUsedError;

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
    Achievement value,
    $Res Function(Achievement) then,
  ) = _$AchievementCopyWithImpl<$Res, Achievement>;
  @useResult
  $Res call({
    @JsonKey(name: 'achievement_id') String achievementId,
    String name,
    @JsonKey(name: 'name_es') String nameEs,
    String description,
    @JsonKey(name: 'description_es') String descriptionEs,
    String icon,
  });
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res, $Val extends Achievement>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementId = null,
    Object? name = null,
    Object? nameEs = null,
    Object? description = null,
    Object? descriptionEs = null,
    Object? icon = null,
  }) {
    return _then(
      _value.copyWith(
            achievementId: null == achievementId
                ? _value.achievementId
                : achievementId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            nameEs: null == nameEs
                ? _value.nameEs
                : nameEs // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionEs: null == descriptionEs
                ? _value.descriptionEs
                : descriptionEs // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AchievementImplCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$$AchievementImplCopyWith(
    _$AchievementImpl value,
    $Res Function(_$AchievementImpl) then,
  ) = __$$AchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'achievement_id') String achievementId,
    String name,
    @JsonKey(name: 'name_es') String nameEs,
    String description,
    @JsonKey(name: 'description_es') String descriptionEs,
    String icon,
  });
}

/// @nodoc
class __$$AchievementImplCopyWithImpl<$Res>
    extends _$AchievementCopyWithImpl<$Res, _$AchievementImpl>
    implements _$$AchievementImplCopyWith<$Res> {
  __$$AchievementImplCopyWithImpl(
    _$AchievementImpl _value,
    $Res Function(_$AchievementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementId = null,
    Object? name = null,
    Object? nameEs = null,
    Object? description = null,
    Object? descriptionEs = null,
    Object? icon = null,
  }) {
    return _then(
      _$AchievementImpl(
        achievementId: null == achievementId
            ? _value.achievementId
            : achievementId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEs: null == nameEs
            ? _value.nameEs
            : nameEs // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionEs: null == descriptionEs
            ? _value.descriptionEs
            : descriptionEs // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementImpl implements _Achievement {
  const _$AchievementImpl({
    @JsonKey(name: 'achievement_id') required this.achievementId,
    required this.name,
    @JsonKey(name: 'name_es') required this.nameEs,
    required this.description,
    @JsonKey(name: 'description_es') required this.descriptionEs,
    required this.icon,
  });

  factory _$AchievementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementImplFromJson(json);

  /// ID único del logro
  @override
  @JsonKey(name: 'achievement_id')
  final String achievementId;

  /// Nombre del logro en inglés
  @override
  final String name;

  /// Nombre en español
  @override
  @JsonKey(name: 'name_es')
  final String nameEs;

  /// Descripción del logro en inglés
  @override
  final String description;

  /// Descripción en español
  @override
  @JsonKey(name: 'description_es')
  final String descriptionEs;

  /// URL del icono del logro
  @override
  final String icon;

  @override
  String toString() {
    return 'Achievement(achievementId: $achievementId, name: $name, nameEs: $nameEs, description: $description, descriptionEs: $descriptionEs, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementImpl &&
            (identical(other.achievementId, achievementId) ||
                other.achievementId == achievementId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameEs, nameEs) || other.nameEs == nameEs) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionEs, descriptionEs) ||
                other.descriptionEs == descriptionEs) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    achievementId,
    name,
    nameEs,
    description,
    descriptionEs,
    icon,
  );

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      __$$AchievementImplCopyWithImpl<_$AchievementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementImplToJson(this);
  }
}

abstract class _Achievement implements Achievement {
  const factory _Achievement({
    @JsonKey(name: 'achievement_id') required final String achievementId,
    required final String name,
    @JsonKey(name: 'name_es') required final String nameEs,
    required final String description,
    @JsonKey(name: 'description_es') required final String descriptionEs,
    required final String icon,
  }) = _$AchievementImpl;

  factory _Achievement.fromJson(Map<String, dynamic> json) =
      _$AchievementImpl.fromJson;

  /// ID único del logro
  @override
  @JsonKey(name: 'achievement_id')
  String get achievementId;

  /// Nombre del logro en inglés
  @override
  String get name;

  /// Nombre en español
  @override
  @JsonKey(name: 'name_es')
  String get nameEs;

  /// Descripción del logro en inglés
  @override
  String get description;

  /// Descripción en español
  @override
  @JsonKey(name: 'description_es')
  String get descriptionEs;

  /// URL del icono del logro
  @override
  String get icon;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
