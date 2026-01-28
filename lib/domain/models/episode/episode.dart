import 'package:freezed_annotation/freezed_annotation.dart';
import '../episode/episode_metadata.dart';
import '../episode/city_settings.dart';
import '../episode/character.dart';
import '../vocabulary/vocabulary_word.dart';
import '../vocabulary/vocabulary_phrase.dart';
import '../vocabulary/vocabulary_story.dart';
import '../story/scene.dart';
import '../game/matching_game.dart';
import '../game/fill_blank_game.dart';
import '../game/multiple_choice_game.dart';
import '../game/audio_choice_game.dart';
import '../game/order_sentence_game.dart';
import '../game/typing_game.dart';
import '../game/spot_word_game.dart';
import '../progression/progression.dart';
import '../content_wrappers/content_wrappers.dart';
import '../content_wrappers/next_episode_preview.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

/// Modelo principal del episodio
/// Integra todos los componentes de un episodio completo
@freezed
class Episode with _$Episode {
  const factory Episode({
    /// Metadatos del episodio
    @JsonKey(name: 'episode_metadata') required EpisodeMetadata episodeMetadata,
    
    /// Configuración de ciudad
    @JsonKey(name: 'city_settings') required CitySettings citySettings,
    
    /// Personajes que aparecen en el episodio
    @JsonKey(name: 'characters') required CharactersInEpisode characters,
    
    /// Foco de vocabulario
    @JsonKey(name: 'vocabulary_focus') required VocabularyFocus vocabularyFocus,
    
    /// Historia de introducción al vocabulario
    @JsonKey(name: 'vocabulary_story') VocabularyStory? vocabularyStory,
    
    /// Escenas de la historia principal
    @JsonKey(name: 'scenes') required ScenesSection scenes,
    
    /// Juegos del episodio (mezclados: matching, fill_blank, multiple_choice)
    @JsonKey(name: 'games') required GamesSection games,
    
    /// Preview del siguiente episodio (opcional)
    @JsonKey(name: 'next_episode_preview') NextEpisodePreview? nextEpisodePreview,
    
    /// Sistema de progresión
    required Progression progression,
    
    /// Contenedores de texto (intro, transición, conclusión)
    @JsonKey(name: 'content_wrappers') required ContentWrappers contentWrappers,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}

/// Sección de escenas con metadata
@freezed
class ScenesSection with _$ScenesSection {
  const factory ScenesSection({
    /// Nombre corto de la sección (máximo 3 palabras)
    @JsonKey(name: 'section_name') String? sectionName,

    /// Nombre corto en español
    @JsonKey(name: 'section_name_es') String? sectionNameEs,

    /// Imagen representativa de la sección
    String? image,

    /// Lista de escenas
    @JsonKey(name: 'data') @Default([]) List<Scene> data,
  }) = _ScenesSection;

  factory ScenesSection.fromJson(Map<String, dynamic> json) =>
      _$ScenesSectionFromJson(json);
}

/// Sección de juegos con metadata
@freezed
class GamesSection with _$GamesSection {
  const factory GamesSection({
    /// Nombre corto de la sección (máximo 3 palabras)
    @JsonKey(name: 'section_name') String? sectionName,

    /// Nombre corto en español
    @JsonKey(name: 'section_name_es') String? sectionNameEs,

    /// Imagen representativa de la sección
    String? image,

    /// Lista de juegos
    @JsonKey(name: 'data', fromJson: _gamesFromJson) @Default([]) List<dynamic> data,
  }) = _GamesSection;

  factory GamesSection.fromJson(Map<String, dynamic> json) =>
      _$GamesSectionFromJson(json);
}

/// Personajes en el episodio
@freezed
class CharactersInEpisode with _$CharactersInEpisode {
  const factory CharactersInEpisode({
    /// Lista de personajes que aparecen
    @JsonKey(name: 'appearing_in_episode') @Default([]) List<Character> appearingInEpisode,
  }) = _CharactersInEpisode;

  factory CharactersInEpisode.fromJson(Map<String, dynamic> json) =>
      _$CharactersInEpisodeFromJson(json);
}

/// Foco de vocabulario del episodio
@freezed
class VocabularyFocus with _$VocabularyFocus {
  const factory VocabularyFocus({
    /// Palabras objetivo a aprender
    @JsonKey(name: 'target_words') @Default([]) List<VocabularyWord> targetWords,
    
    /// Frases útiles del episodio
    @JsonKey(name: 'phrases') @Default([]) List<VocabularyPhrase> phrases,
  }) = _VocabularyFocus;

  factory VocabularyFocus.fromJson(Map<String, dynamic> json) =>
      _$VocabularyFocusFromJson(json);
}

/// Helper para parsear juegos de diferentes tipos
List<dynamic> _gamesFromJson(List<dynamic> json) {
  return json.map((gameJson) {
    final gameType = gameJson['game_type'] as String;
    switch (gameType) {
      case 'matching':
        return MatchingGame.fromJson(gameJson as Map<String, dynamic>);
      case 'fill_blank':
        return FillBlankGame.fromJson(gameJson as Map<String, dynamic>);
      case 'multiple_choice':
        return MultipleChoiceGame.fromJson(gameJson as Map<String, dynamic>);
      case 'audio_choice':
        return AudioChoiceGame.fromJson(gameJson as Map<String, dynamic>);
      case 'order_sentence':
        return OrderSentenceGame.fromJson(gameJson as Map<String, dynamic>);
      case 'typing':
        return TypingGame.fromJson(gameJson as Map<String, dynamic>);
      case 'spot_word':
        return SpotWordGame.fromJson(gameJson as Map<String, dynamic>);
      default:
        throw Exception('Unknown game type: $gameType');
    }
  }).toList();
}
