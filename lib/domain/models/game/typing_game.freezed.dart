// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'typing_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TypingGame _$TypingGameFromJson(Map<String, dynamic> json) {
  return _TypingGame.fromJson(json);
}

/// @nodoc
mixin _$TypingGame {
  /// ID único del juego
  @JsonKey(name: 'game_id')
  String get gameId => throw _privateConstructorUsedError;

  /// Tipo de juego (siempre 'typing')
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

  /// Contenido del juego
  TypingGameContent get content => throw _privateConstructorUsedError;

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

  /// Serializes this TypingGame to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypingGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypingGameCopyWith<TypingGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypingGameCopyWith<$Res> {
  factory $TypingGameCopyWith(
    TypingGame value,
    $Res Function(TypingGame) then,
  ) = _$TypingGameCopyWithImpl<$Res, TypingGame>;
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    TypingGameContent content,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
  });

  $TypingGameContentCopyWith<$Res> get content;
}

/// @nodoc
class _$TypingGameCopyWithImpl<$Res, $Val extends TypingGame>
    implements $TypingGameCopyWith<$Res> {
  _$TypingGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypingGame
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
    Object? content = null,
    Object? optional = null,
    Object? unlockedAfterEpisode = null,
    Object? timeLimitSeconds = freezed,
    Object? xpReward = null,
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
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as TypingGameContent,
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
          )
          as $Val,
    );
  }

  /// Create a copy of TypingGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypingGameContentCopyWith<$Res> get content {
    return $TypingGameContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TypingGameImplCopyWith<$Res>
    implements $TypingGameCopyWith<$Res> {
  factory _$$TypingGameImplCopyWith(
    _$TypingGameImpl value,
    $Res Function(_$TypingGameImpl) then,
  ) = __$$TypingGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    TypingGameContent content,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
  });

  @override
  $TypingGameContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$TypingGameImplCopyWithImpl<$Res>
    extends _$TypingGameCopyWithImpl<$Res, _$TypingGameImpl>
    implements _$$TypingGameImplCopyWith<$Res> {
  __$$TypingGameImplCopyWithImpl(
    _$TypingGameImpl _value,
    $Res Function(_$TypingGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypingGame
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
    Object? content = null,
    Object? optional = null,
    Object? unlockedAfterEpisode = null,
    Object? timeLimitSeconds = freezed,
    Object? xpReward = null,
  }) {
    return _then(
      _$TypingGameImpl(
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
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as TypingGameContent,
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TypingGameImpl extends _TypingGame {
  const _$TypingGameImpl({
    @JsonKey(name: 'game_id') required this.gameId,
    @JsonKey(name: 'game_type') required this.gameType,
    required this.title,
    @JsonKey(name: 'title_es') required this.titleEs,
    required this.instructions,
    @JsonKey(name: 'instructions_es') required this.instructionsEs,
    required this.content,
    this.optional = false,
    @JsonKey(name: 'unlocked_after_episode') this.unlockedAfterEpisode = true,
    @JsonKey(name: 'time_limit_seconds') this.timeLimitSeconds,
    @JsonKey(name: 'xp_reward') this.xpReward = 0,
  }) : super._();

  factory _$TypingGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypingGameImplFromJson(json);

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  final String gameId;

  /// Tipo de juego (siempre 'typing')
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

  /// Contenido del juego
  @override
  final TypingGameContent content;

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

  @override
  String toString() {
    return 'TypingGame(gameId: $gameId, gameType: $gameType, title: $title, titleEs: $titleEs, instructions: $instructions, instructionsEs: $instructionsEs, content: $content, optional: $optional, unlockedAfterEpisode: $unlockedAfterEpisode, timeLimitSeconds: $timeLimitSeconds, xpReward: $xpReward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingGameImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleEs, titleEs) || other.titleEs == titleEs) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.instructionsEs, instructionsEs) ||
                other.instructionsEs == instructionsEs) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.optional, optional) ||
                other.optional == optional) &&
            (identical(other.unlockedAfterEpisode, unlockedAfterEpisode) ||
                other.unlockedAfterEpisode == unlockedAfterEpisode) &&
            (identical(other.timeLimitSeconds, timeLimitSeconds) ||
                other.timeLimitSeconds == timeLimitSeconds) &&
            (identical(other.xpReward, xpReward) ||
                other.xpReward == xpReward));
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
    content,
    optional,
    unlockedAfterEpisode,
    timeLimitSeconds,
    xpReward,
  );

  /// Create a copy of TypingGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingGameImplCopyWith<_$TypingGameImpl> get copyWith =>
      __$$TypingGameImplCopyWithImpl<_$TypingGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypingGameImplToJson(this);
  }
}

abstract class _TypingGame extends TypingGame {
  const factory _TypingGame({
    @JsonKey(name: 'game_id') required final String gameId,
    @JsonKey(name: 'game_type') required final String gameType,
    required final String title,
    @JsonKey(name: 'title_es') required final String titleEs,
    required final String instructions,
    @JsonKey(name: 'instructions_es') required final String instructionsEs,
    required final TypingGameContent content,
    final bool optional,
    @JsonKey(name: 'unlocked_after_episode') final bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') final int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') final int xpReward,
  }) = _$TypingGameImpl;
  const _TypingGame._() : super._();

  factory _TypingGame.fromJson(Map<String, dynamic> json) =
      _$TypingGameImpl.fromJson;

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  String get gameId;

  /// Tipo de juego (siempre 'typing')
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

  /// Contenido del juego
  @override
  TypingGameContent get content;

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

  /// Create a copy of TypingGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypingGameImplCopyWith<_$TypingGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypingGameContent _$TypingGameContentFromJson(Map<String, dynamic> json) {
  return _TypingGameContent.fromJson(json);
}

/// @nodoc
mixin _$TypingGameContent {
  /// Lista de ítems del juego
  List<TypingItem> get items => throw _privateConstructorUsedError;

  /// Serializes this TypingGameContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypingGameContentCopyWith<TypingGameContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypingGameContentCopyWith<$Res> {
  factory $TypingGameContentCopyWith(
    TypingGameContent value,
    $Res Function(TypingGameContent) then,
  ) = _$TypingGameContentCopyWithImpl<$Res, TypingGameContent>;
  @useResult
  $Res call({List<TypingItem> items});
}

/// @nodoc
class _$TypingGameContentCopyWithImpl<$Res, $Val extends TypingGameContent>
    implements $TypingGameContentCopyWith<$Res> {
  _$TypingGameContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<TypingItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TypingGameContentImplCopyWith<$Res>
    implements $TypingGameContentCopyWith<$Res> {
  factory _$$TypingGameContentImplCopyWith(
    _$TypingGameContentImpl value,
    $Res Function(_$TypingGameContentImpl) then,
  ) = __$$TypingGameContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TypingItem> items});
}

/// @nodoc
class __$$TypingGameContentImplCopyWithImpl<$Res>
    extends _$TypingGameContentCopyWithImpl<$Res, _$TypingGameContentImpl>
    implements _$$TypingGameContentImplCopyWith<$Res> {
  __$$TypingGameContentImplCopyWithImpl(
    _$TypingGameContentImpl _value,
    $Res Function(_$TypingGameContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$TypingGameContentImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<TypingItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TypingGameContentImpl implements _TypingGameContent {
  const _$TypingGameContentImpl({final List<TypingItem> items = const []})
    : _items = items;

  factory _$TypingGameContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypingGameContentImplFromJson(json);

  /// Lista de ítems del juego
  final List<TypingItem> _items;

  /// Lista de ítems del juego
  @override
  @JsonKey()
  List<TypingItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TypingGameContent(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingGameContentImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of TypingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingGameContentImplCopyWith<_$TypingGameContentImpl> get copyWith =>
      __$$TypingGameContentImplCopyWithImpl<_$TypingGameContentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TypingGameContentImplToJson(this);
  }
}

abstract class _TypingGameContent implements TypingGameContent {
  const factory _TypingGameContent({final List<TypingItem> items}) =
      _$TypingGameContentImpl;

  factory _TypingGameContent.fromJson(Map<String, dynamic> json) =
      _$TypingGameContentImpl.fromJson;

  /// Lista de ítems del juego
  @override
  List<TypingItem> get items;

  /// Create a copy of TypingGameContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypingGameContentImplCopyWith<_$TypingGameContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypingItem _$TypingItemFromJson(Map<String, dynamic> json) {
  return _TypingItem.fromJson(json);
}

/// @nodoc
mixin _$TypingItem {
  /// ID del ítem
  int get id => throw _privateConstructorUsedError;

  /// Texto de la pregunta en español
  @JsonKey(name: 'prompt_es')
  String get promptEs => throw _privateConstructorUsedError;

  /// Respuesta correcta en inglés
  @JsonKey(name: 'answer_en')
  String get answerEn => throw _privateConstructorUsedError;

  /// Pista en inglés (opcional)
  String? get hint => throw _privateConstructorUsedError;

  /// Pista en español (opcional)
  @JsonKey(name: 'hint_es')
  String? get hintEs => throw _privateConstructorUsedError;

  /// Serializes this TypingItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypingItemCopyWith<TypingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypingItemCopyWith<$Res> {
  factory $TypingItemCopyWith(
    TypingItem value,
    $Res Function(TypingItem) then,
  ) = _$TypingItemCopyWithImpl<$Res, TypingItem>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'prompt_es') String promptEs,
    @JsonKey(name: 'answer_en') String answerEn,
    String? hint,
    @JsonKey(name: 'hint_es') String? hintEs,
  });
}

/// @nodoc
class _$TypingItemCopyWithImpl<$Res, $Val extends TypingItem>
    implements $TypingItemCopyWith<$Res> {
  _$TypingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? promptEs = null,
    Object? answerEn = null,
    Object? hint = freezed,
    Object? hintEs = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            promptEs: null == promptEs
                ? _value.promptEs
                : promptEs // ignore: cast_nullable_to_non_nullable
                      as String,
            answerEn: null == answerEn
                ? _value.answerEn
                : answerEn // ignore: cast_nullable_to_non_nullable
                      as String,
            hint: freezed == hint
                ? _value.hint
                : hint // ignore: cast_nullable_to_non_nullable
                      as String?,
            hintEs: freezed == hintEs
                ? _value.hintEs
                : hintEs // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TypingItemImplCopyWith<$Res>
    implements $TypingItemCopyWith<$Res> {
  factory _$$TypingItemImplCopyWith(
    _$TypingItemImpl value,
    $Res Function(_$TypingItemImpl) then,
  ) = __$$TypingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'prompt_es') String promptEs,
    @JsonKey(name: 'answer_en') String answerEn,
    String? hint,
    @JsonKey(name: 'hint_es') String? hintEs,
  });
}

/// @nodoc
class __$$TypingItemImplCopyWithImpl<$Res>
    extends _$TypingItemCopyWithImpl<$Res, _$TypingItemImpl>
    implements _$$TypingItemImplCopyWith<$Res> {
  __$$TypingItemImplCopyWithImpl(
    _$TypingItemImpl _value,
    $Res Function(_$TypingItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? promptEs = null,
    Object? answerEn = null,
    Object? hint = freezed,
    Object? hintEs = freezed,
  }) {
    return _then(
      _$TypingItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        promptEs: null == promptEs
            ? _value.promptEs
            : promptEs // ignore: cast_nullable_to_non_nullable
                  as String,
        answerEn: null == answerEn
            ? _value.answerEn
            : answerEn // ignore: cast_nullable_to_non_nullable
                  as String,
        hint: freezed == hint
            ? _value.hint
            : hint // ignore: cast_nullable_to_non_nullable
                  as String?,
        hintEs: freezed == hintEs
            ? _value.hintEs
            : hintEs // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TypingItemImpl implements _TypingItem {
  const _$TypingItemImpl({
    required this.id,
    @JsonKey(name: 'prompt_es') required this.promptEs,
    @JsonKey(name: 'answer_en') required this.answerEn,
    this.hint,
    @JsonKey(name: 'hint_es') this.hintEs,
  });

  factory _$TypingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypingItemImplFromJson(json);

  /// ID del ítem
  @override
  final int id;

  /// Texto de la pregunta en español
  @override
  @JsonKey(name: 'prompt_es')
  final String promptEs;

  /// Respuesta correcta en inglés
  @override
  @JsonKey(name: 'answer_en')
  final String answerEn;

  /// Pista en inglés (opcional)
  @override
  final String? hint;

  /// Pista en español (opcional)
  @override
  @JsonKey(name: 'hint_es')
  final String? hintEs;

  @override
  String toString() {
    return 'TypingItem(id: $id, promptEs: $promptEs, answerEn: $answerEn, hint: $hint, hintEs: $hintEs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.promptEs, promptEs) ||
                other.promptEs == promptEs) &&
            (identical(other.answerEn, answerEn) ||
                other.answerEn == answerEn) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.hintEs, hintEs) || other.hintEs == hintEs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, promptEs, answerEn, hint, hintEs);

  /// Create a copy of TypingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingItemImplCopyWith<_$TypingItemImpl> get copyWith =>
      __$$TypingItemImplCopyWithImpl<_$TypingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypingItemImplToJson(this);
  }
}

abstract class _TypingItem implements TypingItem {
  const factory _TypingItem({
    required final int id,
    @JsonKey(name: 'prompt_es') required final String promptEs,
    @JsonKey(name: 'answer_en') required final String answerEn,
    final String? hint,
    @JsonKey(name: 'hint_es') final String? hintEs,
  }) = _$TypingItemImpl;

  factory _TypingItem.fromJson(Map<String, dynamic> json) =
      _$TypingItemImpl.fromJson;

  /// ID del ítem
  @override
  int get id;

  /// Texto de la pregunta en español
  @override
  @JsonKey(name: 'prompt_es')
  String get promptEs;

  /// Respuesta correcta en inglés
  @override
  @JsonKey(name: 'answer_en')
  String get answerEn;

  /// Pista en inglés (opcional)
  @override
  String? get hint;

  /// Pista en español (opcional)
  @override
  @JsonKey(name: 'hint_es')
  String? get hintEs;

  /// Create a copy of TypingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypingItemImplCopyWith<_$TypingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
