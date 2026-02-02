import '../../domain/models/episode/episode.dart';

/// IDs de secciones de progreso para episodios.
///
/// Define constantes y métodos para identificar secciones del episodio.
class SectionProgressIds {
  /// ID de la sección de historia.
  static const String story = 'story';

  /// ID de la sección de vocabulario.
  static const String vocab = 'vocab';

  /// ID de la sección de mini historia.
  static const String miniStory = 'mini_story';

  /// ID de la sección de listening/shadowing.
  static const String listeningShadowing = 'listening_shadowing';

  /// ID de la sección de entrevista.
  static const String interview = 'interview';

  /// ID de la sección de juegos.
  static const String games = 'games';

  /// Genera ID para una escena específica.
  static String sceneId(int number) => 'scene_$number';

  /// Genera ID para un juego específico.
  static String gameId(int number) => 'game_$number';

  /// Construye lista ordenada de IDs de secciones para un episodio.
  static List<String> buildOrderedIds(Episode episode) {
    final ids = <String>[vocab];
    if (episode.miniStory != null &&
        episode.miniStory!.paragraphs.isNotEmpty) {
      ids.add(miniStory);
    }
    final listening = episode.listeningShadowing;
    if (listening != null && listening.data.isNotEmpty) {
      ids.add(listeningShadowing);
    }
    ids.add(story);

    for (final scene in episode.scenes.data) {
      ids.add(sceneId(scene.sceneNumber));
    }
    ids.add(games);

    for (var i = 0; i < episode.games.data.length; i++) {
      ids.add(gameId(i + 1));
    }

    return ids;
  }
}
