// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_sentence_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderSentenceGame _$OrderSentenceGameFromJson(Map<String, dynamic> json) {
  return _OrderSentenceGame.fromJson(json);
}

/// @nodoc
mixin _$OrderSentenceGame {
  /// ID único del juego
  @JsonKey(name: 'game_id')
  String get gameId => throw _privateConstructorUsedError;

  /// Tipo de juego (siempre 'order_sentence')
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
  OrderSentenceContent get content => throw _privateConstructorUsedError;

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

  /// Serializes this OrderSentenceGame to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderSentenceGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderSentenceGameCopyWith<OrderSentenceGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSentenceGameCopyWith<$Res> {
  factory $OrderSentenceGameCopyWith(
    OrderSentenceGame value,
    $Res Function(OrderSentenceGame) then,
  ) = _$OrderSentenceGameCopyWithImpl<$Res, OrderSentenceGame>;
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    OrderSentenceContent content,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
  });

  $OrderSentenceContentCopyWith<$Res> get content;
}

/// @nodoc
class _$OrderSentenceGameCopyWithImpl<$Res, $Val extends OrderSentenceGame>
    implements $OrderSentenceGameCopyWith<$Res> {
  _$OrderSentenceGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderSentenceGame
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
                      as OrderSentenceContent,
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

  /// Create a copy of OrderSentenceGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderSentenceContentCopyWith<$Res> get content {
    return $OrderSentenceContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderSentenceGameImplCopyWith<$Res>
    implements $OrderSentenceGameCopyWith<$Res> {
  factory _$$OrderSentenceGameImplCopyWith(
    _$OrderSentenceGameImpl value,
    $Res Function(_$OrderSentenceGameImpl) then,
  ) = __$$OrderSentenceGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    OrderSentenceContent content,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
  });

  @override
  $OrderSentenceContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$OrderSentenceGameImplCopyWithImpl<$Res>
    extends _$OrderSentenceGameCopyWithImpl<$Res, _$OrderSentenceGameImpl>
    implements _$$OrderSentenceGameImplCopyWith<$Res> {
  __$$OrderSentenceGameImplCopyWithImpl(
    _$OrderSentenceGameImpl _value,
    $Res Function(_$OrderSentenceGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderSentenceGame
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
      _$OrderSentenceGameImpl(
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
                  as OrderSentenceContent,
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
class _$OrderSentenceGameImpl extends _OrderSentenceGame {
  const _$OrderSentenceGameImpl({
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

  factory _$OrderSentenceGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSentenceGameImplFromJson(json);

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  final String gameId;

  /// Tipo de juego (siempre 'order_sentence')
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
  final OrderSentenceContent content;

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
    return 'OrderSentenceGame(gameId: $gameId, gameType: $gameType, title: $title, titleEs: $titleEs, instructions: $instructions, instructionsEs: $instructionsEs, content: $content, optional: $optional, unlockedAfterEpisode: $unlockedAfterEpisode, timeLimitSeconds: $timeLimitSeconds, xpReward: $xpReward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSentenceGameImpl &&
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

  /// Create a copy of OrderSentenceGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSentenceGameImplCopyWith<_$OrderSentenceGameImpl> get copyWith =>
      __$$OrderSentenceGameImplCopyWithImpl<_$OrderSentenceGameImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderSentenceGameImplToJson(this);
  }
}

abstract class _OrderSentenceGame extends OrderSentenceGame {
  const factory _OrderSentenceGame({
    @JsonKey(name: 'game_id') required final String gameId,
    @JsonKey(name: 'game_type') required final String gameType,
    required final String title,
    @JsonKey(name: 'title_es') required final String titleEs,
    required final String instructions,
    @JsonKey(name: 'instructions_es') required final String instructionsEs,
    required final OrderSentenceContent content,
    final bool optional,
    @JsonKey(name: 'unlocked_after_episode') final bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') final int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') final int xpReward,
  }) = _$OrderSentenceGameImpl;
  const _OrderSentenceGame._() : super._();

  factory _OrderSentenceGame.fromJson(Map<String, dynamic> json) =
      _$OrderSentenceGameImpl.fromJson;

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  String get gameId;

  /// Tipo de juego (siempre 'order_sentence')
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
  OrderSentenceContent get content;

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

  /// Create a copy of OrderSentenceGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderSentenceGameImplCopyWith<_$OrderSentenceGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderSentenceContent _$OrderSentenceContentFromJson(Map<String, dynamic> json) {
  return _OrderSentenceContent.fromJson(json);
}

/// @nodoc
mixin _$OrderSentenceContent {
  /// Lista de ítems de oraciones a ordenar
  List<OrderSentenceItem> get items => throw _privateConstructorUsedError;

  /// Serializes this OrderSentenceContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderSentenceContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderSentenceContentCopyWith<OrderSentenceContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSentenceContentCopyWith<$Res> {
  factory $OrderSentenceContentCopyWith(
    OrderSentenceContent value,
    $Res Function(OrderSentenceContent) then,
  ) = _$OrderSentenceContentCopyWithImpl<$Res, OrderSentenceContent>;
  @useResult
  $Res call({List<OrderSentenceItem> items});
}

/// @nodoc
class _$OrderSentenceContentCopyWithImpl<
  $Res,
  $Val extends OrderSentenceContent
>
    implements $OrderSentenceContentCopyWith<$Res> {
  _$OrderSentenceContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderSentenceContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderSentenceItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderSentenceContentImplCopyWith<$Res>
    implements $OrderSentenceContentCopyWith<$Res> {
  factory _$$OrderSentenceContentImplCopyWith(
    _$OrderSentenceContentImpl value,
    $Res Function(_$OrderSentenceContentImpl) then,
  ) = __$$OrderSentenceContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OrderSentenceItem> items});
}

/// @nodoc
class __$$OrderSentenceContentImplCopyWithImpl<$Res>
    extends _$OrderSentenceContentCopyWithImpl<$Res, _$OrderSentenceContentImpl>
    implements _$$OrderSentenceContentImplCopyWith<$Res> {
  __$$OrderSentenceContentImplCopyWithImpl(
    _$OrderSentenceContentImpl _value,
    $Res Function(_$OrderSentenceContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderSentenceContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$OrderSentenceContentImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderSentenceItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderSentenceContentImpl implements _OrderSentenceContent {
  const _$OrderSentenceContentImpl({
    final List<OrderSentenceItem> items = const [],
  }) : _items = items;

  factory _$OrderSentenceContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSentenceContentImplFromJson(json);

  /// Lista de ítems de oraciones a ordenar
  final List<OrderSentenceItem> _items;

  /// Lista de ítems de oraciones a ordenar
  @override
  @JsonKey()
  List<OrderSentenceItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'OrderSentenceContent(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSentenceContentImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of OrderSentenceContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSentenceContentImplCopyWith<_$OrderSentenceContentImpl>
  get copyWith =>
      __$$OrderSentenceContentImplCopyWithImpl<_$OrderSentenceContentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderSentenceContentImplToJson(this);
  }
}

abstract class _OrderSentenceContent implements OrderSentenceContent {
  const factory _OrderSentenceContent({final List<OrderSentenceItem> items}) =
      _$OrderSentenceContentImpl;

  factory _OrderSentenceContent.fromJson(Map<String, dynamic> json) =
      _$OrderSentenceContentImpl.fromJson;

  /// Lista de ítems de oraciones a ordenar
  @override
  List<OrderSentenceItem> get items;

  /// Create a copy of OrderSentenceContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderSentenceContentImplCopyWith<_$OrderSentenceContentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

OrderSentenceItem _$OrderSentenceItemFromJson(Map<String, dynamic> json) {
  return _OrderSentenceItem.fromJson(json);
}

/// @nodoc
mixin _$OrderSentenceItem {
  /// ID del ítem
  int get id => throw _privateConstructorUsedError;

  /// Oración correcta completa
  @JsonKey(name: 'correct_sentence')
  String get correctSentence => throw _privateConstructorUsedError;

  /// Texto de la pregunta en inglés
  String? get prompt => throw _privateConstructorUsedError;

  /// Texto de la pregunta en español
  @JsonKey(name: 'prompt_es')
  String? get promptEs => throw _privateConstructorUsedError;

  /// Lista de palabras desordenadas
  @JsonKey(name: 'words')
  List<String> get words => throw _privateConstructorUsedError;

  /// Serializes this OrderSentenceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderSentenceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderSentenceItemCopyWith<OrderSentenceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSentenceItemCopyWith<$Res> {
  factory $OrderSentenceItemCopyWith(
    OrderSentenceItem value,
    $Res Function(OrderSentenceItem) then,
  ) = _$OrderSentenceItemCopyWithImpl<$Res, OrderSentenceItem>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'correct_sentence') String correctSentence,
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    @JsonKey(name: 'words') List<String> words,
  });
}

/// @nodoc
class _$OrderSentenceItemCopyWithImpl<$Res, $Val extends OrderSentenceItem>
    implements $OrderSentenceItemCopyWith<$Res> {
  _$OrderSentenceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderSentenceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? correctSentence = null,
    Object? prompt = freezed,
    Object? promptEs = freezed,
    Object? words = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            correctSentence: null == correctSentence
                ? _value.correctSentence
                : correctSentence // ignore: cast_nullable_to_non_nullable
                      as String,
            prompt: freezed == prompt
                ? _value.prompt
                : prompt // ignore: cast_nullable_to_non_nullable
                      as String?,
            promptEs: freezed == promptEs
                ? _value.promptEs
                : promptEs // ignore: cast_nullable_to_non_nullable
                      as String?,
            words: null == words
                ? _value.words
                : words // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderSentenceItemImplCopyWith<$Res>
    implements $OrderSentenceItemCopyWith<$Res> {
  factory _$$OrderSentenceItemImplCopyWith(
    _$OrderSentenceItemImpl value,
    $Res Function(_$OrderSentenceItemImpl) then,
  ) = __$$OrderSentenceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'correct_sentence') String correctSentence,
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    @JsonKey(name: 'words') List<String> words,
  });
}

/// @nodoc
class __$$OrderSentenceItemImplCopyWithImpl<$Res>
    extends _$OrderSentenceItemCopyWithImpl<$Res, _$OrderSentenceItemImpl>
    implements _$$OrderSentenceItemImplCopyWith<$Res> {
  __$$OrderSentenceItemImplCopyWithImpl(
    _$OrderSentenceItemImpl _value,
    $Res Function(_$OrderSentenceItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderSentenceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? correctSentence = null,
    Object? prompt = freezed,
    Object? promptEs = freezed,
    Object? words = null,
  }) {
    return _then(
      _$OrderSentenceItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        correctSentence: null == correctSentence
            ? _value.correctSentence
            : correctSentence // ignore: cast_nullable_to_non_nullable
                  as String,
        prompt: freezed == prompt
            ? _value.prompt
            : prompt // ignore: cast_nullable_to_non_nullable
                  as String?,
        promptEs: freezed == promptEs
            ? _value.promptEs
            : promptEs // ignore: cast_nullable_to_non_nullable
                  as String?,
        words: null == words
            ? _value._words
            : words // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderSentenceItemImpl implements _OrderSentenceItem {
  const _$OrderSentenceItemImpl({
    required this.id,
    @JsonKey(name: 'correct_sentence') required this.correctSentence,
    this.prompt,
    @JsonKey(name: 'prompt_es') this.promptEs,
    @JsonKey(name: 'words') final List<String> words = const [],
  }) : _words = words;

  factory _$OrderSentenceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSentenceItemImplFromJson(json);

  /// ID del ítem
  @override
  final int id;

  /// Oración correcta completa
  @override
  @JsonKey(name: 'correct_sentence')
  final String correctSentence;

  /// Texto de la pregunta en inglés
  @override
  final String? prompt;

  /// Texto de la pregunta en español
  @override
  @JsonKey(name: 'prompt_es')
  final String? promptEs;

  /// Lista de palabras desordenadas
  final List<String> _words;

  /// Lista de palabras desordenadas
  @override
  @JsonKey(name: 'words')
  List<String> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'OrderSentenceItem(id: $id, correctSentence: $correctSentence, prompt: $prompt, promptEs: $promptEs, words: $words)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSentenceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.correctSentence, correctSentence) ||
                other.correctSentence == correctSentence) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.promptEs, promptEs) ||
                other.promptEs == promptEs) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    correctSentence,
    prompt,
    promptEs,
    const DeepCollectionEquality().hash(_words),
  );

  /// Create a copy of OrderSentenceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSentenceItemImplCopyWith<_$OrderSentenceItemImpl> get copyWith =>
      __$$OrderSentenceItemImplCopyWithImpl<_$OrderSentenceItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderSentenceItemImplToJson(this);
  }
}

abstract class _OrderSentenceItem implements OrderSentenceItem {
  const factory _OrderSentenceItem({
    required final int id,
    @JsonKey(name: 'correct_sentence') required final String correctSentence,
    final String? prompt,
    @JsonKey(name: 'prompt_es') final String? promptEs,
    @JsonKey(name: 'words') final List<String> words,
  }) = _$OrderSentenceItemImpl;

  factory _OrderSentenceItem.fromJson(Map<String, dynamic> json) =
      _$OrderSentenceItemImpl.fromJson;

  /// ID del ítem
  @override
  int get id;

  /// Oración correcta completa
  @override
  @JsonKey(name: 'correct_sentence')
  String get correctSentence;

  /// Texto de la pregunta en inglés
  @override
  String? get prompt;

  /// Texto de la pregunta en español
  @override
  @JsonKey(name: 'prompt_es')
  String? get promptEs;

  /// Lista de palabras desordenadas
  @override
  @JsonKey(name: 'words')
  List<String> get words;

  /// Create a copy of OrderSentenceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderSentenceItemImplCopyWith<_$OrderSentenceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
