import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:office_app/data/parsers/episode_json_parser.dart';

// Este test verifica que los archivos JSON reales coinciden con nuestros modelos
void main() {
  group('Episode JSON Integration', () {
    test('Can parse episode_a1_01.json', () async {
      // Ajustar path relativo a la raíz del proyecto
      final file = File('assets/episodes/episode_a1_01.json');

      if (!await file.exists()) {
        fail('Asset file not found: ${file.path}');
      }

      final jsonString = await file.readAsString();

      final parser = EpisodeJsonParser();
      final episode = parser.parseFromString(jsonString);

      print('Successfully parsed episode: ${episode.episodeMetadata.title}');

      expect(episode, isNotNull);
      expect(episode.episodeMetadata.episodeNumber, 1);
      expect(episode.scenes.data, isNotEmpty);
      expect(episode.characters.appearingInEpisode, isNotEmpty);
    });
  });
}
