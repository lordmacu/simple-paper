// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multiple_choice_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MultipleChoiceGame _$MultipleChoiceGameFromJson(Map<String, dynamic> json) {
  return _MultipleChoiceGame.fromJson(json);
}

/// @nodoc
mixin _$MultipleChoiceGame {
  /// ID único del juego
  @JsonKey(name: 'game_id')
  String get gameId => throw _privateConstructorUsedError;

  /// Tipo de juego (siempre 'multiple_choice')
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
  MultipleChoiceGameContent get content => throw _privateConstructorUsedError;

  /// Serializes this MultipleChoiceGame to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MultipleChoiceGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MultipleChoiceGameCopyWith<MultipleChoiceGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultipleChoiceGameCopyWith<$Res> {
  factory $MultipleChoiceGameCopyWith(
    MultipleChoiceGame value,
    $Res Function(MultipleChoiceGame) then,
  ) = _$MultipleChoiceGameCopyWithImpl<$Res, MultipleChoiceGame>;
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
    MultipleChoiceGameContent content,
  });

  $MultipleChoiceGameContentCopyWith<$Res> get content;
}

/// @nodoc
class _$MultipleChoiceGameCopyWithImpl<$Res, $Val extends MultipleChoiceGame>
    implements $MultipleChoiceGameCopyWith<$Res> {
  _$MultipleChoiceGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MultipleChoiceGame
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
                      as MultipleChoiceGameContent,
          )
          as $Val,
    );
  }

  /// Create a copy of MultipleChoiceGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultipleChoiceGameContentCopyWith<$Res> get content {
    return $MultipleChoiceGameContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MultipleChoiceGameImplCopyWith<$Res>
    implements $MultipleChoiceGameCopyWith<$Res> {
  factory _$$MultipleChoiceGameImplCopyWith(
    _$MultipleChoiceGameImpl value,
    $Res Function(_$MultipleChoiceGameImpl) then,
  ) = __$$MultipleChoiceGameImplCopyWithImpl<$Res>;
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
    MultipleChoiceGameContent content,
  });

  @override
  $MultipleChoiceGameContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$MultipleChoiceGameImplCopyWithImpl<$Res>
    extends _$MultipleChoiceGameCopyWithImpl<$Res, _$MultipleChoiceGameImpl>
    implements _$$MultipleChoiceGameImplCopyWith<$Res> {
  __$$MultipleChoiceGameImplCopyWithImpl(
    _$MultipleChoiceGameImpl _value,
    $Res Function(_$MultipleChoiceGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MultipleChoiceGame
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
      _$MultipleChoiceGameImpl(
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
                  as MultipleChoiceGameContent,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MultipleChoiceGameImpl extends _MultipleChoiceGame {
  const _$MultipleChoiceGameImpl({
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

  factory _$MultipleChoiceGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultipleChoiceGameImplFromJson(json);

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  final String gameId;

  /// Tipo de juego (siempre 'multiple_choice')
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
  final MultipleChoiceGameContent content;

  @override
  String toString() {
    return 'MultipleChoiceGame(gameId: $gameId, gameType: $gameType, title: $title, titleEs: $titleEs, instructions: $instructions, instructionsEs: $instructionsEs, optional: $optional, unlockedAfterEpisode: $unlockedAfterEpisode, timeLimitSeconds: $timeLimitSeconds, xpReward: $xpReward, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultipleChoiceGameImpl &&
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

  /// Create a copy of MultipleChoiceGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MultipleChoiceGameImplCopyWith<_$MultipleChoiceGameImpl> get copyWith =>
      __$$MultipleChoiceGameImplCopyWithImpl<_$MultipleChoiceGameImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MultipleChoiceGameImplToJson(this);
  }
}

abstract class _MultipleChoiceGame extends MultipleChoiceGame {
  const factory _MultipleChoiceGame({
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
    required final MultipleChoiceGameContent content,
  }) = _$MultipleChoiceGameImpl;
  const _MultipleChoiceGame._() : super._();

  factory _MultipleChoiceGame.fromJson(Map<String, dynamic> json) =
      _$MultipleChoiceGameImpl.fromJson;

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  String get gameId;

  /// Tipo de juego (siempre 'multiple_choice')
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
  MultipleChoiceGameContent get content;

  /// Create a copy of MultipleChoiceGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MultipleChoiceGameImplCopyWith<_$MultipleChoiceGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MultipleChoiceGameContent _$MultipleChoiceGameContentFromJson(
  Map<String, dynamic> json,
) {
  return _MultipleChoiceGameContent.fromJson(json);
}

/// @nodoc
mixin _$MultipleChoiceGameContent {
  /// Lista de preguntas
  List<MultipleChoiceItem> get items => throw _privateConstructorUsedError;

  /// Serializes this MultipleChoiceGameContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MultipleChoiceGameContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MultipleChoiceGameContentCopyWith<MultipleChoiceGameContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultipleChoiceGameContentCopyWith<$Res> {
  factory $MultipleChoiceGameContentCopyWith(
    MultipleChoiceGameContent value,
    $Res Function(MultipleChoiceGameContent) then,
  ) = _$MultipleChoiceGameContentCopyWithImpl<$Res, MultipleChoiceGameContent>;
  @useResult
  $Res call({List<MultipleChoiceItem> items});
}

/// @nodoc
class _$MultipleChoiceGameContentCopyWithImpl<
  $Res,
  $Val extends MultipleChoiceGameContent
>
    implements $MultipleChoiceGameContentCopyWith<$Res> {
  _$MultipleChoiceGameContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MultipleChoiceGameContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<MultipleChoiceItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MultipleChoiceGameContentImplCopyWith<$Res>
    implements $MultipleChoiceGameContentCopyWith<$Res> {
  factory _$$MultipleChoiceGameContentImplCopyWith(
    _$MultipleChoiceGameContentImpl value,
    $Res Function(_$MultipleChoiceGameContentImpl) then,
  ) = __$$MultipleChoiceGameContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MultipleChoiceItem> items});
}

/// @nodoc
class __$$MultipleChoiceGameContentImplCopyWithImpl<$Res>
    extends
        _$MultipleChoiceGameContentCopyWithImpl<
          $Res,
          _$MultipleChoiceGameContentImpl
        >
    implements _$$MultipleChoiceGameContentImplCopyWith<$Res> {
  __$$MultipleChoiceGameContentImplCopyWithImpl(
    _$MultipleChoiceGameContentImpl _value,
    $Res Function(_$MultipleChoiceGameContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MultipleChoiceGameContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$MultipleChoiceGameContentImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<MultipleChoiceItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MultipleChoiceGameContentImpl implements _MultipleChoiceGameContent {
  const _$MultipleChoiceGameContentImpl({
    final List<MultipleChoiceItem> items = const [],
  }) : _items = items;

  factory _$MultipleChoiceGameContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultipleChoiceGameContentImplFromJson(json);

  /// Lista de preguntas
  final List<MultipleChoiceItem> _items;

  /// Lista de preguntas
  @override
  @JsonKey()
  List<MultipleChoiceItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'MultipleChoiceGameContent(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultipleChoiceGameContentImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of MultipleChoiceGameContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MultipleChoiceGameContentImplCopyWith<_$MultipleChoiceGameContentImpl>
  get copyWith =>
      __$$MultipleChoiceGameContentImplCopyWithImpl<
        _$MultipleChoiceGameContentImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MultipleChoiceGameContentImplToJson(this);
  }
}

abstract class _MultipleChoiceGameContent implements MultipleChoiceGameContent {
  const factory _MultipleChoiceGameContent({
    final List<MultipleChoiceItem> items,
  }) = _$MultipleChoiceGameContentImpl;

  factory _MultipleChoiceGameContent.fromJson(Map<String, dynamic> json) =
      _$MultipleChoiceGameContentImpl.fromJson;

  /// Lista de preguntas
  @override
  List<MultipleChoiceItem> get items;

  /// Create a copy of MultipleChoiceGameContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MultipleChoiceGameContentImplCopyWith<_$MultipleChoiceGameContentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MultipleChoiceItem _$MultipleChoiceItemFromJson(Map<String, dynamic> json) {
  return _MultipleChoiceItem.fromJson(json);
}

/// @nodoc
mixin _$MultipleChoiceItem {
  /// ID de la pregunta
  int get id => throw _privateConstructorUsedError;

  /// Pregunta en inglés
  String get question => throw _privateConstructorUsedError;

  /// Pregunta en español
  @JsonKey(name: 'question_es')
  String get questionEs => throw _privateConstructorUsedError;

  /// Opciones de respuesta en inglés
  List<String> get options => throw _privateConstructorUsedError;

  /// Opciones de respuesta en español
  @JsonKey(name: 'options_es')
  List<String> get optionsEs => throw _privateConstructorUsedError;

  /// Índice de la respuesta correcta (0-based)
  @JsonKey(name: 'correct_answer')
  int get correctAnswer => throw _privateConstructorUsedError;

  /// Explicación de la respuesta en inglés
  String? get explanation => throw _privateConstructorUsedError;

  /// Explicación en español
  @JsonKey(name: 'explanation_es')
  String? get explanationEs => throw _privateConstructorUsedError;

  /// URL de imagen opcional
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this MultipleChoiceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MultipleChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MultipleChoiceItemCopyWith<MultipleChoiceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultipleChoiceItemCopyWith<$Res> {
  factory $MultipleChoiceItemCopyWith(
    MultipleChoiceItem value,
    $Res Function(MultipleChoiceItem) then,
  ) = _$MultipleChoiceItemCopyWithImpl<$Res, MultipleChoiceItem>;
  @useResult
  $Res call({
    int id,
    String question,
    @JsonKey(name: 'question_es') String questionEs,
    List<String> options,
    @JsonKey(name: 'options_es') List<String> optionsEs,
    @JsonKey(name: 'correct_answer') int correctAnswer,
    String? explanation,
    @JsonKey(name: 'explanation_es') String? explanationEs,
    @JsonKey(name: 'image_url') String? imageUrl,
  });
}

/// @nodoc
class _$MultipleChoiceItemCopyWithImpl<$Res, $Val extends MultipleChoiceItem>
    implements $MultipleChoiceItemCopyWith<$Res> {
  _$MultipleChoiceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MultipleChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? questionEs = null,
    Object? options = null,
    Object? optionsEs = null,
    Object? correctAnswer = null,
    Object? explanation = freezed,
    Object? explanationEs = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            questionEs: null == questionEs
                ? _value.questionEs
                : questionEs // ignore: cast_nullable_to_non_nullable
                      as String,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            optionsEs: null == optionsEs
                ? _value.optionsEs
                : optionsEs // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            correctAnswer: null == correctAnswer
                ? _value.correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                      as int,
            explanation: freezed == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String?,
            explanationEs: freezed == explanationEs
                ? _value.explanationEs
                : explanationEs // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$MultipleChoiceItemImplCopyWith<$Res>
    implements $MultipleChoiceItemCopyWith<$Res> {
  factory _$$MultipleChoiceItemImplCopyWith(
    _$MultipleChoiceItemImpl value,
    $Res Function(_$MultipleChoiceItemImpl) then,
  ) = __$$MultipleChoiceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String question,
    @JsonKey(name: 'question_es') String questionEs,
    List<String> options,
    @JsonKey(name: 'options_es') List<String> optionsEs,
    @JsonKey(name: 'correct_answer') int correctAnswer,
    String? explanation,
    @JsonKey(name: 'explanation_es') String? explanationEs,
    @JsonKey(name: 'image_url') String? imageUrl,
  });
}

/// @nodoc
class __$$MultipleChoiceItemImplCopyWithImpl<$Res>
    extends _$MultipleChoiceItemCopyWithImpl<$Res, _$MultipleChoiceItemImpl>
    implements _$$MultipleChoiceItemImplCopyWith<$Res> {
  __$$MultipleChoiceItemImplCopyWithImpl(
    _$MultipleChoiceItemImpl _value,
    $Res Function(_$MultipleChoiceItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MultipleChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? questionEs = null,
    Object? options = null,
    Object? optionsEs = null,
    Object? correctAnswer = null,
    Object? explanation = freezed,
    Object? explanationEs = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$MultipleChoiceItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        questionEs: null == questionEs
            ? _value.questionEs
            : questionEs // ignore: cast_nullable_to_non_nullable
                  as String,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        optionsEs: null == optionsEs
            ? _value._optionsEs
            : optionsEs // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        correctAnswer: null == correctAnswer
            ? _value.correctAnswer
            : correctAnswer // ignore: cast_nullable_to_non_nullable
                  as int,
        explanation: freezed == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String?,
        explanationEs: freezed == explanationEs
            ? _value.explanationEs
            : explanationEs // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$MultipleChoiceItemImpl implements _MultipleChoiceItem {
  const _$MultipleChoiceItemImpl({
    required this.id,
    required this.question,
    @JsonKey(name: 'question_es') required this.questionEs,
    final List<String> options = const [],
    @JsonKey(name: 'options_es') final List<String> optionsEs = const [],
    @JsonKey(name: 'correct_answer') required this.correctAnswer,
    this.explanation,
    @JsonKey(name: 'explanation_es') this.explanationEs,
    @JsonKey(name: 'image_url') this.imageUrl,
  }) : _options = options,
       _optionsEs = optionsEs;

  factory _$MultipleChoiceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultipleChoiceItemImplFromJson(json);

  /// ID de la pregunta
  @override
  final int id;

  /// Pregunta en inglés
  @override
  final String question;

  /// Pregunta en español
  @override
  @JsonKey(name: 'question_es')
  final String questionEs;

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

  /// Índice de la respuesta correcta (0-based)
  @override
  @JsonKey(name: 'correct_answer')
  final int correctAnswer;

  /// Explicación de la respuesta en inglés
  @override
  final String? explanation;

  /// Explicación en español
  @override
  @JsonKey(name: 'explanation_es')
  final String? explanationEs;

  /// URL de imagen opcional
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'MultipleChoiceItem(id: $id, question: $question, questionEs: $questionEs, options: $options, optionsEs: $optionsEs, correctAnswer: $correctAnswer, explanation: $explanation, explanationEs: $explanationEs, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultipleChoiceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.questionEs, questionEs) ||
                other.questionEs == questionEs) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality().equals(
              other._optionsEs,
              _optionsEs,
            ) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.explanationEs, explanationEs) ||
                other.explanationEs == explanationEs) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    question,
    questionEs,
    const DeepCollectionEquality().hash(_options),
    const DeepCollectionEquality().hash(_optionsEs),
    correctAnswer,
    explanation,
    explanationEs,
    imageUrl,
  );

  /// Create a copy of MultipleChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MultipleChoiceItemImplCopyWith<_$MultipleChoiceItemImpl> get copyWith =>
      __$$MultipleChoiceItemImplCopyWithImpl<_$MultipleChoiceItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MultipleChoiceItemImplToJson(this);
  }
}

abstract class _MultipleChoiceItem implements MultipleChoiceItem {
  const factory _MultipleChoiceItem({
    required final int id,
    required final String question,
    @JsonKey(name: 'question_es') required final String questionEs,
    final List<String> options,
    @JsonKey(name: 'options_es') final List<String> optionsEs,
    @JsonKey(name: 'correct_answer') required final int correctAnswer,
    final String? explanation,
    @JsonKey(name: 'explanation_es') final String? explanationEs,
    @JsonKey(name: 'image_url') final String? imageUrl,
  }) = _$MultipleChoiceItemImpl;

  factory _MultipleChoiceItem.fromJson(Map<String, dynamic> json) =
      _$MultipleChoiceItemImpl.fromJson;

  /// ID de la pregunta
  @override
  int get id;

  /// Pregunta en inglés
  @override
  String get question;

  /// Pregunta en español
  @override
  @JsonKey(name: 'question_es')
  String get questionEs;

  /// Opciones de respuesta en inglés
  @override
  List<String> get options;

  /// Opciones de respuesta en español
  @override
  @JsonKey(name: 'options_es')
  List<String> get optionsEs;

  /// Índice de la respuesta correcta (0-based)
  @override
  @JsonKey(name: 'correct_answer')
  int get correctAnswer;

  /// Explicación de la respuesta en inglés
  @override
  String? get explanation;

  /// Explicación en español
  @override
  @JsonKey(name: 'explanation_es')
  String? get explanationEs;

  /// URL de imagen opcional
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of MultipleChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MultipleChoiceItemImplCopyWith<_$MultipleChoiceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
