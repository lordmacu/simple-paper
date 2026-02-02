import 'package:flutter_test/flutter_test.dart';
import 'package:office_app/domain/models/episode/episode.dart';
import 'package:office_app/domain/models/episode/episode_metadata.dart';
import 'package:office_app/domain/models/episode/city_settings.dart';
import 'package:office_app/domain/models/progression/progression.dart';
import 'package:office_app/domain/models/content_wrappers/content_wrappers.dart';

void main() {
  Episode createEpisode(int number, String id) {
    return Episode(
      episodeMetadata: EpisodeMetadata(
        episodeId: id,
        episodeNumber: number,
        title: 'Title $number',
        titleEs: 'Titulo $number',
        internalLevel: 'A1',
        description: 'Desc',
        descriptionEs: 'Desc ES',
        estimatedTimeMinutes: 10,
        tags: [],
      ),
      citySettings: const CitySettings(
        defaultCity: 'Scranton',
        citySpecificContent: CitySpecificContent(
          officeName: 'Dunder Mifflin',
          defaultCompanyName: 'Dunder Mifflin',
          officeType: 'Paper Company',
          officeTypeEs: 'Compañía de Papel',
        ),
      ),
      characters: const CharactersInEpisode(appearingInEpisode: []),
      vocabularyFocus: const VocabularyFocus(
        targetWords: [],
        phrases: [],
      ),
      scenes: const ScenesSection(data: []),
      games: const GamesSection(data: []),
      contentWrappers: const ContentWrappers(
        introText: BilingualText(en: 'Intro', es: 'Intro ES'),
        transition: BilingualText(en: 'Transition', es: 'Transicion ES'),
        conclusion: BilingualText(en: 'Conclusion', es: 'Conclusion ES'),
      ),
      progression: const Progression(xpEarnedBase: 100),
    );
  }

  group('Episode Model', () {
    test('creates episode with correct metadata', () {
      final episode = createEpisode(1, 'ep_1');

      expect(episode.episodeMetadata.episodeNumber, 1);
      expect(episode.episodeMetadata.episodeId, 'ep_1');
      expect(episode.episodeMetadata.title, 'Title 1');
    });

    test('episode serialization to JSON works', () {
      final episode = createEpisode(1, 'ep_1');
      final json = episode.toJson();

      expect(json['episode_metadata']['episode_number'], 1);
      expect(json['episode_metadata']['episode_id'], 'ep_1');
    });

    test('episode deserialization from JSON works', () {
      final original = createEpisode(2, 'ep_2');
      final json = original.toJson();
      final restored = Episode.fromJson(json);

      expect(restored.episodeMetadata.episodeNumber, 2);
      expect(restored.episodeMetadata.episodeId, 'ep_2');
      expect(restored.episodeMetadata.title, original.episodeMetadata.title);
    });

    test('city settings are preserved', () {
      final episode = createEpisode(1, 'ep_1');

      expect(episode.citySettings.defaultCity, 'Scranton');
      expect(
        episode.citySettings.citySpecificContent.officeName,
        'Dunder Mifflin',
      );
    });
  });
}
