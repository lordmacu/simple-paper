import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/progress/user_progress.dart';
import '../../data/repositories/progress_repository_impl.dart';
import '../../domain/repositories/i_progress_repository.dart';

/// Provider para SharedPreferences
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

/// Provider para el repositorio de progreso
final progressRepositoryProvider = Provider<IProgressRepository>((ref) {
  final prefsAsync = ref.watch(sharedPreferencesProvider);
  
  return prefsAsync.when(
    data: (prefs) => ProgressRepositoryImpl(prefs),
    loading: () => throw Exception('SharedPreferences not ready'),
    error: (err, stack) => throw Exception('Error loading SharedPreferences: $err'),
  );
});

/// Provider para el progreso del usuario
final userProgressProvider = FutureProvider<UserProgress>((ref) async {
  final repository = ref.watch(progressRepositoryProvider);
  return await repository.getUserProgress();
});

/// Provider para verificar si un episodio está desbloqueado
final isEpisodeUnlockedProvider = FutureProvider.family<bool, int>((ref, episodeNumber) async {
  final repository = ref.watch(progressRepositoryProvider);
  return await repository.isEpisodeUnlocked(episodeNumber);
});

/// Provider para obtener el progreso de un episodio específico
final episodeProgressProvider = FutureProvider.family<EpisodeProgress?, int>((ref, episodeNumber) async {
  final repository = ref.watch(progressRepositoryProvider);
  return await repository.getEpisodeProgress(episodeNumber);
});

/// Provider para completar un episodio
final completeEpisodeProvider = Provider<Future<void> Function({
  required int episodeNumber,
  required int starsEarned,
  required int xpEarned,
})>((ref) {
  return ({
    required int episodeNumber,
    required int starsEarned,
    required int xpEarned,
  }) async {
    final repository = ref.read(progressRepositoryProvider);
    await repository.completeEpisode(
      episodeNumber: episodeNumber,
      starsEarned: starsEarned,
      xpEarned: xpEarned,
    );
    // Invalidar providers para refrescar UI
    ref.invalidate(userProgressProvider);
  };
});
