import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/episode/episode.dart';
import '../../data/repositories/episode_repository_impl.dart';
import '../../data/sources/content_db.dart';

// Provider for the repository instance
final episodeRepositoryProvider = Provider((ref) => EpisodeRepositoryImpl());

// Provider for the list of episodes
final episodeListProvider = FutureProvider<List<Episode>>((ref) async {
  final repository = ref.watch(episodeRepositoryProvider);
  return await repository.getAllEpisodes();
});

final interviewAvailableProvider =
    FutureProvider.family<bool, int>((ref, episodeNumber) async {
  final db = ContentDb();
  return db.hasInterviewForEpisode(episodeNumber);
});

/// Indica si hay episodios cargados en la DB
final hasEpisodesProvider = FutureProvider<bool>((ref) async {
  final db = ContentDb();
  final count = await db.getEpisodeCount();
  return count > 0;
});
