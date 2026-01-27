import 'package:flutter_test/flutter_test.dart';
import 'package:office_app/data/repositories/episode_repository_impl.dart';
import 'package:office_app/data/sources/local_episode_source.dart';
import 'package:office_app/domain/models/episode/episode.dart';
import 'package:office_app/domain/models/episode/episode_metadata.dart';
import 'package:office_app/domain/models/episode/city_settings.dart';
import 'package:office_app/domain/models/progression/progression.dart';
import 'package:office_app/domain/models/content_wrappers/content_wrappers.dart';

class FakeLocalEpisodeSource implements LocalEpisodeSource {
  final Map<int, Episode> _episodes = {};

  void addEpisode(Episode episode) {
    _episodes[episode.episodeMetadata.episodeNumber] = episode;
  }

  @override
  Future<Episode> loadEpisodeByNumber(int number) async {
    if (_episodes.containsKey(number)) {
      return _episodes[number]!;
    }
    throw EpisodeLoadException('Not found');
  }

  @override
  Future<Episode> loadEpisodeById(String id) async {
    try {
      return _episodes.values.firstWhere(
        (e) => e.episodeMetadata.episodeId == id,
      );
    } catch (_) {
      throw EpisodeLoadException('Not found');
    }
  }

  @override
  Future<List<Episode>> loadAllEpisodes() async {
    return _episodes.values.toList();
  }

  @override
  Future<List<Episode>> loadEpisodesByLevel(String level) async {
    if (level == 'A1') return _episodes.values.toList();
    throw EpisodeLoadException('Only A1 supported');
  }

  @override
  Future<bool> isEpisodeAvailable(int number) async {
    return _episodes.containsKey(number);
  }

  @override
  Future<int> getTotalEpisodesCount() async {
    return 30;
  }
}

void main() {
  late EpisodeRepositoryImpl repository;
  late FakeLocalEpisodeSource fakeSource;

  setUp(() {
    fakeSource = FakeLocalEpisodeSource();
    repository = EpisodeRepositoryImpl(source: fakeSource);
  });

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
      scenes: [],
      games: [],
      contentWrappers: const ContentWrappers(
        introText: BilingualText(en: 'Intro', es: 'Intro ES'),
        transition: BilingualText(en: 'Transition', es: 'Transicion ES'),
        conclusion: BilingualText(en: 'Conclusion', es: 'Conclusion ES'),
      ),
      progression: const Progression(xpEarnedBase: 100),
    );
  }

  group('EpisodeRepositoryImpl', () {
    test('getEpisodeByNumber returns episode when found', () async {
      final episode = createEpisode(1, 'ep_1');
      fakeSource.addEpisode(episode);

      final result = await repository.getEpisodeByNumber(1);

      expect(result, isNotNull);
      expect(result!.episodeMetadata.episodeNumber, 1);
    });

    test('getEpisodeByNumber returns null when not found', () async {
      final result = await repository.getEpisodeByNumber(99);
      expect(result, isNull);
    });

    test('getEpisodeById returns episode when found', () async {
      final episode = createEpisode(1, 'ep_1');
      fakeSource.addEpisode(episode);

      final result = await repository.getEpisodeById('ep_1');
      expect(result, isNotNull);
      expect(result!.episodeMetadata.episodeId, 'ep_1');
    });

    test('getAllEpisodes returns all added episodes', () async {
      fakeSource.addEpisode(createEpisode(1, 'ep_1'));
      fakeSource.addEpisode(createEpisode(2, 'ep_2'));

      final result = await repository.getAllEpisodes();
      expect(result.length, 2);
    });
  });
}
