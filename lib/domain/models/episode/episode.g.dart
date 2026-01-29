// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      episodeMetadata: EpisodeMetadata.fromJson(
        json['episode_metadata'] as Map<String, dynamic>,
      ),
      citySettings: CitySettings.fromJson(
        json['city_settings'] as Map<String, dynamic>,
      ),
      characters: CharactersInEpisode.fromJson(
        json['characters'] as Map<String, dynamic>,
      ),
      vocabularyFocus: VocabularyFocus.fromJson(
        json['vocabulary_focus'] as Map<String, dynamic>,
      ),
      vocabularyStory: json['vocabulary_story'] == null
          ? null
          : VocabularyStory.fromJson(
              json['vocabulary_story'] as Map<String, dynamic>,
            ),
      listeningShadowing: json['listening_shadowing'] == null
          ? null
          : ListeningShadowingSection.fromJson(
              json['listening_shadowing'] as Map<String, dynamic>,
            ),
      scenes: ScenesSection.fromJson(json['scenes'] as Map<String, dynamic>),
      games: GamesSection.fromJson(json['games'] as Map<String, dynamic>),
      nextEpisodePreview: json['next_episode_preview'] == null
          ? null
          : NextEpisodePreview.fromJson(
              json['next_episode_preview'] as Map<String, dynamic>,
            ),
      progression: Progression.fromJson(
        json['progression'] as Map<String, dynamic>,
      ),
      contentWrappers: ContentWrappers.fromJson(
        json['content_wrappers'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'episode_metadata': instance.episodeMetadata,
      'city_settings': instance.citySettings,
      'characters': instance.characters,
      'vocabulary_focus': instance.vocabularyFocus,
      'vocabulary_story': instance.vocabularyStory,
      'listening_shadowing': instance.listeningShadowing,
      'scenes': instance.scenes,
      'games': instance.games,
      'next_episode_preview': instance.nextEpisodePreview,
      'progression': instance.progression,
      'content_wrappers': instance.contentWrappers,
    };

_$ScenesSectionImpl _$$ScenesSectionImplFromJson(Map<String, dynamic> json) =>
    _$ScenesSectionImpl(
      sectionName: json['section_name'] as String?,
      sectionNameEs: json['section_name_es'] as String?,
      image: json['image'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Scene.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ScenesSectionImplToJson(_$ScenesSectionImpl instance) =>
    <String, dynamic>{
      'section_name': instance.sectionName,
      'section_name_es': instance.sectionNameEs,
      'image': instance.image,
      'data': instance.data,
    };

_$GamesSectionImpl _$$GamesSectionImplFromJson(Map<String, dynamic> json) =>
    _$GamesSectionImpl(
      sectionName: json['section_name'] as String?,
      sectionNameEs: json['section_name_es'] as String?,
      image: json['image'] as String?,
      data: json['data'] == null
          ? const []
          : _gamesFromJson(json['data'] as List),
    );

Map<String, dynamic> _$$GamesSectionImplToJson(_$GamesSectionImpl instance) =>
    <String, dynamic>{
      'section_name': instance.sectionName,
      'section_name_es': instance.sectionNameEs,
      'image': instance.image,
      'data': instance.data,
    };

_$CharactersInEpisodeImpl _$$CharactersInEpisodeImplFromJson(
  Map<String, dynamic> json,
) => _$CharactersInEpisodeImpl(
  appearingInEpisode:
      (json['appearing_in_episode'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CharactersInEpisodeImplToJson(
  _$CharactersInEpisodeImpl instance,
) => <String, dynamic>{'appearing_in_episode': instance.appearingInEpisode};

_$VocabularyFocusImpl _$$VocabularyFocusImplFromJson(
  Map<String, dynamic> json,
) => _$VocabularyFocusImpl(
  targetWords:
      (json['target_words'] as List<dynamic>?)
          ?.map((e) => VocabularyWord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  phrases:
      (json['phrases'] as List<dynamic>?)
          ?.map((e) => VocabularyPhrase.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$VocabularyFocusImplToJson(
  _$VocabularyFocusImpl instance,
) => <String, dynamic>{
  'target_words': instance.targetWords,
  'phrases': instance.phrases,
};
