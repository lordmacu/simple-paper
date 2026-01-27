// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matching_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MatchingGame _$MatchingGameFromJson(Map<String, dynamic> json) {
  return _MatchingGame.fromJson(json);
}

/// @nodoc
mixin _$MatchingGame {
  /// ID único del juego
  @JsonKey(name: 'game_id')
  String get gameId => throw _privateConstructorUsedError;

  /// Tipo de juego (siempre 'matching')
  @JsonKey(name: 'game_type')
  String get gameType => throw _privateConstructorUsedError;

  /// Título del juego en inglés
  String get title => throw _privateConstructorUsedError;

  /// Título en español
  @JsonKey(name: 'title_es')
  String get titleEs => throw _privateConstructorUsedError;

  /// Instrucciones en inglés
  String get instructions => throw _privateConstructorUsedError;

  /// Instrucciones en español
  @JsonKey(name: 'instructions_es')
  String get instructionsEs => throw _privateConstructorUsedError;

  /// Si el juego es opcional
  bool get optional => throw _privateConstructorUsedError;

  /// Si se desbloquea después del episodio
  @JsonKey(name: 'unlocked_after_episode')
  bool get unlockedAfterEpisode => throw _privateConstructorUsedError;

  /// Límite de tiempo en segundos
  @JsonKey(name: 'time_limit_seconds')
  int? get timeLimitSeconds => throw _privateConstructorUsedError;

  /// Recompensa en XP
  @JsonKey(name: 'xp_reward')
  int get xpReward => throw _privateConstructorUsedError;

  /// Contenido del juego
  MatchingGameContent get content => throw _privateConstructorUsedError;

  /// Configuración del juego
  MatchingGameSettings? get settings => throw _privateConstructorUsedError;

  /// Serializes this MatchingGame to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingGameCopyWith<MatchingGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingGameCopyWith<$Res> {
  factory $MatchingGameCopyWith(
    MatchingGame value,
    $Res Function(MatchingGame) then,
  ) = _$MatchingGameCopyWithImpl<$Res, MatchingGame>;
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
    MatchingGameContent content,
    MatchingGameSettings? settings,
  });

  $MatchingGameContentCopyWith<$Res> get content;
  $MatchingGameSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$MatchingGameCopyWithImpl<$Res, $Val extends MatchingGame>
    implements $MatchingGameCopyWith<$Res> {
  _$MatchingGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingGame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? gameType = null,
    Object? title = null,
    Object? titleEs = null,
    Object? instructions = null,
    Object? instructionsEs = null,
    Object? optional = null,
    Object? unlockedAfterEpisode = null,
    Object? timeLimitSeconds = freezed,
    Object? xpReward = null,
    Object? content = null,
    Object? settings = freezed,
  }) {
    return _then(
      _value.copyWith(
            gameId: null == gameId
                ? _value.gameId
                : gameId // ignore: cast_nullable_to_non_nullable
                      as String,
            gameType: null == gameType
                ? _value.gameType
                : gameType // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            titleEs: null == titleEs
                ? _value.titleEs
                : titleEs // ignore: cast_nullable_to_non_nullable
                      as String,
            instructions: null == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
                      as String,
            instructionsEs: null == instructionsEs
                ? _value.instructionsEs
                : instructionsEs // ignore: cast_nullable_to_non_nullable
                      as String,
            optional: null == optional
                ? _value.optional
                : optional // ignore: cast_nullable_to_non_nullable
                      as bool,
            unlockedAfterEpisode: null == unlockedAfterEpisode
                ? _value.unlockedAfterEpisode
                : unlockedAfterEpisode // ignore: cast_nullable_to_non_nullable
                      as bool,
            timeLimitSeconds: freezed == timeLimitSeconds
                ? _value.timeLimitSeconds
                : timeLimitSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            xpReward: null == xpReward
                ? _value.xpReward
                : xpReward // ignore: cast_nullable_to_non_nullable
                      as int,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as MatchingGameContent,
            settings: freezed == settings
                ? _value.settings
                : settings // ignore: cast_nullable_to_non_nullable
                      as MatchingGameSettings?,
          )
          as $Val,
    );
  }

  /// Create a copy of MatchingGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchingGameContentCopyWith<$Res> get content {
    return $MatchingGameContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  /// Create a copy of MatchingGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchingGameSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $MatchingGameSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchingGameImplCopyWith<$Res>
    implements $MatchingGameCopyWith<$Res> {
  factory _$$MatchingGameImplCopyWith(
    _$MatchingGameImpl value,
    $Res Function(_$MatchingGameImpl) then,
  ) = __$$MatchingGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
    MatchingGameContent content,
    MatchingGameSettings? settings,
  });

  @override
  $MatchingGameContentCopyWith<$Res> get content;
  @override
  $MatchingGameSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$MatchingGameImplCopyWithImpl<$Res>
    extends _$MatchingGameCopyWithImpl<$Res, _$MatchingGameImpl>
    implements _$$MatchingGameImplCopyWith<$Res> {
  __$$MatchingGameImplCopyWithImpl(
    _$MatchingGameImpl _value,
    $Res Function(_$MatchingGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchingGame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? gameType = null,
    Object? title = null,
    Object? titleEs = null,
    Object? instructions = null,
    Object? instructionsEs = null,
    Object? optional = null,
    Object? unlockedAfterEpisode = null,
    Object? timeLimitSeconds = freezed,
    Object? xpReward = null,
    Object? content = null,
    Object? settings = freezed,
  }) {
    return _then(
      _$MatchingGameImpl(
        gameId: null == gameId
            ? _value.gameId
            : gameId // ignore: cast_nullable_to_non_nullable
                  as String,
        gameType: null == gameType
            ? _value.gameType
            : gameType // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        titleEs: null == titleEs
            ? _value.titleEs
            : titleEs // ignore: cast_nullable_to_non_nullable
                  as String,
        instructions: null == instructions
            ? _value.instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as String,
        instructionsEs: null == instructionsEs
            ? _value.instructionsEs
            : instructionsEs // ignore: cast_nullable_to_non_nullable
                  as String,
        optional: null == optional
            ? _value.optional
            : optional // ignore: cast_nullable_to_non_nullable
                  as bool,
        unlockedAfterEpisode: null == unlockedAfterEpisode
            ? _value.unlockedAfterEpisode
            : unlockedAfterEpisode // ignore: cast_nullable_to_non_nullable
                  as bool,
        timeLimitSeconds: freezed == timeLimitSeconds
            ? _value.timeLimitSeconds
            : timeLimitSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        xpReward: null == xpReward
            ? _value.xpReward
            : xpReward // ignore: cast_nullable_to_non_nullable
                  as int,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as MatchingGameContent,
        settings: freezed == settings
            ? _value.settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as MatchingGameSettings?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchingGameImpl extends _MatchingGame {
  const _$MatchingGameImpl({
    @JsonKey(name: 'game_id') required this.gameId,
    @JsonKey(name: 'game_type') required this.gameType,
    required this.title,
    @JsonKey(name: 'title_es') required this.titleEs,
    required this.instructions,
    @JsonKey(name: 'instructions_es') required this.instructionsEs,
    this.optional = true,
    @JsonKey(name: 'unlocked_after_episode') this.unlockedAfterEpisode = true,
    @JsonKey(name: 'time_limit_seconds') this.timeLimitSeconds,
    @JsonKey(name: 'xp_reward') this.xpReward = 0,
    required this.content,
    this.settings,
  }) : super._();

  factory _$MatchingGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingGameImplFromJson(json);

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  final String gameId;

  /// Tipo de juego (siempre 'matching')
  @override
  @JsonKey(name: 'game_type')
  final String gameType;

  /// Título del juego en inglés
  @override
  final String title;

  /// Título en español
  @override
  @JsonKey(name: 'title_es')
  final String titleEs;

  /// Instrucciones en inglés
  @override
  final String instructions;

  /// Instrucciones en español
  @override
  @JsonKey(name: 'instructions_es')
  final String instructionsEs;

  /// Si el juego es opcional
  @override
  @JsonKey()
  final bool optional;

  /// Si se desbloquea después del episodio
  @override
  @JsonKey(name: 'unlocked_after_episode')
  final bool unlockedAfterEpisode;

  /// Límite de tiempo en segundos
  @override
  @JsonKey(name: 'time_limit_seconds')
  final int? timeLimitSeconds;

  /// Recompensa en XP
  @override
  @JsonKey(name: 'xp_reward')
  final int xpReward;

  /// Contenido del juego
  @override
  final MatchingGameContent content;

  /// Configuración del juego
  @override
  final MatchingGameSettings? settings;

  @override
  String toString() {
    return 'MatchingGame(gameId: $gameId, gameType: $gameType, title: $title, titleEs: $titleEs, instructions: $instructions, instructionsEs: $instructionsEs, optional: $optional, unlockedAfterEpisode: $unlockedAfterEpisode, timeLimitSeconds: $timeLimitSeconds, xpReward: $xpReward, content: $content, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingGameImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleEs, titleEs) || other.titleEs == titleEs) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.instructionsEs, instructionsEs) ||
                other.instructionsEs == instructionsEs) &&
            (identical(other.optional, optional) ||
                other.optional == optional) &&
            (identical(other.unlockedAfterEpisode, unlockedAfterEpisode) ||
                other.unlockedAfterEpisode == unlockedAfterEpisode) &&
            (identical(other.timeLimitSeconds, timeLimitSeconds) ||
                other.timeLimitSeconds == timeLimitSeconds) &&
            (identical(other.xpReward, xpReward) ||
                other.xpReward == xpReward) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    gameId,
    gameType,
    title,
    titleEs,
    instructions,
    instructionsEs,
    optional,
    unlockedAfterEpisode,
    timeLimitSeconds,
    xpReward,
    content,
    settings,
  );

  /// Create a copy of MatchingGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingGameImplCopyWith<_$MatchingGameImpl> get copyWith =>
      __$$MatchingGameImplCopyWithImpl<_$MatchingGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingGameImplToJson(this);
  }
}

abstract class _MatchingGame extends MatchingGame {
  const factory _MatchingGame({
    @JsonKey(name: 'game_id') required final String gameId,
    @JsonKey(name: 'game_type') required final String gameType,
    required final String title,
    @JsonKey(name: 'title_es') required final String titleEs,
    required final String instructions,
    @JsonKey(name: 'instructions_es') required final String instructionsEs,
    final bool optional,
    @JsonKey(name: 'unlocked_after_episode') final bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') final int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') final int xpReward,
    required final MatchingGameContent content,
    final MatchingGameSettings? settings,
  }) = _$MatchingGameImpl;
  const _MatchingGame._() : super._();

  factory _MatchingGame.fromJson(Map<String, dynamic> json) =
      _$MatchingGameImpl.fromJson;

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  String get gameId;

  /// Tipo de juego (siempre 'matching')
  @override
  @JsonKey(name: 'game_type')
  String get gameType;

  /// Título del juego en inglés
  @override
  String get title;

  /// Título en español
  @override
  @JsonKey(name: 'title_es')
  String get titleEs;

  /// Instrucciones en inglés
  @override
  String get instructions;

  /// Instrucciones en español
  @override
  @JsonKey(name: 'instructions_es')
  String get instructionsEs;

  /// Si el juego es opcional
  @override
  bool get optional;

  /// Si se desbloquea después del episodio
  @override
  @JsonKey(name: 'unlocked_after_episode')
  bool get unlockedAfterEpisode;

  /// Límite de tiempo en segundos
  @override
  @JsonKey(name: 'time_limit_seconds')
  int? get timeLimitSeconds;

  /// Recompensa en XP
  @override
  @JsonKey(name: 'xp_reward')
  int get xpReward;

  /// Contenido del juego
  @override
  MatchingGameContent get content;

  /// Configuración del juego
  @override
  MatchingGameSettings? get settings;

  /// Create a copy of MatchingGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingGameImplCopyWith<_$MatchingGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchingGameContent _$MatchingGameContentFromJson(Map<String, dynamic> json) {
  return _MatchingGameContent.fromJson(json);
}

/// @nodoc
mixin _$MatchingGameContent {
  /// Lista de ítems a emparejar
  List<MatchingItem> get items => throw _privateConstructorUsedError;

  /// Serializes this MatchingGameContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingGameContentCopyWith<MatchingGameContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingGameContentCopyWith<$Res> {
  factory $MatchingGameContentCopyWith(
    MatchingGameContent value,
    $Res Function(MatchingGameContent) then,
  ) = _$MatchingGameContentCopyWithImpl<$Res, MatchingGameContent>;
  @useResult
  $Res call({List<MatchingItem> items});
}

/// @nodoc
class _$MatchingGameContentCopyWithImpl<$Res, $Val extends MatchingGameContent>
    implements $MatchingGameContentCopyWith<$Res> {
  _$MatchingGameContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<MatchingItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MatchingGameContentImplCopyWith<$Res>
    implements $MatchingGameContentCopyWith<$Res> {
  factory _$$MatchingGameContentImplCopyWith(
    _$MatchingGameContentImpl value,
    $Res Function(_$MatchingGameContentImpl) then,
  ) = __$$MatchingGameContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MatchingItem> items});
}

/// @nodoc
class __$$MatchingGameContentImplCopyWithImpl<$Res>
    extends _$MatchingGameContentCopyWithImpl<$Res, _$MatchingGameContentImpl>
    implements _$$MatchingGameContentImplCopyWith<$Res> {
  __$$MatchingGameContentImplCopyWithImpl(
    _$MatchingGameContentImpl _value,
    $Res Function(_$MatchingGameContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$MatchingGameContentImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<MatchingItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchingGameContentImpl implements _MatchingGameContent {
  const _$MatchingGameContentImpl({final List<MatchingItem> items = const []})
    : _items = items;

  factory _$MatchingGameContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingGameContentImplFromJson(json);

  /// Lista de ítems a emparejar
  final List<MatchingItem> _items;

  /// Lista de ítems a emparejar
  @override
  @JsonKey()
  List<MatchingItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'MatchingGameContent(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingGameContentImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of MatchingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingGameContentImplCopyWith<_$MatchingGameContentImpl> get copyWith =>
      __$$MatchingGameContentImplCopyWithImpl<_$MatchingGameContentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingGameContentImplToJson(this);
  }
}

abstract class _MatchingGameContent implements MatchingGameContent {
  const factory _MatchingGameContent({final List<MatchingItem> items}) =
      _$MatchingGameContentImpl;

  factory _MatchingGameContent.fromJson(Map<String, dynamic> json) =
      _$MatchingGameContentImpl.fromJson;

  /// Lista de ítems a emparejar
  @override
  List<MatchingItem> get items;

  /// Create a copy of MatchingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingGameContentImplCopyWith<_$MatchingGameContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchingItem _$MatchingItemFromJson(Map<String, dynamic> json) {
  return _MatchingItem.fromJson(json);
}

/// @nodoc
mixin _$MatchingItem {
  /// ID del ítem
  int get id => throw _privateConstructorUsedError;

  /// Texto del lado izquierdo (ej: palabra en inglés)
  String get left => throw _privateConstructorUsedError;

  /// Texto del lado derecho (ej: traducción al español)
  String get right => throw _privateConstructorUsedError;

  /// URL de imagen opcional
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this MatchingItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingItemCopyWith<MatchingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingItemCopyWith<$Res> {
  factory $MatchingItemCopyWith(
    MatchingItem value,
    $Res Function(MatchingItem) then,
  ) = _$MatchingItemCopyWithImpl<$Res, MatchingItem>;
  @useResult
  $Res call({
    int id,
    String left,
    String right,
    @JsonKey(name: 'image_url') String? imageUrl,
  });
}

/// @nodoc
class _$MatchingItemCopyWithImpl<$Res, $Val extends MatchingItem>
    implements $MatchingItemCopyWith<$Res> {
  _$MatchingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? left = null,
    Object? right = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            left: null == left
                ? _value.left
                : left // ignore: cast_nullable_to_non_nullable
                      as String,
            right: null == right
                ? _value.right
                : right // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MatchingItemImplCopyWith<$Res>
    implements $MatchingItemCopyWith<$Res> {
  factory _$$MatchingItemImplCopyWith(
    _$MatchingItemImpl value,
    $Res Function(_$MatchingItemImpl) then,
  ) = __$$MatchingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String left,
    String right,
    @JsonKey(name: 'image_url') String? imageUrl,
  });
}

/// @nodoc
class __$$MatchingItemImplCopyWithImpl<$Res>
    extends _$MatchingItemCopyWithImpl<$Res, _$MatchingItemImpl>
    implements _$$MatchingItemImplCopyWith<$Res> {
  __$$MatchingItemImplCopyWithImpl(
    _$MatchingItemImpl _value,
    $Res Function(_$MatchingItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? left = null,
    Object? right = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$MatchingItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        left: null == left
            ? _value.left
            : left // ignore: cast_nullable_to_non_nullable
                  as String,
        right: null == right
            ? _value.right
            : right // ignore: cast_nullable_to_non_nullable
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
class _$MatchingItemImpl implements _MatchingItem {
  const _$MatchingItemImpl({
    required this.id,
    required this.left,
    required this.right,
    @JsonKey(name: 'image_url') this.imageUrl,
  });

  factory _$MatchingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingItemImplFromJson(json);

  /// ID del ítem
  @override
  final int id;

  /// Texto del lado izquierdo (ej: palabra en inglés)
  @override
  final String left;

  /// Texto del lado derecho (ej: traducción al español)
  @override
  final String right;

  /// URL de imagen opcional
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'MatchingItem(id: $id, left: $left, right: $right, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.right, right) || other.right == right) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, left, right, imageUrl);

  /// Create a copy of MatchingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingItemImplCopyWith<_$MatchingItemImpl> get copyWith =>
      __$$MatchingItemImplCopyWithImpl<_$MatchingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingItemImplToJson(this);
  }
}

abstract class _MatchingItem implements MatchingItem {
  const factory _MatchingItem({
    required final int id,
    required final String left,
    required final String right,
    @JsonKey(name: 'image_url') final String? imageUrl,
  }) = _$MatchingItemImpl;

  factory _MatchingItem.fromJson(Map<String, dynamic> json) =
      _$MatchingItemImpl.fromJson;

  /// ID del ítem
  @override
  int get id;

  /// Texto del lado izquierdo (ej: palabra en inglés)
  @override
  String get left;

  /// Texto del lado derecho (ej: traducción al español)
  @override
  String get right;

  /// URL de imagen opcional
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of MatchingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingItemImplCopyWith<_$MatchingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchingGameSettings _$MatchingGameSettingsFromJson(Map<String, dynamic> json) {
  return _MatchingGameSettings.fromJson(json);
}

/// @nodoc
mixin _$MatchingGameSettings {
  /// Si se deben mezclar los ítems
  bool get shuffle => throw _privateConstructorUsedError;

  /// Si se deben mostrar imágenes
  @JsonKey(name: 'show_images')
  bool get showImages => throw _privateConstructorUsedError;

  /// Serializes this MatchingGameSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingGameSettingsCopyWith<MatchingGameSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingGameSettingsCopyWith<$Res> {
  factory $MatchingGameSettingsCopyWith(
    MatchingGameSettings value,
    $Res Function(MatchingGameSettings) then,
  ) = _$MatchingGameSettingsCopyWithImpl<$Res, MatchingGameSettings>;
  @useResult
  $Res call({bool shuffle, @JsonKey(name: 'show_images') bool showImages});
}

/// @nodoc
class _$MatchingGameSettingsCopyWithImpl<
  $Res,
  $Val extends MatchingGameSettings
>
    implements $MatchingGameSettingsCopyWith<$Res> {
  _$MatchingGameSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shuffle = null, Object? showImages = null}) {
    return _then(
      _value.copyWith(
            shuffle: null == shuffle
                ? _value.shuffle
                : shuffle // ignore: cast_nullable_to_non_nullable
                      as bool,
            showImages: null == showImages
                ? _value.showImages
                : showImages // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MatchingGameSettingsImplCopyWith<$Res>
    implements $MatchingGameSettingsCopyWith<$Res> {
  factory _$$MatchingGameSettingsImplCopyWith(
    _$MatchingGameSettingsImpl value,
    $Res Function(_$MatchingGameSettingsImpl) then,
  ) = __$$MatchingGameSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool shuffle, @JsonKey(name: 'show_images') bool showImages});
}

/// @nodoc
class __$$MatchingGameSettingsImplCopyWithImpl<$Res>
    extends _$MatchingGameSettingsCopyWithImpl<$Res, _$MatchingGameSettingsImpl>
    implements _$$MatchingGameSettingsImplCopyWith<$Res> {
  __$$MatchingGameSettingsImplCopyWithImpl(
    _$MatchingGameSettingsImpl _value,
    $Res Function(_$MatchingGameSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchingGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shuffle = null, Object? showImages = null}) {
    return _then(
      _$MatchingGameSettingsImpl(
        shuffle: null == shuffle
            ? _value.shuffle
            : shuffle // ignore: cast_nullable_to_non_nullable
                  as bool,
        showImages: null == showImages
            ? _value.showImages
            : showImages // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchingGameSettingsImpl implements _MatchingGameSettings {
  const _$MatchingGameSettingsImpl({
    this.shuffle = true,
    @JsonKey(name: 'show_images') this.showImages = true,
  });

  factory _$MatchingGameSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingGameSettingsImplFromJson(json);

  /// Si se deben mezclar los ítems
  @override
  @JsonKey()
  final bool shuffle;

  /// Si se deben mostrar imágenes
  @override
  @JsonKey(name: 'show_images')
  final bool showImages;

  @override
  String toString() {
    return 'MatchingGameSettings(shuffle: $shuffle, showImages: $showImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingGameSettingsImpl &&
            (identical(other.shuffle, shuffle) || other.shuffle == shuffle) &&
            (identical(other.showImages, showImages) ||
                other.showImages == showImages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shuffle, showImages);

  /// Create a copy of MatchingGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingGameSettingsImplCopyWith<_$MatchingGameSettingsImpl>
  get copyWith =>
      __$$MatchingGameSettingsImplCopyWithImpl<_$MatchingGameSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingGameSettingsImplToJson(this);
  }
}

abstract class _MatchingGameSettings implements MatchingGameSettings {
  const factory _MatchingGameSettings({
    final bool shuffle,
    @JsonKey(name: 'show_images') final bool showImages,
  }) = _$MatchingGameSettingsImpl;

  factory _MatchingGameSettings.fromJson(Map<String, dynamic> json) =
      _$MatchingGameSettingsImpl.fromJson;

  /// Si se deben mezclar los ítems
  @override
  bool get shuffle;

  /// Si se deben mostrar imágenes
  @override
  @JsonKey(name: 'show_images')
  bool get showImages;

  /// Create a copy of MatchingGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingGameSettingsImplCopyWith<_$MatchingGameSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}
