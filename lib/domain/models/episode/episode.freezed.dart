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
  @JsonKey(name: 'scenes')
  ScenesSection get scenes => throw _privateConstructorUsedError;

  /// Juegos del episodio (mezclados: matching, fill_blank, multiple_choice)
  @JsonKey(name: 'games')
  GamesSection get games => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'scenes') ScenesSection scenes,
    @JsonKey(name: 'games') GamesSection games,
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
  $ScenesSectionCopyWith<$Res> get scenes;
  $GamesSectionCopyWith<$Res> get games;
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
                      as ScenesSection,
            games: null == games
                ? _value.games
                : games // ignore: cast_nullable_to_non_nullable
                      as GamesSection,
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
  $ScenesSectionCopyWith<$Res> get scenes {
    return $ScenesSectionCopyWith<$Res>(_value.scenes, (value) {
      return _then(_value.copyWith(scenes: value) as $Val);
    });
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GamesSectionCopyWith<$Res> get games {
    return $GamesSectionCopyWith<$Res>(_value.games, (value) {
      return _then(_value.copyWith(games: value) as $Val);
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
    @JsonKey(name: 'scenes') ScenesSection scenes,
    @JsonKey(name: 'games') GamesSection games,
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
  $ScenesSectionCopyWith<$Res> get scenes;
  @override
  $GamesSectionCopyWith<$Res> get games;
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
            ? _value.scenes
            : scenes // ignore: cast_nullable_to_non_nullable
                  as ScenesSection,
        games: null == games
            ? _value.games
            : games // ignore: cast_nullable_to_non_nullable
                  as GamesSection,
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
    @JsonKey(name: 'scenes') required this.scenes,
    @JsonKey(name: 'games') required this.games,
    @JsonKey(name: 'next_episode_preview') this.nextEpisodePreview,
    required this.progression,
    @JsonKey(name: 'content_wrappers') required this.contentWrappers,
  });

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
  @override
  @JsonKey(name: 'scenes')
  final ScenesSection scenes;

  /// Juegos del episodio (mezclados: matching, fill_blank, multiple_choice)
  @override
  @JsonKey(name: 'games')
  final GamesSection games;

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
            (identical(other.scenes, scenes) || other.scenes == scenes) &&
            (identical(other.games, games) || other.games == games) &&
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
    scenes,
    games,
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
    @JsonKey(name: 'scenes') required final ScenesSection scenes,
    @JsonKey(name: 'games') required final GamesSection games,
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
  @JsonKey(name: 'scenes')
  ScenesSection get scenes;

  /// Juegos del episodio (mezclados: matching, fill_blank, multiple_choice)
  @override
  @JsonKey(name: 'games')
  GamesSection get games;

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

ScenesSection _$ScenesSectionFromJson(Map<String, dynamic> json) {
  return _ScenesSection.fromJson(json);
}

/// @nodoc
mixin _$ScenesSection {
  /// Nombre corto de la sección (máximo 3 palabras)
  @JsonKey(name: 'section_name')
  String? get sectionName => throw _privateConstructorUsedError;

  /// Nombre corto en español
  @JsonKey(name: 'section_name_es')
  String? get sectionNameEs => throw _privateConstructorUsedError;

  /// Imagen representativa de la sección
  String? get image => throw _privateConstructorUsedError;

  /// Lista de escenas
  @JsonKey(name: 'data')
  List<Scene> get data => throw _privateConstructorUsedError;

  /// Serializes this ScenesSection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScenesSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScenesSectionCopyWith<ScenesSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenesSectionCopyWith<$Res> {
  factory $ScenesSectionCopyWith(
    ScenesSection value,
    $Res Function(ScenesSection) then,
  ) = _$ScenesSectionCopyWithImpl<$Res, ScenesSection>;
  @useResult
  $Res call({
    @JsonKey(name: 'section_name') String? sectionName,
    @JsonKey(name: 'section_name_es') String? sectionNameEs,
    String? image,
    @JsonKey(name: 'data') List<Scene> data,
  });
}

/// @nodoc
class _$ScenesSectionCopyWithImpl<$Res, $Val extends ScenesSection>
    implements $ScenesSectionCopyWith<$Res> {
  _$ScenesSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScenesSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionName = freezed,
    Object? sectionNameEs = freezed,
    Object? image = freezed,
    Object? data = null,
  }) {
    return _then(
      _value.copyWith(
            sectionName: freezed == sectionName
                ? _value.sectionName
                : sectionName // ignore: cast_nullable_to_non_nullable
                      as String?,
            sectionNameEs: freezed == sectionNameEs
                ? _value.sectionNameEs
                : sectionNameEs // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<Scene>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScenesSectionImplCopyWith<$Res>
    implements $ScenesSectionCopyWith<$Res> {
  factory _$$ScenesSectionImplCopyWith(
    _$ScenesSectionImpl value,
    $Res Function(_$ScenesSectionImpl) then,
  ) = __$$ScenesSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'section_name') String? sectionName,
    @JsonKey(name: 'section_name_es') String? sectionNameEs,
    String? image,
    @JsonKey(name: 'data') List<Scene> data,
  });
}

/// @nodoc
class __$$ScenesSectionImplCopyWithImpl<$Res>
    extends _$ScenesSectionCopyWithImpl<$Res, _$ScenesSectionImpl>
    implements _$$ScenesSectionImplCopyWith<$Res> {
  __$$ScenesSectionImplCopyWithImpl(
    _$ScenesSectionImpl _value,
    $Res Function(_$ScenesSectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScenesSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionName = freezed,
    Object? sectionNameEs = freezed,
    Object? image = freezed,
    Object? data = null,
  }) {
    return _then(
      _$ScenesSectionImpl(
        sectionName: freezed == sectionName
            ? _value.sectionName
            : sectionName // ignore: cast_nullable_to_non_nullable
                  as String?,
        sectionNameEs: freezed == sectionNameEs
            ? _value.sectionNameEs
            : sectionNameEs // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<Scene>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenesSectionImpl implements _ScenesSection {
  const _$ScenesSectionImpl({
    @JsonKey(name: 'section_name') this.sectionName,
    @JsonKey(name: 'section_name_es') this.sectionNameEs,
    this.image,
    @JsonKey(name: 'data') final List<Scene> data = const [],
  }) : _data = data;

  factory _$ScenesSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenesSectionImplFromJson(json);

  /// Nombre corto de la sección (máximo 3 palabras)
  @override
  @JsonKey(name: 'section_name')
  final String? sectionName;

  /// Nombre corto en español
  @override
  @JsonKey(name: 'section_name_es')
  final String? sectionNameEs;

  /// Imagen representativa de la sección
  @override
  final String? image;

  /// Lista de escenas
  final List<Scene> _data;

  /// Lista de escenas
  @override
  @JsonKey(name: 'data')
  List<Scene> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ScenesSection(sectionName: $sectionName, sectionNameEs: $sectionNameEs, image: $image, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScenesSectionImpl &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.sectionNameEs, sectionNameEs) ||
                other.sectionNameEs == sectionNameEs) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sectionName,
    sectionNameEs,
    image,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of ScenesSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenesSectionImplCopyWith<_$ScenesSectionImpl> get copyWith =>
      __$$ScenesSectionImplCopyWithImpl<_$ScenesSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenesSectionImplToJson(this);
  }
}

abstract class _ScenesSection implements ScenesSection {
  const factory _ScenesSection({
    @JsonKey(name: 'section_name') final String? sectionName,
    @JsonKey(name: 'section_name_es') final String? sectionNameEs,
    final String? image,
    @JsonKey(name: 'data') final List<Scene> data,
  }) = _$ScenesSectionImpl;

  factory _ScenesSection.fromJson(Map<String, dynamic> json) =
      _$ScenesSectionImpl.fromJson;

  /// Nombre corto de la sección (máximo 3 palabras)
  @override
  @JsonKey(name: 'section_name')
  String? get sectionName;

  /// Nombre corto en español
  @override
  @JsonKey(name: 'section_name_es')
  String? get sectionNameEs;

  /// Imagen representativa de la sección
  @override
  String? get image;

  /// Lista de escenas
  @override
  @JsonKey(name: 'data')
  List<Scene> get data;

  /// Create a copy of ScenesSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScenesSectionImplCopyWith<_$ScenesSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GamesSection _$GamesSectionFromJson(Map<String, dynamic> json) {
  return _GamesSection.fromJson(json);
}

/// @nodoc
mixin _$GamesSection {
  /// Nombre corto de la sección (máximo 3 palabras)
  @JsonKey(name: 'section_name')
  String? get sectionName => throw _privateConstructorUsedError;

  /// Nombre corto en español
  @JsonKey(name: 'section_name_es')
  String? get sectionNameEs => throw _privateConstructorUsedError;

  /// Imagen representativa de la sección
  String? get image => throw _privateConstructorUsedError;

  /// Lista de juegos
  @JsonKey(name: 'data', fromJson: _gamesFromJson)
  List<dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this GamesSection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GamesSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GamesSectionCopyWith<GamesSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamesSectionCopyWith<$Res> {
  factory $GamesSectionCopyWith(
    GamesSection value,
    $Res Function(GamesSection) then,
  ) = _$GamesSectionCopyWithImpl<$Res, GamesSection>;
  @useResult
  $Res call({
    @JsonKey(name: 'section_name') String? sectionName,
    @JsonKey(name: 'section_name_es') String? sectionNameEs,
    String? image,
    @JsonKey(name: 'data', fromJson: _gamesFromJson) List<dynamic> data,
  });
}

/// @nodoc
class _$GamesSectionCopyWithImpl<$Res, $Val extends GamesSection>
    implements $GamesSectionCopyWith<$Res> {
  _$GamesSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GamesSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionName = freezed,
    Object? sectionNameEs = freezed,
    Object? image = freezed,
    Object? data = null,
  }) {
    return _then(
      _value.copyWith(
            sectionName: freezed == sectionName
                ? _value.sectionName
                : sectionName // ignore: cast_nullable_to_non_nullable
                      as String?,
            sectionNameEs: freezed == sectionNameEs
                ? _value.sectionNameEs
                : sectionNameEs // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GamesSectionImplCopyWith<$Res>
    implements $GamesSectionCopyWith<$Res> {
  factory _$$GamesSectionImplCopyWith(
    _$GamesSectionImpl value,
    $Res Function(_$GamesSectionImpl) then,
  ) = __$$GamesSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'section_name') String? sectionName,
    @JsonKey(name: 'section_name_es') String? sectionNameEs,
    String? image,
    @JsonKey(name: 'data', fromJson: _gamesFromJson) List<dynamic> data,
  });
}

/// @nodoc
class __$$GamesSectionImplCopyWithImpl<$Res>
    extends _$GamesSectionCopyWithImpl<$Res, _$GamesSectionImpl>
    implements _$$GamesSectionImplCopyWith<$Res> {
  __$$GamesSectionImplCopyWithImpl(
    _$GamesSectionImpl _value,
    $Res Function(_$GamesSectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GamesSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionName = freezed,
    Object? sectionNameEs = freezed,
    Object? image = freezed,
    Object? data = null,
  }) {
    return _then(
      _$GamesSectionImpl(
        sectionName: freezed == sectionName
            ? _value.sectionName
            : sectionName // ignore: cast_nullable_to_non_nullable
                  as String?,
        sectionNameEs: freezed == sectionNameEs
            ? _value.sectionNameEs
            : sectionNameEs // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GamesSectionImpl implements _GamesSection {
  const _$GamesSectionImpl({
    @JsonKey(name: 'section_name') this.sectionName,
    @JsonKey(name: 'section_name_es') this.sectionNameEs,
    this.image,
    @JsonKey(name: 'data', fromJson: _gamesFromJson)
    final List<dynamic> data = const [],
  }) : _data = data;

  factory _$GamesSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$GamesSectionImplFromJson(json);

  /// Nombre corto de la sección (máximo 3 palabras)
  @override
  @JsonKey(name: 'section_name')
  final String? sectionName;

  /// Nombre corto en español
  @override
  @JsonKey(name: 'section_name_es')
  final String? sectionNameEs;

  /// Imagen representativa de la sección
  @override
  final String? image;

  /// Lista de juegos
  final List<dynamic> _data;

  /// Lista de juegos
  @override
  @JsonKey(name: 'data', fromJson: _gamesFromJson)
  List<dynamic> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GamesSection(sectionName: $sectionName, sectionNameEs: $sectionNameEs, image: $image, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GamesSectionImpl &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.sectionNameEs, sectionNameEs) ||
                other.sectionNameEs == sectionNameEs) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sectionName,
    sectionNameEs,
    image,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of GamesSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GamesSectionImplCopyWith<_$GamesSectionImpl> get copyWith =>
      __$$GamesSectionImplCopyWithImpl<_$GamesSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GamesSectionImplToJson(this);
  }
}

abstract class _GamesSection implements GamesSection {
  const factory _GamesSection({
    @JsonKey(name: 'section_name') final String? sectionName,
    @JsonKey(name: 'section_name_es') final String? sectionNameEs,
    final String? image,
    @JsonKey(name: 'data', fromJson: _gamesFromJson) final List<dynamic> data,
  }) = _$GamesSectionImpl;

  factory _GamesSection.fromJson(Map<String, dynamic> json) =
      _$GamesSectionImpl.fromJson;

  /// Nombre corto de la sección (máximo 3 palabras)
  @override
  @JsonKey(name: 'section_name')
  String? get sectionName;

  /// Nombre corto en español
  @override
  @JsonKey(name: 'section_name_es')
  String? get sectionNameEs;

  /// Imagen representativa de la sección
  @override
  String? get image;

  /// Lista de juegos
  @override
  @JsonKey(name: 'data', fromJson: _gamesFromJson)
  List<dynamic> get data;

  /// Create a copy of GamesSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GamesSectionImplCopyWith<_$GamesSectionImpl> get copyWith =>
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
