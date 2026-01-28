// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProgress _$UserProgressFromJson(Map<String, dynamic> json) {
  return _UserProgress.fromJson(json);
}

/// @nodoc
mixin _$UserProgress {
  /// Episodios completados (episodeNumber -> EpisodeProgress)
  Map<int, EpisodeProgress> get completedEpisodes =>
      throw _privateConstructorUsedError;

  /// Último episodio desbloqueado
  int get lastUnlockedEpisode => throw _privateConstructorUsedError;

  /// Nivel actual del usuario
  int get userLevel => throw _privateConstructorUsedError;

  /// XP total acumulado
  int get totalXp => throw _privateConstructorUsedError;

  /// Logros
  List<Achievement> get achievements => throw _privateConstructorUsedError;

  /// Palabras para repasar
  @JsonKey(name: 'review_words')
  List<String> get reviewWords => throw _privateConstructorUsedError;

  /// Streak actual (días consecutivos)
  int get currentStreak => throw _privateConstructorUsedError;

  /// Fecha del último acceso
  DateTime? get lastAccessDate => throw _privateConstructorUsedError;

  /// Serializes this UserProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProgressCopyWith<UserProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProgressCopyWith<$Res> {
  factory $UserProgressCopyWith(
    UserProgress value,
    $Res Function(UserProgress) then,
  ) = _$UserProgressCopyWithImpl<$Res, UserProgress>;
  @useResult
  $Res call({
    Map<int, EpisodeProgress> completedEpisodes,
    int lastUnlockedEpisode,
    int userLevel,
    int totalXp,
    List<Achievement> achievements,
    @JsonKey(name: 'review_words') List<String> reviewWords,
    int currentStreak,
    DateTime? lastAccessDate,
  });
}

/// @nodoc
class _$UserProgressCopyWithImpl<$Res, $Val extends UserProgress>
    implements $UserProgressCopyWith<$Res> {
  _$UserProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedEpisodes = null,
    Object? lastUnlockedEpisode = null,
    Object? userLevel = null,
    Object? totalXp = null,
    Object? achievements = null,
    Object? reviewWords = null,
    Object? currentStreak = null,
    Object? lastAccessDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            completedEpisodes: null == completedEpisodes
                ? _value.completedEpisodes
                : completedEpisodes // ignore: cast_nullable_to_non_nullable
                      as Map<int, EpisodeProgress>,
            lastUnlockedEpisode: null == lastUnlockedEpisode
                ? _value.lastUnlockedEpisode
                : lastUnlockedEpisode // ignore: cast_nullable_to_non_nullable
                      as int,
            userLevel: null == userLevel
                ? _value.userLevel
                : userLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            totalXp: null == totalXp
                ? _value.totalXp
                : totalXp // ignore: cast_nullable_to_non_nullable
                      as int,
            achievements: null == achievements
                ? _value.achievements
                : achievements // ignore: cast_nullable_to_non_nullable
                      as List<Achievement>,
            reviewWords: null == reviewWords
                ? _value.reviewWords
                : reviewWords // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            currentStreak: null == currentStreak
                ? _value.currentStreak
                : currentStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            lastAccessDate: freezed == lastAccessDate
                ? _value.lastAccessDate
                : lastAccessDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserProgressImplCopyWith<$Res>
    implements $UserProgressCopyWith<$Res> {
  factory _$$UserProgressImplCopyWith(
    _$UserProgressImpl value,
    $Res Function(_$UserProgressImpl) then,
  ) = __$$UserProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<int, EpisodeProgress> completedEpisodes,
    int lastUnlockedEpisode,
    int userLevel,
    int totalXp,
    List<Achievement> achievements,
    @JsonKey(name: 'review_words') List<String> reviewWords,
    int currentStreak,
    DateTime? lastAccessDate,
  });
}

/// @nodoc
class __$$UserProgressImplCopyWithImpl<$Res>
    extends _$UserProgressCopyWithImpl<$Res, _$UserProgressImpl>
    implements _$$UserProgressImplCopyWith<$Res> {
  __$$UserProgressImplCopyWithImpl(
    _$UserProgressImpl _value,
    $Res Function(_$UserProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedEpisodes = null,
    Object? lastUnlockedEpisode = null,
    Object? userLevel = null,
    Object? totalXp = null,
    Object? achievements = null,
    Object? reviewWords = null,
    Object? currentStreak = null,
    Object? lastAccessDate = freezed,
  }) {
    return _then(
      _$UserProgressImpl(
        completedEpisodes: null == completedEpisodes
            ? _value._completedEpisodes
            : completedEpisodes // ignore: cast_nullable_to_non_nullable
                  as Map<int, EpisodeProgress>,
        lastUnlockedEpisode: null == lastUnlockedEpisode
            ? _value.lastUnlockedEpisode
            : lastUnlockedEpisode // ignore: cast_nullable_to_non_nullable
                  as int,
        userLevel: null == userLevel
            ? _value.userLevel
            : userLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        totalXp: null == totalXp
            ? _value.totalXp
            : totalXp // ignore: cast_nullable_to_non_nullable
                  as int,
        achievements: null == achievements
            ? _value._achievements
            : achievements // ignore: cast_nullable_to_non_nullable
                  as List<Achievement>,
        reviewWords: null == reviewWords
            ? _value._reviewWords
            : reviewWords // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        currentStreak: null == currentStreak
            ? _value.currentStreak
            : currentStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        lastAccessDate: freezed == lastAccessDate
            ? _value.lastAccessDate
            : lastAccessDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProgressImpl implements _UserProgress {
  const _$UserProgressImpl({
    final Map<int, EpisodeProgress> completedEpisodes = const {},
    this.lastUnlockedEpisode = 1,
    this.userLevel = 1,
    this.totalXp = 0,
    final List<Achievement> achievements = const [],
    @JsonKey(name: 'review_words') final List<String> reviewWords = const [],
    this.currentStreak = 0,
    this.lastAccessDate,
  }) : _completedEpisodes = completedEpisodes,
       _achievements = achievements,
       _reviewWords = reviewWords;

  factory _$UserProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProgressImplFromJson(json);

  /// Episodios completados (episodeNumber -> EpisodeProgress)
  final Map<int, EpisodeProgress> _completedEpisodes;

  /// Episodios completados (episodeNumber -> EpisodeProgress)
  @override
  @JsonKey()
  Map<int, EpisodeProgress> get completedEpisodes {
    if (_completedEpisodes is EqualUnmodifiableMapView)
      return _completedEpisodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_completedEpisodes);
  }

  /// Último episodio desbloqueado
  @override
  @JsonKey()
  final int lastUnlockedEpisode;

  /// Nivel actual del usuario
  @override
  @JsonKey()
  final int userLevel;

  /// XP total acumulado
  @override
  @JsonKey()
  final int totalXp;

  /// Logros
  final List<Achievement> _achievements;

  /// Logros
  @override
  @JsonKey()
  List<Achievement> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  /// Palabras para repasar
  final List<String> _reviewWords;

  /// Palabras para repasar
  @override
  @JsonKey(name: 'review_words')
  List<String> get reviewWords {
    if (_reviewWords is EqualUnmodifiableListView) return _reviewWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewWords);
  }

  /// Streak actual (días consecutivos)
  @override
  @JsonKey()
  final int currentStreak;

  /// Fecha del último acceso
  @override
  final DateTime? lastAccessDate;

  @override
  String toString() {
    return 'UserProgress(completedEpisodes: $completedEpisodes, lastUnlockedEpisode: $lastUnlockedEpisode, userLevel: $userLevel, totalXp: $totalXp, achievements: $achievements, reviewWords: $reviewWords, currentStreak: $currentStreak, lastAccessDate: $lastAccessDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProgressImpl &&
            const DeepCollectionEquality().equals(
              other._completedEpisodes,
              _completedEpisodes,
            ) &&
            (identical(other.lastUnlockedEpisode, lastUnlockedEpisode) ||
                other.lastUnlockedEpisode == lastUnlockedEpisode) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            const DeepCollectionEquality().equals(
              other._achievements,
              _achievements,
            ) &&
            const DeepCollectionEquality().equals(
              other._reviewWords,
              _reviewWords,
            ) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.lastAccessDate, lastAccessDate) ||
                other.lastAccessDate == lastAccessDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_completedEpisodes),
    lastUnlockedEpisode,
    userLevel,
    totalXp,
    const DeepCollectionEquality().hash(_achievements),
    const DeepCollectionEquality().hash(_reviewWords),
    currentStreak,
    lastAccessDate,
  );

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      __$$UserProgressImplCopyWithImpl<_$UserProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProgressImplToJson(this);
  }
}

abstract class _UserProgress implements UserProgress {
  const factory _UserProgress({
    final Map<int, EpisodeProgress> completedEpisodes,
    final int lastUnlockedEpisode,
    final int userLevel,
    final int totalXp,
    final List<Achievement> achievements,
    @JsonKey(name: 'review_words') final List<String> reviewWords,
    final int currentStreak,
    final DateTime? lastAccessDate,
  }) = _$UserProgressImpl;

  factory _UserProgress.fromJson(Map<String, dynamic> json) =
      _$UserProgressImpl.fromJson;

  /// Episodios completados (episodeNumber -> EpisodeProgress)
  @override
  Map<int, EpisodeProgress> get completedEpisodes;

  /// Último episodio desbloqueado
  @override
  int get lastUnlockedEpisode;

  /// Nivel actual del usuario
  @override
  int get userLevel;

  /// XP total acumulado
  @override
  int get totalXp;

  /// Logros
  @override
  List<Achievement> get achievements;

  /// Palabras para repasar
  @override
  @JsonKey(name: 'review_words')
  List<String> get reviewWords;

  /// Streak actual (días consecutivos)
  @override
  int get currentStreak;

  /// Fecha del último acceso
  @override
  DateTime? get lastAccessDate;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EpisodeProgress _$EpisodeProgressFromJson(Map<String, dynamic> json) {
  return _EpisodeProgress.fromJson(json);
}

/// @nodoc
mixin _$EpisodeProgress {
  /// Número del episodio
  int get episodeNumber => throw _privateConstructorUsedError;

  /// Si está completado
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Estrellas ganadas (0-3)
  int get starsEarned => throw _privateConstructorUsedError;

  /// XP ganado en este episodio
  int get xpEarned => throw _privateConstructorUsedError;

  /// Fecha de completitud
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Número de intentos
  int get attempts => throw _privateConstructorUsedError;

  /// Serializes this EpisodeProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EpisodeProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodeProgressCopyWith<EpisodeProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeProgressCopyWith<$Res> {
  factory $EpisodeProgressCopyWith(
    EpisodeProgress value,
    $Res Function(EpisodeProgress) then,
  ) = _$EpisodeProgressCopyWithImpl<$Res, EpisodeProgress>;
  @useResult
  $Res call({
    int episodeNumber,
    bool isCompleted,
    int starsEarned,
    int xpEarned,
    DateTime? completedAt,
    int attempts,
  });
}

/// @nodoc
class _$EpisodeProgressCopyWithImpl<$Res, $Val extends EpisodeProgress>
    implements $EpisodeProgressCopyWith<$Res> {
  _$EpisodeProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EpisodeProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodeNumber = null,
    Object? isCompleted = null,
    Object? starsEarned = null,
    Object? xpEarned = null,
    Object? completedAt = freezed,
    Object? attempts = null,
  }) {
    return _then(
      _value.copyWith(
            episodeNumber: null == episodeNumber
                ? _value.episodeNumber
                : episodeNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            starsEarned: null == starsEarned
                ? _value.starsEarned
                : starsEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            xpEarned: null == xpEarned
                ? _value.xpEarned
                : xpEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            attempts: null == attempts
                ? _value.attempts
                : attempts // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EpisodeProgressImplCopyWith<$Res>
    implements $EpisodeProgressCopyWith<$Res> {
  factory _$$EpisodeProgressImplCopyWith(
    _$EpisodeProgressImpl value,
    $Res Function(_$EpisodeProgressImpl) then,
  ) = __$$EpisodeProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int episodeNumber,
    bool isCompleted,
    int starsEarned,
    int xpEarned,
    DateTime? completedAt,
    int attempts,
  });
}

/// @nodoc
class __$$EpisodeProgressImplCopyWithImpl<$Res>
    extends _$EpisodeProgressCopyWithImpl<$Res, _$EpisodeProgressImpl>
    implements _$$EpisodeProgressImplCopyWith<$Res> {
  __$$EpisodeProgressImplCopyWithImpl(
    _$EpisodeProgressImpl _value,
    $Res Function(_$EpisodeProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EpisodeProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodeNumber = null,
    Object? isCompleted = null,
    Object? starsEarned = null,
    Object? xpEarned = null,
    Object? completedAt = freezed,
    Object? attempts = null,
  }) {
    return _then(
      _$EpisodeProgressImpl(
        episodeNumber: null == episodeNumber
            ? _value.episodeNumber
            : episodeNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        starsEarned: null == starsEarned
            ? _value.starsEarned
            : starsEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        xpEarned: null == xpEarned
            ? _value.xpEarned
            : xpEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        attempts: null == attempts
            ? _value.attempts
            : attempts // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeProgressImpl implements _EpisodeProgress {
  const _$EpisodeProgressImpl({
    required this.episodeNumber,
    this.isCompleted = false,
    this.starsEarned = 0,
    this.xpEarned = 0,
    this.completedAt,
    this.attempts = 1,
  });

  factory _$EpisodeProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeProgressImplFromJson(json);

  /// Número del episodio
  @override
  final int episodeNumber;

  /// Si está completado
  @override
  @JsonKey()
  final bool isCompleted;

  /// Estrellas ganadas (0-3)
  @override
  @JsonKey()
  final int starsEarned;

  /// XP ganado en este episodio
  @override
  @JsonKey()
  final int xpEarned;

  /// Fecha de completitud
  @override
  final DateTime? completedAt;

  /// Número de intentos
  @override
  @JsonKey()
  final int attempts;

  @override
  String toString() {
    return 'EpisodeProgress(episodeNumber: $episodeNumber, isCompleted: $isCompleted, starsEarned: $starsEarned, xpEarned: $xpEarned, completedAt: $completedAt, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeProgressImpl &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.starsEarned, starsEarned) ||
                other.starsEarned == starsEarned) &&
            (identical(other.xpEarned, xpEarned) ||
                other.xpEarned == xpEarned) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    episodeNumber,
    isCompleted,
    starsEarned,
    xpEarned,
    completedAt,
    attempts,
  );

  /// Create a copy of EpisodeProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeProgressImplCopyWith<_$EpisodeProgressImpl> get copyWith =>
      __$$EpisodeProgressImplCopyWithImpl<_$EpisodeProgressImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeProgressImplToJson(this);
  }
}

abstract class _EpisodeProgress implements EpisodeProgress {
  const factory _EpisodeProgress({
    required final int episodeNumber,
    final bool isCompleted,
    final int starsEarned,
    final int xpEarned,
    final DateTime? completedAt,
    final int attempts,
  }) = _$EpisodeProgressImpl;

  factory _EpisodeProgress.fromJson(Map<String, dynamic> json) =
      _$EpisodeProgressImpl.fromJson;

  /// Número del episodio
  @override
  int get episodeNumber;

  /// Si está completado
  @override
  bool get isCompleted;

  /// Estrellas ganadas (0-3)
  @override
  int get starsEarned;

  /// XP ganado en este episodio
  @override
  int get xpEarned;

  /// Fecha de completitud
  @override
  DateTime? get completedAt;

  /// Número de intentos
  @override
  int get attempts;

  /// Create a copy of EpisodeProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeProgressImplCopyWith<_$EpisodeProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
