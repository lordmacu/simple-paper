// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progression.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Progression _$ProgressionFromJson(Map<String, dynamic> json) {
  return _Progression.fromJson(json);
}

/// @nodoc
mixin _$Progression {
  /// XP base ganado al completar el episodio
  @JsonKey(name: 'xp_earned_base')
  int get xpEarnedBase => throw _privateConstructorUsedError;

  /// Condiciones de bonificación de XP
  @JsonKey(name: 'xp_bonus_conditions')
  List<XpBonusCondition> get xpBonusConditions =>
      throw _privateConstructorUsedError;

  /// Desbloqueos del episodio (personajes, ubicaciones)
  List<Unlock> get unlocks => throw _privateConstructorUsedError;

  /// Logros que se pueden obtener
  List<Achievement> get achievements => throw _privateConstructorUsedError;

  /// Serializes this Progression to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Progression
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressionCopyWith<Progression> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressionCopyWith<$Res> {
  factory $ProgressionCopyWith(
    Progression value,
    $Res Function(Progression) then,
  ) = _$ProgressionCopyWithImpl<$Res, Progression>;
  @useResult
  $Res call({
    @JsonKey(name: 'xp_earned_base') int xpEarnedBase,
    @JsonKey(name: 'xp_bonus_conditions')
    List<XpBonusCondition> xpBonusConditions,
    List<Unlock> unlocks,
    List<Achievement> achievements,
  });
}

/// @nodoc
class _$ProgressionCopyWithImpl<$Res, $Val extends Progression>
    implements $ProgressionCopyWith<$Res> {
  _$ProgressionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Progression
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xpEarnedBase = null,
    Object? xpBonusConditions = null,
    Object? unlocks = null,
    Object? achievements = null,
  }) {
    return _then(
      _value.copyWith(
            xpEarnedBase: null == xpEarnedBase
                ? _value.xpEarnedBase
                : xpEarnedBase // ignore: cast_nullable_to_non_nullable
                      as int,
            xpBonusConditions: null == xpBonusConditions
                ? _value.xpBonusConditions
                : xpBonusConditions // ignore: cast_nullable_to_non_nullable
                      as List<XpBonusCondition>,
            unlocks: null == unlocks
                ? _value.unlocks
                : unlocks // ignore: cast_nullable_to_non_nullable
                      as List<Unlock>,
            achievements: null == achievements
                ? _value.achievements
                : achievements // ignore: cast_nullable_to_non_nullable
                      as List<Achievement>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProgressionImplCopyWith<$Res>
    implements $ProgressionCopyWith<$Res> {
  factory _$$ProgressionImplCopyWith(
    _$ProgressionImpl value,
    $Res Function(_$ProgressionImpl) then,
  ) = __$$ProgressionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'xp_earned_base') int xpEarnedBase,
    @JsonKey(name: 'xp_bonus_conditions')
    List<XpBonusCondition> xpBonusConditions,
    List<Unlock> unlocks,
    List<Achievement> achievements,
  });
}

/// @nodoc
class __$$ProgressionImplCopyWithImpl<$Res>
    extends _$ProgressionCopyWithImpl<$Res, _$ProgressionImpl>
    implements _$$ProgressionImplCopyWith<$Res> {
  __$$ProgressionImplCopyWithImpl(
    _$ProgressionImpl _value,
    $Res Function(_$ProgressionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Progression
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xpEarnedBase = null,
    Object? xpBonusConditions = null,
    Object? unlocks = null,
    Object? achievements = null,
  }) {
    return _then(
      _$ProgressionImpl(
        xpEarnedBase: null == xpEarnedBase
            ? _value.xpEarnedBase
            : xpEarnedBase // ignore: cast_nullable_to_non_nullable
                  as int,
        xpBonusConditions: null == xpBonusConditions
            ? _value._xpBonusConditions
            : xpBonusConditions // ignore: cast_nullable_to_non_nullable
                  as List<XpBonusCondition>,
        unlocks: null == unlocks
            ? _value._unlocks
            : unlocks // ignore: cast_nullable_to_non_nullable
                  as List<Unlock>,
        achievements: null == achievements
            ? _value._achievements
            : achievements // ignore: cast_nullable_to_non_nullable
                  as List<Achievement>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressionImpl implements _Progression {
  const _$ProgressionImpl({
    @JsonKey(name: 'xp_earned_base') this.xpEarnedBase = 0,
    @JsonKey(name: 'xp_bonus_conditions')
    final List<XpBonusCondition> xpBonusConditions = const [],
    final List<Unlock> unlocks = const [],
    final List<Achievement> achievements = const [],
  }) : _xpBonusConditions = xpBonusConditions,
       _unlocks = unlocks,
       _achievements = achievements;

  factory _$ProgressionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressionImplFromJson(json);

  /// XP base ganado al completar el episodio
  @override
  @JsonKey(name: 'xp_earned_base')
  final int xpEarnedBase;

  /// Condiciones de bonificación de XP
  final List<XpBonusCondition> _xpBonusConditions;

  /// Condiciones de bonificación de XP
  @override
  @JsonKey(name: 'xp_bonus_conditions')
  List<XpBonusCondition> get xpBonusConditions {
    if (_xpBonusConditions is EqualUnmodifiableListView)
      return _xpBonusConditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_xpBonusConditions);
  }

  /// Desbloqueos del episodio (personajes, ubicaciones)
  final List<Unlock> _unlocks;

  /// Desbloqueos del episodio (personajes, ubicaciones)
  @override
  @JsonKey()
  List<Unlock> get unlocks {
    if (_unlocks is EqualUnmodifiableListView) return _unlocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unlocks);
  }

  /// Logros que se pueden obtener
  final List<Achievement> _achievements;

  /// Logros que se pueden obtener
  @override
  @JsonKey()
  List<Achievement> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  String toString() {
    return 'Progression(xpEarnedBase: $xpEarnedBase, xpBonusConditions: $xpBonusConditions, unlocks: $unlocks, achievements: $achievements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressionImpl &&
            (identical(other.xpEarnedBase, xpEarnedBase) ||
                other.xpEarnedBase == xpEarnedBase) &&
            const DeepCollectionEquality().equals(
              other._xpBonusConditions,
              _xpBonusConditions,
            ) &&
            const DeepCollectionEquality().equals(other._unlocks, _unlocks) &&
            const DeepCollectionEquality().equals(
              other._achievements,
              _achievements,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    xpEarnedBase,
    const DeepCollectionEquality().hash(_xpBonusConditions),
    const DeepCollectionEquality().hash(_unlocks),
    const DeepCollectionEquality().hash(_achievements),
  );

  /// Create a copy of Progression
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressionImplCopyWith<_$ProgressionImpl> get copyWith =>
      __$$ProgressionImplCopyWithImpl<_$ProgressionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressionImplToJson(this);
  }
}

abstract class _Progression implements Progression {
  const factory _Progression({
    @JsonKey(name: 'xp_earned_base') final int xpEarnedBase,
    @JsonKey(name: 'xp_bonus_conditions')
    final List<XpBonusCondition> xpBonusConditions,
    final List<Unlock> unlocks,
    final List<Achievement> achievements,
  }) = _$ProgressionImpl;

  factory _Progression.fromJson(Map<String, dynamic> json) =
      _$ProgressionImpl.fromJson;

  /// XP base ganado al completar el episodio
  @override
  @JsonKey(name: 'xp_earned_base')
  int get xpEarnedBase;

  /// Condiciones de bonificación de XP
  @override
  @JsonKey(name: 'xp_bonus_conditions')
  List<XpBonusCondition> get xpBonusConditions;

  /// Desbloqueos del episodio (personajes, ubicaciones)
  @override
  List<Unlock> get unlocks;

  /// Logros que se pueden obtener
  @override
  List<Achievement> get achievements;

  /// Create a copy of Progression
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressionImplCopyWith<_$ProgressionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

XpBonusCondition _$XpBonusConditionFromJson(Map<String, dynamic> json) {
  return _XpBonusCondition.fromJson(json);
}

/// @nodoc
mixin _$XpBonusCondition {
  /// Condición a cumplir ('complete_all_games', 'perfect_choices', etc.)
  String get condition => throw _privateConstructorUsedError;

  /// XP bonus otorgado
  @JsonKey(name: 'bonus_xp')
  int get bonusXp => throw _privateConstructorUsedError;

  /// Serializes this XpBonusCondition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XpBonusCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XpBonusConditionCopyWith<XpBonusCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XpBonusConditionCopyWith<$Res> {
  factory $XpBonusConditionCopyWith(
    XpBonusCondition value,
    $Res Function(XpBonusCondition) then,
  ) = _$XpBonusConditionCopyWithImpl<$Res, XpBonusCondition>;
  @useResult
  $Res call({String condition, @JsonKey(name: 'bonus_xp') int bonusXp});
}

/// @nodoc
class _$XpBonusConditionCopyWithImpl<$Res, $Val extends XpBonusCondition>
    implements $XpBonusConditionCopyWith<$Res> {
  _$XpBonusConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XpBonusCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? condition = null, Object? bonusXp = null}) {
    return _then(
      _value.copyWith(
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String,
            bonusXp: null == bonusXp
                ? _value.bonusXp
                : bonusXp // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$XpBonusConditionImplCopyWith<$Res>
    implements $XpBonusConditionCopyWith<$Res> {
  factory _$$XpBonusConditionImplCopyWith(
    _$XpBonusConditionImpl value,
    $Res Function(_$XpBonusConditionImpl) then,
  ) = __$$XpBonusConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String condition, @JsonKey(name: 'bonus_xp') int bonusXp});
}

/// @nodoc
class __$$XpBonusConditionImplCopyWithImpl<$Res>
    extends _$XpBonusConditionCopyWithImpl<$Res, _$XpBonusConditionImpl>
    implements _$$XpBonusConditionImplCopyWith<$Res> {
  __$$XpBonusConditionImplCopyWithImpl(
    _$XpBonusConditionImpl _value,
    $Res Function(_$XpBonusConditionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of XpBonusCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? condition = null, Object? bonusXp = null}) {
    return _then(
      _$XpBonusConditionImpl(
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String,
        bonusXp: null == bonusXp
            ? _value.bonusXp
            : bonusXp // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$XpBonusConditionImpl implements _XpBonusCondition {
  const _$XpBonusConditionImpl({
    required this.condition,
    @JsonKey(name: 'bonus_xp') this.bonusXp = 0,
  });

  factory _$XpBonusConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$XpBonusConditionImplFromJson(json);

  /// Condición a cumplir ('complete_all_games', 'perfect_choices', etc.)
  @override
  final String condition;

  /// XP bonus otorgado
  @override
  @JsonKey(name: 'bonus_xp')
  final int bonusXp;

  @override
  String toString() {
    return 'XpBonusCondition(condition: $condition, bonusXp: $bonusXp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XpBonusConditionImpl &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.bonusXp, bonusXp) || other.bonusXp == bonusXp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, condition, bonusXp);

  /// Create a copy of XpBonusCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XpBonusConditionImplCopyWith<_$XpBonusConditionImpl> get copyWith =>
      __$$XpBonusConditionImplCopyWithImpl<_$XpBonusConditionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$XpBonusConditionImplToJson(this);
  }
}

abstract class _XpBonusCondition implements XpBonusCondition {
  const factory _XpBonusCondition({
    required final String condition,
    @JsonKey(name: 'bonus_xp') final int bonusXp,
  }) = _$XpBonusConditionImpl;

  factory _XpBonusCondition.fromJson(Map<String, dynamic> json) =
      _$XpBonusConditionImpl.fromJson;

  /// Condición a cumplir ('complete_all_games', 'perfect_choices', etc.)
  @override
  String get condition;

  /// XP bonus otorgado
  @override
  @JsonKey(name: 'bonus_xp')
  int get bonusXp;

  /// Create a copy of XpBonusCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XpBonusConditionImplCopyWith<_$XpBonusConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
