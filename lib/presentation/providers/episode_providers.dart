import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/episode/episode.dart';
import '../../data/repositories/episode_repository_impl.dart';

// Provider for the repository instance
final episodeRepositoryProvider = Provider((ref) => EpisodeRepositoryImpl());

// Provider for the list of episodes
final episodeListProvider = FutureProvider<List<Episode>>((ref) async {
  final repository = ref.watch(episodeRepositoryProvider);
  return await repository.getAllEpisodes();
});
