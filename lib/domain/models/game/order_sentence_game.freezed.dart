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
  @JsonKey(name: 'game_id')
  String get gameId => throw _privateConstructorUsedError;
  @JsonKey(name: 'game_type')
  String get gameType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_es')
  String get titleEs => throw _privateConstructorUsedError;
  String get instructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'instructions_es')
  String get instructionsEs => throw _privateConstructorUsedError;
  bool get optional => throw _privateConstructorUsedError;
  @JsonKey(name: 'unlocked_after_episode')
  bool get unlockedAfterEpisode => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_limit_seconds')
  int? get timeLimitSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'xp_reward')
  int get xpReward => throw _privateConstructorUsedError;
  OrderSentenceContent get content => throw _privateConstructorUsedError;

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
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
    OrderSentenceContent content,
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
                      as OrderSentenceContent,
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
    bool optional,
    @JsonKey(name: 'unlocked_after_episode') bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') int xpReward,
    OrderSentenceContent content,
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
    Object? optional = null,
    Object? unlockedAfterEpisode = null,
    Object? timeLimitSeconds = freezed,
    Object? xpReward = null,
    Object? content = null,
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
                  as OrderSentenceContent,
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
    this.optional = false,
    @JsonKey(name: 'unlocked_after_episode') this.unlockedAfterEpisode = true,
    @JsonKey(name: 'time_limit_seconds') this.timeLimitSeconds,
    @JsonKey(name: 'xp_reward') this.xpReward = 0,
    required this.content,
  }) : super._();

  factory _$OrderSentenceGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSentenceGameImplFromJson(json);

  @override
  @JsonKey(name: 'game_id')
  final String gameId;
  @override
  @JsonKey(name: 'game_type')
  final String gameType;
  @override
  final String title;
  @override
  @JsonKey(name: 'title_es')
  final String titleEs;
  @override
  final String instructions;
  @override
  @JsonKey(name: 'instructions_es')
  final String instructionsEs;
  @override
  @JsonKey()
  final bool optional;
  @override
  @JsonKey(name: 'unlocked_after_episode')
  final bool unlockedAfterEpisode;
  @override
  @JsonKey(name: 'time_limit_seconds')
  final int? timeLimitSeconds;
  @override
  @JsonKey(name: 'xp_reward')
  final int xpReward;
  @override
  final OrderSentenceContent content;

  @override
  String toString() {
    return 'OrderSentenceGame(gameId: $gameId, gameType: $gameType, title: $title, titleEs: $titleEs, instructions: $instructions, instructionsEs: $instructionsEs, optional: $optional, unlockedAfterEpisode: $unlockedAfterEpisode, timeLimitSeconds: $timeLimitSeconds, xpReward: $xpReward, content: $content)';
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
    final bool optional,
    @JsonKey(name: 'unlocked_after_episode') final bool unlockedAfterEpisode,
    @JsonKey(name: 'time_limit_seconds') final int? timeLimitSeconds,
    @JsonKey(name: 'xp_reward') final int xpReward,
    required final OrderSentenceContent content,
  }) = _$OrderSentenceGameImpl;
  const _OrderSentenceGame._() : super._();

  factory _OrderSentenceGame.fromJson(Map<String, dynamic> json) =
      _$OrderSentenceGameImpl.fromJson;

  @override
  @JsonKey(name: 'game_id')
  String get gameId;
  @override
  @JsonKey(name: 'game_type')
  String get gameType;
  @override
  String get title;
  @override
  @JsonKey(name: 'title_es')
  String get titleEs;
  @override
  String get instructions;
  @override
  @JsonKey(name: 'instructions_es')
  String get instructionsEs;
  @override
  bool get optional;
  @override
  @JsonKey(name: 'unlocked_after_episode')
  bool get unlockedAfterEpisode;
  @override
  @JsonKey(name: 'time_limit_seconds')
  int? get timeLimitSeconds;
  @override
  @JsonKey(name: 'xp_reward')
  int get xpReward;
  @override
  OrderSentenceContent get content;

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

  final List<OrderSentenceItem> _items;
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
  int get id => throw _privateConstructorUsedError;
  String? get prompt => throw _privateConstructorUsedError;
  @JsonKey(name: 'prompt_es')
  String? get promptEs => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_sentence')
  String get correctSentence => throw _privateConstructorUsedError;
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
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    @JsonKey(name: 'correct_sentence') String correctSentence,
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
    Object? prompt = freezed,
    Object? promptEs = freezed,
    Object? correctSentence = null,
    Object? words = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            prompt: freezed == prompt
                ? _value.prompt
                : prompt // ignore: cast_nullable_to_non_nullable
                      as String?,
            promptEs: freezed == promptEs
                ? _value.promptEs
                : promptEs // ignore: cast_nullable_to_non_nullable
                      as String?,
            correctSentence: null == correctSentence
                ? _value.correctSentence
                : correctSentence // ignore: cast_nullable_to_non_nullable
                      as String,
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
    String? prompt,
    @JsonKey(name: 'prompt_es') String? promptEs,
    @JsonKey(name: 'correct_sentence') String correctSentence,
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
    Object? prompt = freezed,
    Object? promptEs = freezed,
    Object? correctSentence = null,
    Object? words = null,
  }) {
    return _then(
      _$OrderSentenceItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        prompt: freezed == prompt
            ? _value.prompt
            : prompt // ignore: cast_nullable_to_non_nullable
                  as String?,
        promptEs: freezed == promptEs
            ? _value.promptEs
            : promptEs // ignore: cast_nullable_to_non_nullable
                  as String?,
        correctSentence: null == correctSentence
            ? _value.correctSentence
            : correctSentence // ignore: cast_nullable_to_non_nullable
                  as String,
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
    this.prompt,
    @JsonKey(name: 'prompt_es') this.promptEs,
    @JsonKey(name: 'correct_sentence') required this.correctSentence,
    @JsonKey(name: 'words') final List<String> words = const [],
  }) : _words = words;

  factory _$OrderSentenceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSentenceItemImplFromJson(json);

  @override
  final int id;
  @override
  final String? prompt;
  @override
  @JsonKey(name: 'prompt_es')
  final String? promptEs;
  @override
  @JsonKey(name: 'correct_sentence')
  final String correctSentence;
  final List<String> _words;
  @override
  @JsonKey(name: 'words')
  List<String> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'OrderSentenceItem(id: $id, prompt: $prompt, promptEs: $promptEs, correctSentence: $correctSentence, words: $words)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSentenceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.promptEs, promptEs) ||
                other.promptEs == promptEs) &&
            (identical(other.correctSentence, correctSentence) ||
                other.correctSentence == correctSentence) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    prompt,
    promptEs,
    correctSentence,
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
    final String? prompt,
    @JsonKey(name: 'prompt_es') final String? promptEs,
    @JsonKey(name: 'correct_sentence') required final String correctSentence,
    @JsonKey(name: 'words') final List<String> words,
  }) = _$OrderSentenceItemImpl;

  factory _OrderSentenceItem.fromJson(Map<String, dynamic> json) =
      _$OrderSentenceItemImpl.fromJson;

  @override
  int get id;
  @override
  String? get prompt;
  @override
  @JsonKey(name: 'prompt_es')
  String? get promptEs;
  @override
  @JsonKey(name: 'correct_sentence')
  String get correctSentence;
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
