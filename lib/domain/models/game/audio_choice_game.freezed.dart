// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_choice_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AudioChoiceGame _$AudioChoiceGameFromJson(Map<String, dynamic> json) {
  return _AudioChoiceGame.fromJson(json);
}

/// @nodoc
mixin _$AudioChoiceGame {
  /// ID único del juego
  @JsonKey(name: 'game_id')
  String get gameId => throw _privateConstructorUsedError;

  /// Tipo de juego (siempre 'audio_choice')
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
  AudioChoiceContent get content => throw _privateConstructorUsedError;

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

  /// Serializes this AudioChoiceGame to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AudioChoiceGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioChoiceGameCopyWith<AudioChoiceGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioChoiceGameCopyWith<$Res> {
  factory $AudioChoiceGameCopyWith(
    AudioChoiceGame value,
    $Res Function(AudioChoiceGame) then,
  ) = _$AudioChoiceGameCopyWithImpl<$Res, AudioChoiceGame>;
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    AudioChoiceContent content,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
  });

  $AudioChoiceContentCopyWith<$Res> get content;
}

/// @nodoc
class _$AudioChoiceGameCopyWithImpl<$Res, $Val extends AudioChoiceGame>
    implements $AudioChoiceGameCopyWith<$Res> {
  _$AudioChoiceGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioChoiceGame
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
                      as AudioChoiceContent,
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

  /// Create a copy of AudioChoiceGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AudioChoiceContentCopyWith<$Res> get content {
    return $AudioChoiceContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AudioChoiceGameImplCopyWith<$Res>
    implements $AudioChoiceGameCopyWith<$Res> {
  factory _$$AudioChoiceGameImplCopyWith(
    _$AudioChoiceGameImpl value,
    $Res Function(_$AudioChoiceGameImpl) then,
  ) = __$$AudioChoiceGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'game_id') String gameId,
    @JsonKey(name: 'game_type') String gameType,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String instructions,
    @JsonKey(name: 'instructions_es') String instructionsEs,
    AudioChoiceContent content,
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
  });

  @override
  $AudioChoiceContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$AudioChoiceGameImplCopyWithImpl<$Res>
    extends _$AudioChoiceGameCopyWithImpl<$Res, _$AudioChoiceGameImpl>
    implements _$$AudioChoiceGameImplCopyWith<$Res> {
  __$$AudioChoiceGameImplCopyWithImpl(
    _$AudioChoiceGameImpl _value,
    $Res Function(_$AudioChoiceGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AudioChoiceGame
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
      _$AudioChoiceGameImpl(
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
                  as AudioChoiceContent,
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
class _$AudioChoiceGameImpl extends _AudioChoiceGame {
  const _$AudioChoiceGameImpl({
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

  factory _$AudioChoiceGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioChoiceGameImplFromJson(json);

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  final String gameId;

  /// Tipo de juego (siempre 'audio_choice')
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
  final AudioChoiceContent content;

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
    return 'AudioChoiceGame(gameId: $gameId, gameType: $gameType, title: $title, titleEs: $titleEs, instructions: $instructions, instructionsEs: $instructionsEs, content: $content, optional: $optional, unlockedAfterEpisode: $unlockedAfterEpisode, timeLimitSeconds: $timeLimitSeconds, xpReward: $xpReward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioChoiceGameImpl &&
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

  /// Create a copy of AudioChoiceGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioChoiceGameImplCopyWith<_$AudioChoiceGameImpl> get copyWith =>
      __$$AudioChoiceGameImplCopyWithImpl<_$AudioChoiceGameImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioChoiceGameImplToJson(this);
  }
}

abstract class _AudioChoiceGame extends AudioChoiceGame {
  const factory _AudioChoiceGame({
    @JsonKey(name: 'game_id') required final String gameId,
    @JsonKey(name: 'game_type') required final String gameType,
    required final String title,
    @JsonKey(name: 'title_es') required final String titleEs,
    required final String instructions,
    @JsonKey(name: 'instructions_es') required final String instructionsEs,
    required final AudioChoiceContent content,
    final bool optional,
    @JsonKey(name: 'unlocked_after_episode') final bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') final int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') final int xpReward,
  }) = _$AudioChoiceGameImpl;
  const _AudioChoiceGame._() : super._();

  factory _AudioChoiceGame.fromJson(Map<String, dynamic> json) =
      _$AudioChoiceGameImpl.fromJson;

  /// ID único del juego
  @override
  @JsonKey(name: 'game_id')
  String get gameId;

  /// Tipo de juego (siempre 'audio_choice')
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
  AudioChoiceContent get content;

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

  /// Create a copy of AudioChoiceGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioChoiceGameImplCopyWith<_$AudioChoiceGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioChoiceContent _$AudioChoiceContentFromJson(Map<String, dynamic> json) {
  return _AudioChoiceContent.fromJson(json);
}

/// @nodoc
mixin _$AudioChoiceContent {
  /// Lista de ítems de audio
  List<AudioChoiceItem> get items => throw _privateConstructorUsedError;

  /// Serializes this AudioChoiceContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AudioChoiceContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioChoiceContentCopyWith<AudioChoiceContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioChoiceContentCopyWith<$Res> {
  factory $AudioChoiceContentCopyWith(
    AudioChoiceContent value,
    $Res Function(AudioChoiceContent) then,
  ) = _$AudioChoiceContentCopyWithImpl<$Res, AudioChoiceContent>;
  @useResult
  $Res call({List<AudioChoiceItem> items});
}

/// @nodoc
class _$AudioChoiceContentCopyWithImpl<$Res, $Val extends AudioChoiceContent>
    implements $AudioChoiceContentCopyWith<$Res> {
  _$AudioChoiceContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioChoiceContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<AudioChoiceItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AudioChoiceContentImplCopyWith<$Res>
    implements $AudioChoiceContentCopyWith<$Res> {
  factory _$$AudioChoiceContentImplCopyWith(
    _$AudioChoiceContentImpl value,
    $Res Function(_$AudioChoiceContentImpl) then,
  ) = __$$AudioChoiceContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AudioChoiceItem> items});
}

/// @nodoc
class __$$AudioChoiceContentImplCopyWithImpl<$Res>
    extends _$AudioChoiceContentCopyWithImpl<$Res, _$AudioChoiceContentImpl>
    implements _$$AudioChoiceContentImplCopyWith<$Res> {
  __$$AudioChoiceContentImplCopyWithImpl(
    _$AudioChoiceContentImpl _value,
    $Res Function(_$AudioChoiceContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AudioChoiceContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$AudioChoiceContentImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<AudioChoiceItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioChoiceContentImpl implements _AudioChoiceContent {
  const _$AudioChoiceContentImpl({final List<AudioChoiceItem> items = const []})
    : _items = items;

  factory _$AudioChoiceContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioChoiceContentImplFromJson(json);

  /// Lista de ítems de audio
  final List<AudioChoiceItem> _items;

  /// Lista de ítems de audio
  @override
  @JsonKey()
  List<AudioChoiceItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AudioChoiceContent(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioChoiceContentImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of AudioChoiceContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioChoiceContentImplCopyWith<_$AudioChoiceContentImpl> get copyWith =>
      __$$AudioChoiceContentImplCopyWithImpl<_$AudioChoiceContentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioChoiceContentImplToJson(this);
  }
}

abstract class _AudioChoiceContent implements AudioChoiceContent {
  const factory _AudioChoiceContent({final List<AudioChoiceItem> items}) =
      _$AudioChoiceContentImpl;

  factory _AudioChoiceContent.fromJson(Map<String, dynamic> json) =
      _$AudioChoiceContentImpl.fromJson;

  /// Lista de ítems de audio
  @override
  List<AudioChoiceItem> get items;

  /// Create a copy of AudioChoiceContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioChoiceContentImplCopyWith<_$AudioChoiceContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioChoiceItem _$AudioChoiceItemFromJson(Map<String, dynamic> json) {
  return _AudioChoiceItem.fromJson(json);
}

/// @nodoc
mixin _$AudioChoiceItem {
  /// ID del ítem
  int get id => throw _privateConstructorUsedError;

  /// URL del archivo de audio
  @JsonKey(name: 'audio_url')
  String get audioUrl => throw _privateConstructorUsedError;

  /// Índice de la respuesta correcta (0-based)
  @JsonKey(name: 'correct_answer')
  int get correctAnswer => throw _privateConstructorUsedError;

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

  /// Serializes this AudioChoiceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AudioChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioChoiceItemCopyWith<AudioChoiceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioChoiceItemCopyWith<$Res> {
  factory $AudioChoiceItemCopyWith(
    AudioChoiceItem value,
    $Res Function(AudioChoiceItem) then,
  ) = _$AudioChoiceItemCopyWithImpl<$Res, AudioChoiceItem>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'audio_url') String audioUrl,
    @JsonKey(name: 'correct_answer') int correctAnswer,
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    List<String> options,
    @JsonKey(name: 'options_es') List<String> optionsEs,
  });
}

/// @nodoc
class _$AudioChoiceItemCopyWithImpl<$Res, $Val extends AudioChoiceItem>
    implements $AudioChoiceItemCopyWith<$Res> {
  _$AudioChoiceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? audioUrl = null,
    Object? correctAnswer = null,
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
            audioUrl: null == audioUrl
                ? _value.audioUrl
                : audioUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            correctAnswer: null == correctAnswer
                ? _value.correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$AudioChoiceItemImplCopyWith<$Res>
    implements $AudioChoiceItemCopyWith<$Res> {
  factory _$$AudioChoiceItemImplCopyWith(
    _$AudioChoiceItemImpl value,
    $Res Function(_$AudioChoiceItemImpl) then,
  ) = __$$AudioChoiceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'audio_url') String audioUrl,
    @JsonKey(name: 'correct_answer') int correctAnswer,
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    List<String> options,
    @JsonKey(name: 'options_es') List<String> optionsEs,
  });
}

/// @nodoc
class __$$AudioChoiceItemImplCopyWithImpl<$Res>
    extends _$AudioChoiceItemCopyWithImpl<$Res, _$AudioChoiceItemImpl>
    implements _$$AudioChoiceItemImplCopyWith<$Res> {
  __$$AudioChoiceItemImplCopyWithImpl(
    _$AudioChoiceItemImpl _value,
    $Res Function(_$AudioChoiceItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AudioChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? audioUrl = null,
    Object? correctAnswer = null,
    Object? prompt = freezed,
    Object? promptEs = freezed,
    Object? options = null,
    Object? optionsEs = null,
  }) {
    return _then(
      _$AudioChoiceItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        audioUrl: null == audioUrl
            ? _value.audioUrl
            : audioUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        correctAnswer: null == correctAnswer
            ? _value.correctAnswer
            : correctAnswer // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$AudioChoiceItemImpl implements _AudioChoiceItem {
  const _$AudioChoiceItemImpl({
    required this.id,
    @JsonKey(name: 'audio_url') required this.audioUrl,
    @JsonKey(name: 'correct_answer') required this.correctAnswer,
    this.prompt,
    @JsonKey(name: 'prompt_es') this.promptEs,
    final List<String> options = const [],
    @JsonKey(name: 'options_es') final List<String> optionsEs = const [],
  }) : _options = options,
       _optionsEs = optionsEs;

  factory _$AudioChoiceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioChoiceItemImplFromJson(json);

  /// ID del ítem
  @override
  final int id;

  /// URL del archivo de audio
  @override
  @JsonKey(name: 'audio_url')
  final String audioUrl;

  /// Índice de la respuesta correcta (0-based)
  @override
  @JsonKey(name: 'correct_answer')
  final int correctAnswer;

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
    return 'AudioChoiceItem(id: $id, audioUrl: $audioUrl, correctAnswer: $correctAnswer, prompt: $prompt, promptEs: $promptEs, options: $options, optionsEs: $optionsEs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioChoiceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
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
    audioUrl,
    correctAnswer,
    prompt,
    promptEs,
    const DeepCollectionEquality().hash(_options),
    const DeepCollectionEquality().hash(_optionsEs),
  );

  /// Create a copy of AudioChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioChoiceItemImplCopyWith<_$AudioChoiceItemImpl> get copyWith =>
      __$$AudioChoiceItemImplCopyWithImpl<_$AudioChoiceItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioChoiceItemImplToJson(this);
  }
}

abstract class _AudioChoiceItem implements AudioChoiceItem {
  const factory _AudioChoiceItem({
    required final int id,
    @JsonKey(name: 'audio_url') required final String audioUrl,
    @JsonKey(name: 'correct_answer') required final int correctAnswer,
    final String? prompt,
    @JsonKey(name: 'prompt_es') final String? promptEs,
    final List<String> options,
    @JsonKey(name: 'options_es') final List<String> optionsEs,
  }) = _$AudioChoiceItemImpl;

  factory _AudioChoiceItem.fromJson(Map<String, dynamic> json) =
      _$AudioChoiceItemImpl.fromJson;

  /// ID del ítem
  @override
  int get id;

  /// URL del archivo de audio
  @override
  @JsonKey(name: 'audio_url')
  String get audioUrl;

  /// Índice de la respuesta correcta (0-based)
  @override
  @JsonKey(name: 'correct_answer')
  int get correctAnswer;

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

  /// Create a copy of AudioChoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioChoiceItemImplCopyWith<_$AudioChoiceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
