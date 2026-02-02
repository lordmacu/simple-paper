import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/episode/episode.dart';
import '../../data/repositories/episode_repository_impl.dart';
import '../../data/sources/content_db.dart';

/// Provider del repositorio de episodios.
final episodeRepositoryProvider = Provider((ref) => EpisodeRepositoryImpl());

/// Provider de la lista de episodios.
final episodeListProvider = FutureProvider<List<Episode>>((ref) async {
  final repository = ref.watch(episodeRepositoryProvider);
  return await repository.getAllEpisodes();
});

/// Indica si hay entrevista disponible para un episodio.
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
