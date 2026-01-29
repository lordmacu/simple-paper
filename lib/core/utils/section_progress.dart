import '../../domain/models/episode/episode.dart';

class SectionProgressIds {
  static const String story = 'story';
  static const String vocab = 'vocab';
  static const String listeningShadowing = 'listening_shadowing';
  static const String games = 'games';

  static String sceneId(int number) => 'scene_$number';
  static String gameId(int number) => 'game_$number';

  static List<String> buildOrderedIds(Episode episode) {
    final ids = <String>[vocab];
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
