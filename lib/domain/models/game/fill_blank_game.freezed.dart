// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fill_blank_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FillBlankGame _$FillBlankGameFromJson(Map<String, dynamic> json) {
  return _FillBlankGame.fromJson(json);
}

/// @nodoc
mixin _$FillBlankGame {
  /// ID único del juego
  @JsonKey(name: 'game_id')
  String get gameId => throw _privateConstructorUsedError;

  /// Tipo de juego (siempre 'fill_blank')
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
  FillBlankGameContent get content => throw _privateConstructorUsedError;

  /// Serializes this FillBlankGame to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FillBlankGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FillBlankGameCopyWith<FillBlankGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FillBlankGameCopyWith<$Res> {
  factory $FillBlankGameCopyWith(
    FillBlankGame value,
    $Res Function(FillBlankGame) then,
  ) = _$FillBlankGameCopyWithImpl<$Res, FillBlankGame>;
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
    FillBlankGameContent content,
  });

  $FillBlankGameContentCopyWith<$Res> get content;
}

/// @nodoc
class _$FillBlankGameCopyWithImpl<$Res, $Val extends FillBlankGame>
    implements $FillBlankGameCopyWith<$Res> {
  _$FillBlankGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FillBlankGame
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
                      as FillBlankGameContent,
          )
          as $Val,
    );
  }

  /// Create a copy of FillBlankGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FillBlankGameContentCopyWith<$Res> get content {
    return $FillBlankGameContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FillBlankGameImplCopyWith<$Res>
    implements $FillBlankGameCopyWith<$Res> {
  factory _$$FillBlankGameImplCopyWith(
    _$FillBlankGameImpl value,
    $Res Function(_$FillBlankGameImpl) then,
  ) = __$$FillBlankGameImplCopyWithImpl<$Res>;
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
    FillBlankGameContent content,
  });

  @override
  $FillBlankGameContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$FillBlankGameImplCopyWithImpl<$Res>
    extends _$FillBlankGameCopyWithImpl<$Res, _$FillBlankGameImpl>
    implements _$$FillBlankGameImplCopyWith<$Res> {
  __$$FillBlankGameImplCopyWithImpl(
    _$FillBlankGameImpl _value,
    $Res Function(_$FillBlankGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FillBlankGame
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
  }) {
    return _then(
      _$FillBlankGameImpl(
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
                  as FillBlankGameContent,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FillBlankGameImpl extends _FillBlankGame {
  const _$FillBlankGameImpl({
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
  }) : super._();

  factory _$FillBlankGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$FillBlankGameImplFromJson(json);

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  final String gameId;

  /// Tipo de juego (siempre 'fill_blank')
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
  final FillBlankGameContent content;

  @override
  String toString() {
    return 'FillBlankGame(gameId: $gameId, gameType: $gameType, title: $title, titleEs: $titleEs, instructions: $instructions, instructionsEs: $instructionsEs, optional: $optional, unlockedAfterEpisode: $unlockedAfterEpisode, timeLimitSeconds: $timeLimitSeconds, xpReward: $xpReward, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FillBlankGameImpl &&
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
            (identical(other.content, content) || other.content == content));
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
  );

  /// Create a copy of FillBlankGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FillBlankGameImplCopyWith<_$FillBlankGameImpl> get copyWith =>
      __$$FillBlankGameImplCopyWithImpl<_$FillBlankGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FillBlankGameImplToJson(this);
  }
}

abstract class _FillBlankGame extends FillBlankGame {
  const factory _FillBlankGame({
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
    required final FillBlankGameContent content,
  }) = _$FillBlankGameImpl;
  const _FillBlankGame._() : super._();

  factory _FillBlankGame.fromJson(Map<String, dynamic> json) =
      _$FillBlankGameImpl.fromJson;

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  String get gameId;

  /// Tipo de juego (siempre 'fill_blank')
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
  FillBlankGameContent get content;

  /// Create a copy of FillBlankGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FillBlankGameImplCopyWith<_$FillBlankGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FillBlankGameContent _$FillBlankGameContentFromJson(Map<String, dynamic> json) {
  return _FillBlankGameContent.fromJson(json);
}

/// @nodoc
mixin _$FillBlankGameContent {
  /// Lista de oraciones con espacios en blanco
  List<FillBlankItem> get items => throw _privateConstructorUsedError;

  /// Serializes this FillBlankGameContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FillBlankGameContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FillBlankGameContentCopyWith<FillBlankGameContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FillBlankGameContentCopyWith<$Res> {
  factory $FillBlankGameContentCopyWith(
    FillBlankGameContent value,
    $Res Function(FillBlankGameContent) then,
  ) = _$FillBlankGameContentCopyWithImpl<$Res, FillBlankGameContent>;
  @useResult
  $Res call({List<FillBlankItem> items});
}

/// @nodoc
class _$FillBlankGameContentCopyWithImpl<
  $Res,
  $Val extends FillBlankGameContent
>
    implements $FillBlankGameContentCopyWith<$Res> {
  _$FillBlankGameContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FillBlankGameContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<FillBlankItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FillBlankGameContentImplCopyWith<$Res>
    implements $FillBlankGameContentCopyWith<$Res> {
  factory _$$FillBlankGameContentImplCopyWith(
    _$FillBlankGameContentImpl value,
    $Res Function(_$FillBlankGameContentImpl) then,
  ) = __$$FillBlankGameContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FillBlankItem> items});
}

/// @nodoc
class __$$FillBlankGameContentImplCopyWithImpl<$Res>
    extends _$FillBlankGameContentCopyWithImpl<$Res, _$FillBlankGameContentImpl>
    implements _$$FillBlankGameContentImplCopyWith<$Res> {
  __$$FillBlankGameContentImplCopyWithImpl(
    _$FillBlankGameContentImpl _value,
    $Res Function(_$FillBlankGameContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FillBlankGameContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$FillBlankGameContentImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<FillBlankItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FillBlankGameContentImpl implements _FillBlankGameContent {
  const _$FillBlankGameContentImpl({final List<FillBlankItem> items = const []})
    : _items = items;

  factory _$FillBlankGameContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$FillBlankGameContentImplFromJson(json);

  /// Lista de oraciones con espacios en blanco
  final List<FillBlankItem> _items;

  /// Lista de oraciones con espacios en blanco
  @override
  @JsonKey()
  List<FillBlankItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'FillBlankGameContent(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FillBlankGameContentImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of FillBlankGameContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FillBlankGameContentImplCopyWith<_$FillBlankGameContentImpl>
  get copyWith =>
      __$$FillBlankGameContentImplCopyWithImpl<_$FillBlankGameContentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FillBlankGameContentImplToJson(this);
  }
}

abstract class _FillBlankGameContent implements FillBlankGameContent {
  const factory _FillBlankGameContent({final List<FillBlankItem> items}) =
      _$FillBlankGameContentImpl;

  factory _FillBlankGameContent.fromJson(Map<String, dynamic> json) =
      _$FillBlankGameContentImpl.fromJson;

  /// Lista de oraciones con espacios en blanco
  @override
  List<FillBlankItem> get items;

  /// Create a copy of FillBlankGameContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FillBlankGameContentImplCopyWith<_$FillBlankGameContentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

FillBlankItem _$FillBlankItemFromJson(Map<String, dynamic> json) {
  return _FillBlankItem.fromJson(json);
}

/// @nodoc
mixin _$FillBlankItem {
  /// ID del ítem
  int get id => throw _privateConstructorUsedError;

  /// Oración con el espacio en blanco (_____) en inglés
  String get sentence => throw _privateConstructorUsedError;

  /// Oración en español
  @JsonKey(name: 'sentence_es')
  String get sentenceEs => throw _privateConstructorUsedError;

  /// Respuesta correcta
  String get answer => throw _privateConstructorUsedError;

  /// Opciones de respuesta
  List<String> get options => throw _privateConstructorUsedError;

  /// Pista en inglés
  String? get hint => throw _privateConstructorUsedError;

  /// Pista en español
  @JsonKey(name: 'hint_es')
  String? get hintEs => throw _privateConstructorUsedError;

  /// Personaje que dice la frase (con template variable)
  String? get character => throw _privateConstructorUsedError;

  /// Serializes this FillBlankItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FillBlankItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FillBlankItemCopyWith<FillBlankItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FillBlankItemCopyWith<$Res> {
  factory $FillBlankItemCopyWith(
    FillBlankItem value,
    $Res Function(FillBlankItem) then,
  ) = _$FillBlankItemCopyWithImpl<$Res, FillBlankItem>;
  @useResult
  $Res call({
    int id,
    String sentence,
    @JsonKey(name: 'sentence_es') String sentenceEs,
    String answer,
    List<String> options,
    String? hint,
    @JsonKey(name: 'hint_es') String? hintEs,
    String? character,
  });
}

/// @nodoc
class _$FillBlankItemCopyWithImpl<$Res, $Val extends FillBlankItem>
    implements $FillBlankItemCopyWith<$Res> {
  _$FillBlankItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FillBlankItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentence = null,
    Object? sentenceEs = null,
    Object? answer = null,
    Object? options = null,
    Object? hint = freezed,
    Object? hintEs = freezed,
    Object? character = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            sentence: null == sentence
                ? _value.sentence
                : sentence // ignore: cast_nullable_to_non_nullable
                      as String,
            sentenceEs: null == sentenceEs
                ? _value.sentenceEs
                : sentenceEs // ignore: cast_nullable_to_non_nullable
                      as String,
            answer: null == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                      as String,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            hint: freezed == hint
                ? _value.hint
                : hint // ignore: cast_nullable_to_non_nullable
                      as String?,
            hintEs: freezed == hintEs
                ? _value.hintEs
                : hintEs // ignore: cast_nullable_to_non_nullable
                      as String?,
            character: freezed == character
                ? _value.character
                : character // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FillBlankItemImplCopyWith<$Res>
    implements $FillBlankItemCopyWith<$Res> {
  factory _$$FillBlankItemImplCopyWith(
    _$FillBlankItemImpl value,
    $Res Function(_$FillBlankItemImpl) then,
  ) = __$$FillBlankItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String sentence,
    @JsonKey(name: 'sentence_es') String sentenceEs,
    String answer,
    List<String> options,
    String? hint,
    @JsonKey(name: 'hint_es') String? hintEs,
    String? character,
  });
}

/// @nodoc
class __$$FillBlankItemImplCopyWithImpl<$Res>
    extends _$FillBlankItemCopyWithImpl<$Res, _$FillBlankItemImpl>
    implements _$$FillBlankItemImplCopyWith<$Res> {
  __$$FillBlankItemImplCopyWithImpl(
    _$FillBlankItemImpl _value,
    $Res Function(_$FillBlankItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FillBlankItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentence = null,
    Object? sentenceEs = null,
    Object? answer = null,
    Object? options = null,
    Object? hint = freezed,
    Object? hintEs = freezed,
    Object? character = freezed,
  }) {
    return _then(
      _$FillBlankItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        sentence: null == sentence
            ? _value.sentence
            : sentence // ignore: cast_nullable_to_non_nullable
                  as String,
        sentenceEs: null == sentenceEs
            ? _value.sentenceEs
            : sentenceEs // ignore: cast_nullable_to_non_nullable
                  as String,
        answer: null == answer
            ? _value.answer
            : answer // ignore: cast_nullable_to_non_nullable
                  as String,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hint: freezed == hint
            ? _value.hint
            : hint // ignore: cast_nullable_to_non_nullable
                  as String?,
        hintEs: freezed == hintEs
            ? _value.hintEs
            : hintEs // ignore: cast_nullable_to_non_nullable
                  as String?,
        character: freezed == character
            ? _value.character
            : character // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FillBlankItemImpl implements _FillBlankItem {
  const _$FillBlankItemImpl({
    required this.id,
    required this.sentence,
    @JsonKey(name: 'sentence_es') required this.sentenceEs,
    required this.answer,
    final List<String> options = const [],
    this.hint,
    @JsonKey(name: 'hint_es') this.hintEs,
    this.character,
  }) : _options = options;

  factory _$FillBlankItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FillBlankItemImplFromJson(json);

  /// ID del ítem
  @override
  final int id;

  /// Oración con el espacio en blanco (_____) en inglés
  @override
  final String sentence;

  /// Oración en español
  @override
  @JsonKey(name: 'sentence_es')
  final String sentenceEs;

  /// Respuesta correcta
  @override
  final String answer;

  /// Opciones de respuesta
  final List<String> _options;

  /// Opciones de respuesta
  @override
  @JsonKey()
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Pista en inglés
  @override
  final String? hint;

  /// Pista en español
  @override
  @JsonKey(name: 'hint_es')
  final String? hintEs;

  /// Personaje que dice la frase (con template variable)
  @override
  final String? character;

  @override
  String toString() {
    return 'FillBlankItem(id: $id, sentence: $sentence, sentenceEs: $sentenceEs, answer: $answer, options: $options, hint: $hint, hintEs: $hintEs, character: $character)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FillBlankItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            (identical(other.sentenceEs, sentenceEs) ||
                other.sentenceEs == sentenceEs) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.hintEs, hintEs) || other.hintEs == hintEs) &&
            (identical(other.character, character) ||
                other.character == character));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sentence,
    sentenceEs,
    answer,
    const DeepCollectionEquality().hash(_options),
    hint,
    hintEs,
    character,
  );

  /// Create a copy of FillBlankItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FillBlankItemImplCopyWith<_$FillBlankItemImpl> get copyWith =>
      __$$FillBlankItemImplCopyWithImpl<_$FillBlankItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FillBlankItemImplToJson(this);
  }
}

abstract class _FillBlankItem implements FillBlankItem {
  const factory _FillBlankItem({
    required final int id,
    required final String sentence,
    @JsonKey(name: 'sentence_es') required final String sentenceEs,
    required final String answer,
    final List<String> options,
    final String? hint,
    @JsonKey(name: 'hint_es') final String? hintEs,
    final String? character,
  }) = _$FillBlankItemImpl;

  factory _FillBlankItem.fromJson(Map<String, dynamic> json) =
      _$FillBlankItemImpl.fromJson;

  /// ID del ítem
  @override
  int get id;

  /// Oración con el espacio en blanco (_____) en inglés
  @override
  String get sentence;

  /// Oración en español
  @override
  @JsonKey(name: 'sentence_es')
  String get sentenceEs;

  /// Respuesta correcta
  @override
  String get answer;

  /// Opciones de respuesta
  @override
  List<String> get options;

  /// Pista en inglés
  @override
  String? get hint;

  /// Pista en español
  @override
  @JsonKey(name: 'hint_es')
  String? get hintEs;

  /// Personaje que dice la frase (con template variable)
  @override
  String? get character;

  /// Create a copy of FillBlankItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FillBlankItemImplCopyWith<_$FillBlankItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
