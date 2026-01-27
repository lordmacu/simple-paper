import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/progress/user_progress.dart';
import '../../domain/repositories/i_progress_repository.dart';

/// Implementación del repositorio de progreso usando SharedPreferences
class ProgressRepositoryImpl implements IProgressRepository {
  static const String _progressKey = 'user_progress';
  final SharedPreferences _prefs;

  ProgressRepositoryImpl(this._prefs);

  // Nuevos métodos para UserProgress
  Future<UserProgress> getUserProgress() async {
    final jsonString = _prefs.getString(_progressKey);
    if (jsonString == null) {
      // Retornar progreso inicial (episodio 1 desbloqueado)
      return const UserProgress(lastUnlockedEpisode: 1);
    }
    
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return UserProgress.fromJson(json);
  }

  Future<void> saveUserProgress(UserProgress progress) async {
    final jsonString = jsonEncode(progress.toJson());
    await _prefs.setString(_progressKey, jsonString);
  }

  Future<void> completeEpisode({
    required int episodeNumber,
    required int starsEarned,
    required int xpEarned,
  }) async {
    final currentProgress = await getUserProgress();
    
    final episodeProgress = EpisodeProgress(
      episodeNumber: episodeNumber,
      isCompleted: true,
      starsEarned: starsEarned,
      xpEarned: xpEarned,
      completedAt: DateTime.now(),
    );
    
    final updatedCompletedEpisodes = Map<int, EpisodeProgress>.from(
      currentProgress.completedEpisodes,
    );
    updatedCompletedEpisodes[episodeNumber] = episodeProgress;
    
    // Desbloquear siguiente episodio si no está desbloqueado
    final nextEpisode = episodeNumber + 1;
    final lastUnlocked = currentProgress.lastUnlockedEpisode;
    
    final newProgress = currentProgress.copyWith(
      completedEpisodes: updatedCompletedEpisodes,
      lastUnlockedEpisode: nextEpisode > lastUnlocked ? nextEpisode : lastUnlocked,
      totalXp: currentProgress.totalXp + xpEarned,
      lastAccessDate: DateTime.now(),
    );
    
    await saveUserProgress(newProgress);
  }

  Future<EpisodeProgress?> getEpisodeProgress(int episodeNumber) async {
    final progress = await getUserProgress();
    return progress.completedEpisodes[episodeNumber];
  }

  // Implementaciones de IProgressRepository
  @override
  Future<int> getLastCompletedEpisode() async {
    final progress = await getUserProgress();
    final completed = progress.completedEpisodes.keys.toList()..sort();
    return completed.isEmpty ? 0 : completed.last;
  }

  @override
  Future<void> markEpisodeAsCompleted(int episodeNumber, int xpEarned) async {
    await completeEpisode(
      episodeNumber: episodeNumber,
      starsEarned: 3, // Default: 3 estrellas
      xpEarned: xpEarned,
    );
  }

  @override
  Future<int> getTotalXP() async {
    final progress = await getUserProgress();
    return progress.totalXp;
  }

  @override
  Future<void> addXP(int xp) async {
    final progress = await getUserProgress();
    final updated = progress.copyWith(totalXp: progress.totalXp + xp);
    await saveUserProgress(updated);
  }

  @override
  Future<bool> isEpisodeUnlocked(int episodeNumber) async {
    final progress = await getUserProgress();
    return episodeNumber <= progress.lastUnlockedEpisode;
  }

  @override
  Future<List<String>> getUnlockedAchievements() async {
    // TODO: Implementar cuando tengamos el sistema de achievements
    return [];
  }

  @override
  Future<void> unlockAchievement(String achievementId) async {
    // TODO: Implementar cuando tengamos el sistema de achievements
  }

  @override
  Future<bool> isAchievementUnlocked(String achievementId) async {
    // TODO: Implementar cuando tengamos el sistema de achievements
    return false;
  }

  @override
  Future<void> saveGameResult(
    int episodeNumber,
    String gameId,
    int score,
    int timeSpent,
  ) async {
    // TODO: Implementar cuando tengamos el sistema de game results
  }

  @override
  Future<Map<String, int>> getGameResults(int episodeNumber) async {
    // TODO: Implementar cuando tengamos el sistema de game results
    return {};
  }

  @override
  Future<void> resetProgress() async {
    await _prefs.remove(_progressKey);
  }
}
