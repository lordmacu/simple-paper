// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot_word_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SpotWordGame _$SpotWordGameFromJson(Map<String, dynamic> json) {
  return _SpotWordGame.fromJson(json);
}

/// @nodoc
mixin _$SpotWordGame {
  /// ID único del juego
  @JsonKey(name: 'game_id')
  String get gameId => throw _privateConstructorUsedError;

  /// Tipo de juego (siempre 'spot_word')
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
  SpotWordContent get content => throw _privateConstructorUsedError;

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

  /// Serializes this SpotWordGame to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpotWordGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpotWordGameCopyWith<SpotWordGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotWordGameCopyWith<$Res> {
  factory $SpotWordGameCopyWith(
    SpotWordGame value,
    $Res Function(SpotWordGame) then,
  ) = _$SpotWordGameCopyWithImpl<$Res, SpotWordGame>;
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    SpotWordContent content,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
  });

  $SpotWordContentCopyWith<$Res> get content;
}

/// @nodoc
class _$SpotWordGameCopyWithImpl<$Res, $Val extends SpotWordGame>
    implements $SpotWordGameCopyWith<$Res> {
  _$SpotWordGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpotWordGame
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
                      as SpotWordContent,
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

  /// Create a copy of SpotWordGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotWordContentCopyWith<$Res> get content {
    return $SpotWordContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpotWordGameImplCopyWith<$Res>
    implements $SpotWordGameCopyWith<$Res> {
  factory _$$SpotWordGameImplCopyWith(
    _$SpotWordGameImpl value,
    $Res Function(_$SpotWordGameImpl) then,
  ) = __$$SpotWordGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    SpotWordContent content,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
  });

  @override
  $SpotWordContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$SpotWordGameImplCopyWithImpl<$Res>
    extends _$SpotWordGameCopyWithImpl<$Res, _$SpotWordGameImpl>
    implements _$$SpotWordGameImplCopyWith<$Res> {
  __$$SpotWordGameImplCopyWithImpl(
    _$SpotWordGameImpl _value,
    $Res Function(_$SpotWordGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpotWordGame
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
      _$SpotWordGameImpl(
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
                  as SpotWordContent,
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
class _$SpotWordGameImpl extends _SpotWordGame {
  const _$SpotWordGameImpl({
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

  factory _$SpotWordGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpotWordGameImplFromJson(json);

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  final String gameId;

  /// Tipo de juego (siempre 'spot_word')
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
  final SpotWordContent content;

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
    return 'SpotWordGame(gameId: $gameId, gameType: $gameType, title: $title, titleEs: $titleEs, instructions: $instructions, instructionsEs: $instructionsEs, content: $content, optional: $optional, unlockedAfterEpisode: $unlockedAfterEpisode, timeLimitSeconds: $timeLimitSeconds, xpReward: $xpReward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotWordGameImpl &&
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

  /// Create a copy of SpotWordGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotWordGameImplCopyWith<_$SpotWordGameImpl> get copyWith =>
      __$$SpotWordGameImplCopyWithImpl<_$SpotWordGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotWordGameImplToJson(this);
  }
}

abstract class _SpotWordGame extends SpotWordGame {
  const factory _SpotWordGame({
    @JsonKey(name: 'game_id') required final String gameId,
    @JsonKey(name: 'game_type') required final String gameType,
    required final String title,
    @JsonKey(name: 'title_es') required final String titleEs,
    required final String instructions,
    @JsonKey(name: 'instructions_es') required final String instructionsEs,
    required final SpotWordContent content,
    final bool optional,
    @JsonKey(name: 'unlocked_after_episode') final bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') final int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') final int xpReward,
  }) = _$SpotWordGameImpl;
  const _SpotWordGame._() : super._();

  factory _SpotWordGame.fromJson(Map<String, dynamic> json) =
      _$SpotWordGameImpl.fromJson;

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  String get gameId;

  /// Tipo de juego (siempre 'spot_word')
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
  SpotWordContent get content;

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

  /// Create a copy of SpotWordGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpotWordGameImplCopyWith<_$SpotWordGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpotWordContent _$SpotWordContentFromJson(Map<String, dynamic> json) {
  return _SpotWordContent.fromJson(json);
}

/// @nodoc
mixin _$SpotWordContent {
  /// Lista de ítems del juego
  List<SpotWordItem> get items => throw _privateConstructorUsedError;

  /// Serializes this SpotWordContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpotWordContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpotWordContentCopyWith<SpotWordContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotWordContentCopyWith<$Res> {
  factory $SpotWordContentCopyWith(
    SpotWordContent value,
    $Res Function(SpotWordContent) then,
  ) = _$SpotWordContentCopyWithImpl<$Res, SpotWordContent>;
  @useResult
  $Res call({List<SpotWordItem> items});
}

/// @nodoc
class _$SpotWordContentCopyWithImpl<$Res, $Val extends SpotWordContent>
    implements $SpotWordContentCopyWith<$Res> {
  _$SpotWordContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpotWordContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<SpotWordItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpotWordContentImplCopyWith<$Res>
    implements $SpotWordContentCopyWith<$Res> {
  factory _$$SpotWordContentImplCopyWith(
    _$SpotWordContentImpl value,
    $Res Function(_$SpotWordContentImpl) then,
  ) = __$$SpotWordContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SpotWordItem> items});
}

/// @nodoc
class __$$SpotWordContentImplCopyWithImpl<$Res>
    extends _$SpotWordContentCopyWithImpl<$Res, _$SpotWordContentImpl>
    implements _$$SpotWordContentImplCopyWith<$Res> {
  __$$SpotWordContentImplCopyWithImpl(
    _$SpotWordContentImpl _value,
    $Res Function(_$SpotWordContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpotWordContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$SpotWordContentImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<SpotWordItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpotWordContentImpl implements _SpotWordContent {
  const _$SpotWordContentImpl({final List<SpotWordItem> items = const []})
    : _items = items;

  factory _$SpotWordContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpotWordContentImplFromJson(json);

  /// Lista de ítems del juego
  final List<SpotWordItem> _items;

  /// Lista de ítems del juego
  @override
  @JsonKey()
  List<SpotWordItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SpotWordContent(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotWordContentImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of SpotWordContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotWordContentImplCopyWith<_$SpotWordContentImpl> get copyWith =>
      __$$SpotWordContentImplCopyWithImpl<_$SpotWordContentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotWordContentImplToJson(this);
  }
}

abstract class _SpotWordContent implements SpotWordContent {
  const factory _SpotWordContent({final List<SpotWordItem> items}) =
      _$SpotWordContentImpl;

  factory _SpotWordContent.fromJson(Map<String, dynamic> json) =
      _$SpotWordContentImpl.fromJson;

  /// Lista de ítems del juego
  @override
  List<SpotWordItem> get items;

  /// Create a copy of SpotWordContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpotWordContentImplCopyWith<_$SpotWordContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpotWordItem _$SpotWordItemFromJson(Map<String, dynamic> json) {
  return _SpotWordItem.fromJson(json);
}

/// @nodoc
mixin _$SpotWordItem {
  /// ID del ítem
  int get id => throw _privateConstructorUsedError;

  /// Índice de la respuesta correcta (0-based)
  @JsonKey(name: 'correct_answer')
  int get correctAnswer => throw _privateConstructorUsedError;

  /// URL de la imagen (opcional)
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Texto de la pregunta en inglés
  String? get prompt => throw _privateConstructorUsedError;

  /// Texto de la pregunta en español
  @JsonKey(name: 'prompt_es')
  String? get promptEs => throw _privateConstructorUsedError;

  /// Opciones de respuesta en inglés
  List<String> get options => throw _privateConstructorUsedError;

  /// Opciones de respuesta en español
  @JsonKey(name: 'options_es')
  List<String> get optionsEs => throw _privateConstructorUsedError;

  /// Serializes this SpotWordItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpotWordItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpotWordItemCopyWith<SpotWordItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotWordItemCopyWith<$Res> {
  factory $SpotWordItemCopyWith(
    SpotWordItem value,
    $Res Function(SpotWordItem) then,
  ) = _$SpotWordItemCopyWithImpl<$Res, SpotWordItem>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'correct_answer') int correctAnswer,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    List<String> options,
    @JsonKey(name: 'options_es') List<String> optionsEs,
  });
}

/// @nodoc
class _$SpotWordItemCopyWithImpl<$Res, $Val extends SpotWordItem>
    implements $SpotWordItemCopyWith<$Res> {
  _$SpotWordItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpotWordItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? correctAnswer = null,
    Object? imageUrl = freezed,
    Object? prompt = freezed,
    Object? promptEs = freezed,
    Object? options = null,
    Object? optionsEs = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            correctAnswer: null == correctAnswer
                ? _value.correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                      as int,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            prompt: freezed == prompt
                ? _value.prompt
                : prompt // ignore: cast_nullable_to_non_nullable
                      as String?,
            promptEs: freezed == promptEs
                ? _value.promptEs
                : promptEs // ignore: cast_nullable_to_non_nullable
                      as String?,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            optionsEs: null == optionsEs
                ? _value.optionsEs
                : optionsEs // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpotWordItemImplCopyWith<$Res>
    implements $SpotWordItemCopyWith<$Res> {
  factory _$$SpotWordItemImplCopyWith(
    _$SpotWordItemImpl value,
    $Res Function(_$SpotWordItemImpl) then,
  ) = __$$SpotWordItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'correct_answer') int correctAnswer,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    List<String> options,
    @JsonKey(name: 'options_es') List<String> optionsEs,
  });
}

/// @nodoc
class __$$SpotWordItemImplCopyWithImpl<$Res>
    extends _$SpotWordItemCopyWithImpl<$Res, _$SpotWordItemImpl>
    implements _$$SpotWordItemImplCopyWith<$Res> {
  __$$SpotWordItemImplCopyWithImpl(
    _$SpotWordItemImpl _value,
    $Res Function(_$SpotWordItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpotWordItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? correctAnswer = null,
    Object? imageUrl = freezed,
    Object? prompt = freezed,
    Object? promptEs = freezed,
    Object? options = null,
    Object? optionsEs = null,
  }) {
    return _then(
      _$SpotWordItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        correctAnswer: null == correctAnswer
            ? _value.correctAnswer
            : correctAnswer // ignore: cast_nullable_to_non_nullable
                  as int,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        prompt: freezed == prompt
            ? _value.prompt
            : prompt // ignore: cast_nullable_to_non_nullable
                  as String?,
        promptEs: freezed == promptEs
            ? _value.promptEs
            : promptEs // ignore: cast_nullable_to_non_nullable
                  as String?,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        optionsEs: null == optionsEs
            ? _value._optionsEs
            : optionsEs // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpotWordItemImpl implements _SpotWordItem {
  const _$SpotWordItemImpl({
    required this.id,
    @JsonKey(name: 'correct_answer') required this.correctAnswer,
    @JsonKey(name: 'image_url') this.imageUrl,
    this.prompt,
    @JsonKey(name: 'prompt_es') this.promptEs,
    final List<String> options = const [],
    @JsonKey(name: 'options_es') final List<String> optionsEs = const [],
  }) : _options = options,
       _optionsEs = optionsEs;

  factory _$SpotWordItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpotWordItemImplFromJson(json);

  /// ID del ítem
  @override
  final int id;

  /// Índice de la respuesta correcta (0-based)
  @override
  @JsonKey(name: 'correct_answer')
  final int correctAnswer;

  /// URL de la imagen (opcional)
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  /// Texto de la pregunta en inglés
  @override
  final String? prompt;

  /// Texto de la pregunta en español
  @override
  @JsonKey(name: 'prompt_es')
  final String? promptEs;

  /// Opciones de respuesta en inglés
  final List<String> _options;

  /// Opciones de respuesta en inglés
  @override
  @JsonKey()
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Opciones de respuesta en español
  final List<String> _optionsEs;

  /// Opciones de respuesta en español
  @override
  @JsonKey(name: 'options_es')
  List<String> get optionsEs {
    if (_optionsEs is EqualUnmodifiableListView) return _optionsEs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionsEs);
  }

  @override
  String toString() {
    return 'SpotWordItem(id: $id, correctAnswer: $correctAnswer, imageUrl: $imageUrl, prompt: $prompt, promptEs: $promptEs, options: $options, optionsEs: $optionsEs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotWordItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.promptEs, promptEs) ||
                other.promptEs == promptEs) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality().equals(
              other._optionsEs,
              _optionsEs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    correctAnswer,
    imageUrl,
    prompt,
    promptEs,
    const DeepCollectionEquality().hash(_options),
    const DeepCollectionEquality().hash(_optionsEs),
  );

  /// Create a copy of SpotWordItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotWordItemImplCopyWith<_$SpotWordItemImpl> get copyWith =>
      __$$SpotWordItemImplCopyWithImpl<_$SpotWordItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotWordItemImplToJson(this);
  }
}

abstract class _SpotWordItem implements SpotWordItem {
  const factory _SpotWordItem({
    required final int id,
    @JsonKey(name: 'correct_answer') required final int correctAnswer,
    @JsonKey(name: 'image_url') final String? imageUrl,
    final String? prompt,
    @JsonKey(name: 'prompt_es') final String? promptEs,
    final List<String> options,
    @JsonKey(name: 'options_es') final List<String> optionsEs,
  }) = _$SpotWordItemImpl;

  factory _SpotWordItem.fromJson(Map<String, dynamic> json) =
      _$SpotWordItemImpl.fromJson;

  /// ID del ítem
  @override
  int get id;

  /// Índice de la respuesta correcta (0-based)
  @override
  @JsonKey(name: 'correct_answer')
  int get correctAnswer;

  /// URL de la imagen (opcional)
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Texto de la pregunta en inglés
  @override
  String? get prompt;

  /// Texto de la pregunta en español
  @override
  @JsonKey(name: 'prompt_es')
  String? get promptEs;

  /// Opciones de respuesta en inglés
  @override
  List<String> get options;

  /// Opciones de respuesta en español
  @override
  @JsonKey(name: 'options_es')
  List<String> get optionsEs;

  /// Create a copy of SpotWordItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpotWordItemImplCopyWith<_$SpotWordItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
