// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return _Episode.fromJson(json);
}

/// @nodoc
mixin _$Episode {
  /// Metadatos del episodio
  @JsonKey(name: 'episode_metadata')
  EpisodeMetadata get episodeMetadata => throw _privateConstructorUsedError;

  /// Configuración de ciudad
  @JsonKey(name: 'city_settings')
  CitySettings get citySettings => throw _privateConstructorUsedError;

  /// Personajes que aparecen en el episodio
  @JsonKey(name: 'characters')
  CharactersInEpisode get characters => throw _privateConstructorUsedError;

  /// Foco de vocabulario
  @JsonKey(name: 'vocabulary_focus')
  VocabularyFocus get vocabularyFocus => throw _privateConstructorUsedError;

  /// Historia de introducción al vocabulario
  @JsonKey(name: 'vocabulary_story')
  VocabularyStory? get vocabularyStory => throw _privateConstructorUsedError;

  /// Escenas de la historia principal
  List<Scene> get scenes => throw _privateConstructorUsedError;

  /// Juegos del episodio (mezclados: matching, fill_blank, multiple_choice)
  @JsonKey(fromJson: _gamesFromJson)
  List<dynamic> get games => throw _privateConstructorUsedError;

  /// Preview del siguiente episodio (opcional)
  @JsonKey(name: 'next_episode_preview')
  NextEpisodePreview? get nextEpisodePreview =>
      throw _privateConstructorUsedError;

  /// Sistema de progresión
  Progression get progression => throw _privateConstructorUsedError;

  /// Contenedores de texto (intro, transición, conclusión)
  @JsonKey(name: 'content_wrappers')
  ContentWrappers get contentWrappers => throw _privateConstructorUsedError;

  /// Serializes this Episode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodeCopyWith<Episode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeCopyWith<$Res> {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) then) =
      _$EpisodeCopyWithImpl<$Res, Episode>;
  @useResult
  $Res call({
    @JsonKey(name: 'episode_metadata') EpisodeMetadata episodeMetadata,
    @JsonKey(name: 'city_settings') CitySettings citySettings,
    @JsonKey(name: 'characters') CharactersInEpisode characters,
    @JsonKey(name: 'vocabulary_focus') VocabularyFocus vocabularyFocus,
    @JsonKey(name: 'vocabulary_story') VocabularyStory? vocabularyStory,
    List<Scene> scenes,
    @JsonKey(fromJson: _gamesFromJson) List<dynamic> games,
    @JsonKey(name: 'next_episode_preview')
    NextEpisodePreview? nextEpisodePreview,
    Progression progression,
    @JsonKey(name: 'content_wrappers') ContentWrappers contentWrappers,
  });

  $EpisodeMetadataCopyWith<$Res> get episodeMetadata;
  $CitySettingsCopyWith<$Res> get citySettings;
  $CharactersInEpisodeCopyWith<$Res> get characters;
  $VocabularyFocusCopyWith<$Res> get vocabularyFocus;
  $VocabularyStoryCopyWith<$Res>? get vocabularyStory;
  $NextEpisodePreviewCopyWith<$Res>? get nextEpisodePreview;
  $ProgressionCopyWith<$Res> get progression;
  $ContentWrappersCopyWith<$Res> get contentWrappers;
}

/// @nodoc
class _$EpisodeCopyWithImpl<$Res, $Val extends Episode>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodeMetadata = null,
    Object? citySettings = null,
    Object? characters = null,
    Object? vocabularyFocus = null,
    Object? vocabularyStory = freezed,
    Object? scenes = null,
    Object? games = null,
    Object? nextEpisodePreview = freezed,
    Object? progression = null,
    Object? contentWrappers = null,
  }) {
    return _then(
      _value.copyWith(
            episodeMetadata: null == episodeMetadata
                ? _value.episodeMetadata
                : episodeMetadata // ignore: cast_nullable_to_non_nullable
                      as EpisodeMetadata,
            citySettings: null == citySettings
                ? _value.citySettings
                : citySettings // ignore: cast_nullable_to_non_nullable
                      as CitySettings,
            characters: null == characters
                ? _value.characters
                : characters // ignore: cast_nullable_to_non_nullable
                      as CharactersInEpisode,
            vocabularyFocus: null == vocabularyFocus
                ? _value.vocabularyFocus
                : vocabularyFocus // ignore: cast_nullable_to_non_nullable
                      as VocabularyFocus,
            vocabularyStory: freezed == vocabularyStory
                ? _value.vocabularyStory
                : vocabularyStory // ignore: cast_nullable_to_non_nullable
                      as VocabularyStory?,
            scenes: null == scenes
                ? _value.scenes
                : scenes // ignore: cast_nullable_to_non_nullable
                      as List<Scene>,
            games: null == games
                ? _value.games
                : games // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            nextEpisodePreview: freezed == nextEpisodePreview
                ? _value.nextEpisodePreview
                : nextEpisodePreview // ignore: cast_nullable_to_non_nullable
                      as NextEpisodePreview?,
            progression: null == progression
                ? _value.progression
                : progression // ignore: cast_nullable_to_non_nullable
                      as Progression,
            contentWrappers: null == contentWrappers
                ? _value.contentWrappers
                : contentWrappers // ignore: cast_nullable_to_non_nullable
                      as ContentWrappers,
          )
          as $Val,
    );
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EpisodeMetadataCopyWith<$Res> get episodeMetadata {
    return $EpisodeMetadataCopyWith<$Res>(_value.episodeMetadata, (value) {
      return _then(_value.copyWith(episodeMetadata: value) as $Val);
    });
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CitySettingsCopyWith<$Res> get citySettings {
    return $CitySettingsCopyWith<$Res>(_value.citySettings, (value) {
      return _then(_value.copyWith(citySettings: value) as $Val);
    });
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharactersInEpisodeCopyWith<$Res> get characters {
    return $CharactersInEpisodeCopyWith<$Res>(_value.characters, (value) {
      return _then(_value.copyWith(characters: value) as $Val);
    });
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VocabularyFocusCopyWith<$Res> get vocabularyFocus {
    return $VocabularyFocusCopyWith<$Res>(_value.vocabularyFocus, (value) {
      return _then(_value.copyWith(vocabularyFocus: value) as $Val);
    });
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VocabularyStoryCopyWith<$Res>? get vocabularyStory {
    if (_value.vocabularyStory == null) {
      return null;
    }

    return $VocabularyStoryCopyWith<$Res>(_value.vocabularyStory!, (value) {
      return _then(_value.copyWith(vocabularyStory: value) as $Val);
    });
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NextEpisodePreviewCopyWith<$Res>? get nextEpisodePreview {
    if (_value.nextEpisodePreview == null) {
      return null;
    }

    return $NextEpisodePreviewCopyWith<$Res>(_value.nextEpisodePreview!, (
      value,
    ) {
      return _then(_value.copyWith(nextEpisodePreview: value) as $Val);
    });
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProgressionCopyWith<$Res> get progression {
    return $ProgressionCopyWith<$Res>(_value.progression, (value) {
      return _then(_value.copyWith(progression: value) as $Val);
    });
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentWrappersCopyWith<$Res> get contentWrappers {
    return $ContentWrappersCopyWith<$Res>(_value.contentWrappers, (value) {
      return _then(_value.copyWith(contentWrappers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EpisodeImplCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$$EpisodeImplCopyWith(
    _$EpisodeImpl value,
    $Res Function(_$EpisodeImpl) then,
  ) = __$$EpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'episode_metadata') EpisodeMetadata episodeMetadata,
    @JsonKey(name: 'city_settings') CitySettings citySettings,
    @JsonKey(name: 'characters') CharactersInEpisode characters,
    @JsonKey(name: 'vocabulary_focus') VocabularyFocus vocabularyFocus,
    @JsonKey(name: 'vocabulary_story') VocabularyStory? vocabularyStory,
    List<Scene> scenes,
    @JsonKey(fromJson: _gamesFromJson) List<dynamic> games,
    @JsonKey(name: 'next_episode_preview')
    NextEpisodePreview? nextEpisodePreview,
    Progression progression,
    @JsonKey(name: 'content_wrappers') ContentWrappers contentWrappers,
  });

  @override
  $EpisodeMetadataCopyWith<$Res> get episodeMetadata;
  @override
  $CitySettingsCopyWith<$Res> get citySettings;
  @override
  $CharactersInEpisodeCopyWith<$Res> get characters;
  @override
  $VocabularyFocusCopyWith<$Res> get vocabularyFocus;
  @override
  $VocabularyStoryCopyWith<$Res>? get vocabularyStory;
  @override
  $NextEpisodePreviewCopyWith<$Res>? get nextEpisodePreview;
  @override
  $ProgressionCopyWith<$Res> get progression;
  @override
  $ContentWrappersCopyWith<$Res> get contentWrappers;
}

/// @nodoc
class __$$EpisodeImplCopyWithImpl<$Res>
    extends _$EpisodeCopyWithImpl<$Res, _$EpisodeImpl>
    implements _$$EpisodeImplCopyWith<$Res> {
  __$$EpisodeImplCopyWithImpl(
    _$EpisodeImpl _value,
    $Res Function(_$EpisodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodeMetadata = null,
    Object? citySettings = null,
    Object? characters = null,
    Object? vocabularyFocus = null,
    Object? vocabularyStory = freezed,
    Object? scenes = null,
    Object? games = null,
    Object? nextEpisodePreview = freezed,
    Object? progression = null,
    Object? contentWrappers = null,
  }) {
    return _then(
      _$EpisodeImpl(
        episodeMetadata: null == episodeMetadata
            ? _value.episodeMetadata
            : episodeMetadata // ignore: cast_nullable_to_non_nullable
                  as EpisodeMetadata,
        citySettings: null == citySettings
            ? _value.citySettings
            : citySettings // ignore: cast_nullable_to_non_nullable
                  as CitySettings,
        characters: null == characters
            ? _value.characters
            : characters // ignore: cast_nullable_to_non_nullable
                  as CharactersInEpisode,
        vocabularyFocus: null == vocabularyFocus
            ? _value.vocabularyFocus
            : vocabularyFocus // ignore: cast_nullable_to_non_nullable
                  as VocabularyFocus,
        vocabularyStory: freezed == vocabularyStory
            ? _value.vocabularyStory
            : vocabularyStory // ignore: cast_nullable_to_non_nullable
                  as VocabularyStory?,
        scenes: null == scenes
            ? _value._scenes
            : scenes // ignore: cast_nullable_to_non_nullable
                  as List<Scene>,
        games: null == games
            ? _value._games
            : games // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        nextEpisodePreview: freezed == nextEpisodePreview
            ? _value.nextEpisodePreview
            : nextEpisodePreview // ignore: cast_nullable_to_non_nullable
                  as NextEpisodePreview?,
        progression: null == progression
            ? _value.progression
            : progression // ignore: cast_nullable_to_non_nullable
                  as Progression,
        contentWrappers: null == contentWrappers
            ? _value.contentWrappers
            : contentWrappers // ignore: cast_nullable_to_non_nullable
                  as ContentWrappers,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeImpl implements _Episode {
  const _$EpisodeImpl({
    @JsonKey(name: 'episode_metadata') required this.episodeMetadata,
    @JsonKey(name: 'city_settings') required this.citySettings,
    @JsonKey(name: 'characters') required this.characters,
    @JsonKey(name: 'vocabulary_focus') required this.vocabularyFocus,
    @JsonKey(name: 'vocabulary_story') this.vocabularyStory,
    final List<Scene> scenes = const [],
    @JsonKey(fromJson: _gamesFromJson) final List<dynamic> games = const [],
    @JsonKey(name: 'next_episode_preview') this.nextEpisodePreview,
    required this.progression,
    @JsonKey(name: 'content_wrappers') required this.contentWrappers,
  }) : _scenes = scenes,
       _games = games;

  factory _$EpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeImplFromJson(json);

  /// Metadatos del episodio
  @override
  @JsonKey(name: 'episode_metadata')
  final EpisodeMetadata episodeMetadata;

  /// Configuración de ciudad
  @override
  @JsonKey(name: 'city_settings')
  final CitySettings citySettings;

  /// Personajes que aparecen en el episodio
  @override
  @JsonKey(name: 'characters')
  final CharactersInEpisode characters;

  /// Foco de vocabulario
  @override
  @JsonKey(name: 'vocabulary_focus')
  final VocabularyFocus vocabularyFocus;

  /// Historia de introducción al vocabulario
  @override
  @JsonKey(name: 'vocabulary_story')
  final VocabularyStory? vocabularyStory;

  /// Escenas de la historia principal
  final List<Scene> _scenes;

  /// Escenas de la historia principal
  @override
  @JsonKey()
  List<Scene> get scenes {
    if (_scenes is EqualUnmodifiableListView) return _scenes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scenes);
  }

  /// Juegos del episodio (mezclados: matching, fill_blank, multiple_choice)
  final List<dynamic> _games;

  /// Juegos del episodio (mezclados: matching, fill_blank, multiple_choice)
  @override
  @JsonKey(fromJson: _gamesFromJson)
  List<dynamic> get games {
    if (_games is EqualUnmodifiableListView) return _games;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_games);
  }

  /// Preview del siguiente episodio (opcional)
  @override
  @JsonKey(name: 'next_episode_preview')
  final NextEpisodePreview? nextEpisodePreview;

  /// Sistema de progresión
  @override
  final Progression progression;

  /// Contenedores de texto (intro, transición, conclusión)
  @override
  @JsonKey(name: 'content_wrappers')
  final ContentWrappers contentWrappers;

  @override
  String toString() {
    return 'Episode(episodeMetadata: $episodeMetadata, citySettings: $citySettings, characters: $characters, vocabularyFocus: $vocabularyFocus, vocabularyStory: $vocabularyStory, scenes: $scenes, games: $games, nextEpisodePreview: $nextEpisodePreview, progression: $progression, contentWrappers: $contentWrappers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeImpl &&
            (identical(other.episodeMetadata, episodeMetadata) ||
                other.episodeMetadata == episodeMetadata) &&
            (identical(other.citySettings, citySettings) ||
                other.citySettings == citySettings) &&
            (identical(other.characters, characters) ||
                other.characters == characters) &&
            (identical(other.vocabularyFocus, vocabularyFocus) ||
                other.vocabularyFocus == vocabularyFocus) &&
            (identical(other.vocabularyStory, vocabularyStory) ||
                other.vocabularyStory == vocabularyStory) &&
            const DeepCollectionEquality().equals(other._scenes, _scenes) &&
            const DeepCollectionEquality().equals(other._games, _games) &&
            (identical(other.nextEpisodePreview, nextEpisodePreview) ||
                other.nextEpisodePreview == nextEpisodePreview) &&
            (identical(other.progression, progression) ||
                other.progression == progression) &&
            (identical(other.contentWrappers, contentWrappers) ||
                other.contentWrappers == contentWrappers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    episodeMetadata,
    citySettings,
    characters,
    vocabularyFocus,
    vocabularyStory,
    const DeepCollectionEquality().hash(_scenes),
    const DeepCollectionEquality().hash(_games),
    nextEpisodePreview,
    progression,
    contentWrappers,
  );

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      __$$EpisodeImplCopyWithImpl<_$EpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeImplToJson(this);
  }
}

abstract class _Episode implements Episode {
  const factory _Episode({
    @JsonKey(name: 'episode_metadata')
    required final EpisodeMetadata episodeMetadata,
    @JsonKey(name: 'city_settings') required final CitySettings citySettings,
    @JsonKey(name: 'characters') required final CharactersInEpisode characters,
    @JsonKey(name: 'vocabulary_focus')
    required final VocabularyFocus vocabularyFocus,
    @JsonKey(name: 'vocabulary_story') final VocabularyStory? vocabularyStory,
    final List<Scene> scenes,
    @JsonKey(fromJson: _gamesFromJson) final List<dynamic> games,
    @JsonKey(name: 'next_episode_preview')
    final NextEpisodePreview? nextEpisodePreview,
    required final Progression progression,
    @JsonKey(name: 'content_wrappers')
    required final ContentWrappers contentWrappers,
  }) = _$EpisodeImpl;

  factory _Episode.fromJson(Map<String, dynamic> json) = _$EpisodeImpl.fromJson;

  /// Metadatos del episodio
  @override
  @JsonKey(name: 'episode_metadata')
  EpisodeMetadata get episodeMetadata;

  /// Configuración de ciudad
  @override
  @JsonKey(name: 'city_settings')
  CitySettings get citySettings;

  /// Personajes que aparecen en el episodio
  @override
  @JsonKey(name: 'characters')
  CharactersInEpisode get characters;

  /// Foco de vocabulario
  @override
  @JsonKey(name: 'vocabulary_focus')
  VocabularyFocus get vocabularyFocus;

  /// Historia de introducción al vocabulario
  @override
  @JsonKey(name: 'vocabulary_story')
  VocabularyStory? get vocabularyStory;

  /// Escenas de la historia principal
  @override
  List<Scene> get scenes;

  /// Juegos del episodio (mezclados: matching, fill_blank, multiple_choice)
  @override
  @JsonKey(fromJson: _gamesFromJson)
  List<dynamic> get games;

  /// Preview del siguiente episodio (opcional)
  @override
  @JsonKey(name: 'next_episode_preview')
  NextEpisodePreview? get nextEpisodePreview;

  /// Sistema de progresión
  @override
  Progression get progression;

  /// Contenedores de texto (intro, transición, conclusión)
  @override
  @JsonKey(name: 'content_wrappers')
  ContentWrappers get contentWrappers;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CharactersInEpisode _$CharactersInEpisodeFromJson(Map<String, dynamic> json) {
  return _CharactersInEpisode.fromJson(json);
}

/// @nodoc
mixin _$CharactersInEpisode {
  /// Lista de personajes que aparecen
  @JsonKey(name: 'appearing_in_episode')
  List<Character> get appearingInEpisode => throw _privateConstructorUsedError;

  /// Serializes this CharactersInEpisode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharactersInEpisode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharactersInEpisodeCopyWith<CharactersInEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharactersInEpisodeCopyWith<$Res> {
  factory $CharactersInEpisodeCopyWith(
    CharactersInEpisode value,
    $Res Function(CharactersInEpisode) then,
  ) = _$CharactersInEpisodeCopyWithImpl<$Res, CharactersInEpisode>;
  @useResult
  $Res call({
    @JsonKey(name: 'appearing_in_episode') List<Character> appearingInEpisode,
  });
}

/// @nodoc
class _$CharactersInEpisodeCopyWithImpl<$Res, $Val extends CharactersInEpisode>
    implements $CharactersInEpisodeCopyWith<$Res> {
  _$CharactersInEpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharactersInEpisode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? appearingInEpisode = null}) {
    return _then(
      _value.copyWith(
            appearingInEpisode: null == appearingInEpisode
                ? _value.appearingInEpisode
                : appearingInEpisode // ignore: cast_nullable_to_non_nullable
                      as List<Character>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CharactersInEpisodeImplCopyWith<$Res>
    implements $CharactersInEpisodeCopyWith<$Res> {
  factory _$$CharactersInEpisodeImplCopyWith(
    _$CharactersInEpisodeImpl value,
    $Res Function(_$CharactersInEpisodeImpl) then,
  ) = __$$CharactersInEpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'appearing_in_episode') List<Character> appearingInEpisode,
  });
}

/// @nodoc
class __$$CharactersInEpisodeImplCopyWithImpl<$Res>
    extends _$CharactersInEpisodeCopyWithImpl<$Res, _$CharactersInEpisodeImpl>
    implements _$$CharactersInEpisodeImplCopyWith<$Res> {
  __$$CharactersInEpisodeImplCopyWithImpl(
    _$CharactersInEpisodeImpl _value,
    $Res Function(_$CharactersInEpisodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CharactersInEpisode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? appearingInEpisode = null}) {
    return _then(
      _$CharactersInEpisodeImpl(
        appearingInEpisode: null == appearingInEpisode
            ? _value._appearingInEpisode
            : appearingInEpisode // ignore: cast_nullable_to_non_nullable
                  as List<Character>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CharactersInEpisodeImpl implements _CharactersInEpisode {
  const _$CharactersInEpisodeImpl({
    @JsonKey(name: 'appearing_in_episode')
    final List<Character> appearingInEpisode = const [],
  }) : _appearingInEpisode = appearingInEpisode;

  factory _$CharactersInEpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharactersInEpisodeImplFromJson(json);

  /// Lista de personajes que aparecen
  final List<Character> _appearingInEpisode;

  /// Lista de personajes que aparecen
  @override
  @JsonKey(name: 'appearing_in_episode')
  List<Character> get appearingInEpisode {
    if (_appearingInEpisode is EqualUnmodifiableListView)
      return _appearingInEpisode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appearingInEpisode);
  }

  @override
  String toString() {
    return 'CharactersInEpisode(appearingInEpisode: $appearingInEpisode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharactersInEpisodeImpl &&
            const DeepCollectionEquality().equals(
              other._appearingInEpisode,
              _appearingInEpisode,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_appearingInEpisode),
  );

  /// Create a copy of CharactersInEpisode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharactersInEpisodeImplCopyWith<_$CharactersInEpisodeImpl> get copyWith =>
      __$$CharactersInEpisodeImplCopyWithImpl<_$CharactersInEpisodeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CharactersInEpisodeImplToJson(this);
  }
}

abstract class _CharactersInEpisode implements CharactersInEpisode {
  const factory _CharactersInEpisode({
    @JsonKey(name: 'appearing_in_episode')
    final List<Character> appearingInEpisode,
  }) = _$CharactersInEpisodeImpl;

  factory _CharactersInEpisode.fromJson(Map<String, dynamic> json) =
      _$CharactersInEpisodeImpl.fromJson;

  /// Lista de personajes que aparecen
  @override
  @JsonKey(name: 'appearing_in_episode')
  List<Character> get appearingInEpisode;

  /// Create a copy of CharactersInEpisode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharactersInEpisodeImplCopyWith<_$CharactersInEpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VocabularyFocus _$VocabularyFocusFromJson(Map<String, dynamic> json) {
  return _VocabularyFocus.fromJson(json);
}

/// @nodoc
mixin _$VocabularyFocus {
  /// Palabras objetivo a aprender
  @JsonKey(name: 'target_words')
  List<VocabularyWord> get targetWords => throw _privateConstructorUsedError;

  /// Frases útiles del episodio
  @JsonKey(name: 'phrases')
  List<VocabularyPhrase> get phrases => throw _privateConstructorUsedError;

  /// Serializes this VocabularyFocus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyFocus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyFocusCopyWith<VocabularyFocus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyFocusCopyWith<$Res> {
  factory $VocabularyFocusCopyWith(
    VocabularyFocus value,
    $Res Function(VocabularyFocus) then,
  ) = _$VocabularyFocusCopyWithImpl<$Res, VocabularyFocus>;
  @useResult
  $Res call({
    @JsonKey(name: 'target_words') List<VocabularyWord> targetWords,
    @JsonKey(name: 'phrases') List<VocabularyPhrase> phrases,
  });
}

/// @nodoc
class _$VocabularyFocusCopyWithImpl<$Res, $Val extends VocabularyFocus>
    implements $VocabularyFocusCopyWith<$Res> {
  _$VocabularyFocusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyFocus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? targetWords = null, Object? phrases = null}) {
    return _then(
      _value.copyWith(
            targetWords: null == targetWords
                ? _value.targetWords
                : targetWords // ignore: cast_nullable_to_non_nullable
                      as List<VocabularyWord>,
            phrases: null == phrases
                ? _value.phrases
                : phrases // ignore: cast_nullable_to_non_nullable
                      as List<VocabularyPhrase>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VocabularyFocusImplCopyWith<$Res>
    implements $VocabularyFocusCopyWith<$Res> {
  factory _$$VocabularyFocusImplCopyWith(
    _$VocabularyFocusImpl value,
    $Res Function(_$VocabularyFocusImpl) then,
  ) = __$$VocabularyFocusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'target_words') List<VocabularyWord> targetWords,
    @JsonKey(name: 'phrases') List<VocabularyPhrase> phrases,
  });
}

/// @nodoc
class __$$VocabularyFocusImplCopyWithImpl<$Res>
    extends _$VocabularyFocusCopyWithImpl<$Res, _$VocabularyFocusImpl>
    implements _$$VocabularyFocusImplCopyWith<$Res> {
  __$$VocabularyFocusImplCopyWithImpl(
    _$VocabularyFocusImpl _value,
    $Res Function(_$VocabularyFocusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VocabularyFocus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? targetWords = null, Object? phrases = null}) {
    return _then(
      _$VocabularyFocusImpl(
        targetWords: null == targetWords
            ? _value._targetWords
            : targetWords // ignore: cast_nullable_to_non_nullable
                  as List<VocabularyWord>,
        phrases: null == phrases
            ? _value._phrases
            : phrases // ignore: cast_nullable_to_non_nullable
                  as List<VocabularyPhrase>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyFocusImpl implements _VocabularyFocus {
  const _$VocabularyFocusImpl({
    @JsonKey(name: 'target_words')
    final List<VocabularyWord> targetWords = const [],
    @JsonKey(name: 'phrases') final List<VocabularyPhrase> phrases = const [],
  }) : _targetWords = targetWords,
       _phrases = phrases;

  factory _$VocabularyFocusImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyFocusImplFromJson(json);

  /// Palabras objetivo a aprender
  final List<VocabularyWord> _targetWords;

  /// Palabras objetivo a aprender
  @override
  @JsonKey(name: 'target_words')
  List<VocabularyWord> get targetWords {
    if (_targetWords is EqualUnmodifiableListView) return _targetWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetWords);
  }

  /// Frases útiles del episodio
  final List<VocabularyPhrase> _phrases;

  /// Frases útiles del episodio
  @override
  @JsonKey(name: 'phrases')
  List<VocabularyPhrase> get phrases {
    if (_phrases is EqualUnmodifiableListView) return _phrases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phrases);
  }

  @override
  String toString() {
    return 'VocabularyFocus(targetWords: $targetWords, phrases: $phrases)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyFocusImpl &&
            const DeepCollectionEquality().equals(
              other._targetWords,
              _targetWords,
            ) &&
            const DeepCollectionEquality().equals(other._phrases, _phrases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_targetWords),
    const DeepCollectionEquality().hash(_phrases),
  );

  /// Create a copy of VocabularyFocus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyFocusImplCopyWith<_$VocabularyFocusImpl> get copyWith =>
      __$$VocabularyFocusImplCopyWithImpl<_$VocabularyFocusImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyFocusImplToJson(this);
  }
}

abstract class _VocabularyFocus implements VocabularyFocus {
  const factory _VocabularyFocus({
    @JsonKey(name: 'target_words') final List<VocabularyWord> targetWords,
    @JsonKey(name: 'phrases') final List<VocabularyPhrase> phrases,
  }) = _$VocabularyFocusImpl;

  factory _VocabularyFocus.fromJson(Map<String, dynamic> json) =
      _$VocabularyFocusImpl.fromJson;

  /// Palabras objetivo a aprender
  @override
  @JsonKey(name: 'target_words')
  List<VocabularyWord> get targetWords;

  /// Frases útiles del episodio
  @override
  @JsonKey(name: 'phrases')
  List<VocabularyPhrase> get phrases;

  /// Create a copy of VocabularyFocus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyFocusImplCopyWith<_$VocabularyFocusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
