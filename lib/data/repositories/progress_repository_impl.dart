import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import '../../domain/models/progress/user_progress.dart';
import '../../domain/models/progression/achievement.dart';
import '../../domain/models/progress/review_word_entry.dart';
import '../../domain/repositories/i_progress_repository.dart';
import '../sources/review_words_db.dart';
import '../services/achievement_service.dart';

/// Implementación del repositorio de progreso usando SharedPreferences
class ProgressRepositoryImpl implements IProgressRepository {
  static const String _progressKey = 'user_progress';
  static const String _sectionProgressKey = 'section_progress_v1';
  final SharedPreferences _prefs;
  final ReviewWordsDb _reviewWordsDb;
  final AchievementService _achievementService;

  ProgressRepositoryImpl(
    this._prefs, {
    ReviewWordsDb? reviewWordsDb,
    AchievementService? achievementService,
  })  : _reviewWordsDb = reviewWordsDb ?? ReviewWordsDb.instance,
        _achievementService = achievementService ?? AchievementService();

  // Nuevos métodos para UserProgress
  Future<UserProgress> getUserProgress() async {
    final jsonString = _prefs.getString(_progressKey);
    final reviewWords = await _reviewWordsDb.getAllWords();
    if (jsonString == null) {
      // Retornar progreso inicial (episodio 1 desbloqueado)
      return UserProgress(lastUnlockedEpisode: 1, reviewWords: reviewWords);
    }
    
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final progress = UserProgress.fromJson(json);
    return progress.copyWith(reviewWords: reviewWords);
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
    var currentProgress = await getUserProgress();
    
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
    
    currentProgress = _updateStreak(currentProgress);

    // Desbloquear siguiente episodio si no está desbloqueado
    final nextEpisode = episodeNumber + 1;
    final lastUnlocked = currentProgress.lastUnlockedEpisode;
    
    final totalXp = currentProgress.totalXp + xpEarned;
    final newLevel = _calculateLevel(totalXp);

    final newAchievements = _achievementService.evaluate(
      totalXp: totalXp,
      completedEpisodes: updatedCompletedEpisodes.length,
      streak: currentProgress.currentStreak,
      unlockedIds: currentProgress.achievements
          .map((a) => a.id)
          .whereType<String>()
          .toList(),
    );
    final updatedAchievements = [
      ...currentProgress.achievements,
      ...newAchievements,
    ];

    final newProgress = currentProgress.copyWith(
      completedEpisodes: updatedCompletedEpisodes,
      lastUnlockedEpisode: nextEpisode > lastUnlocked ? nextEpisode : lastUnlocked,
      totalXp: totalXp,
      userLevel: newLevel,
      lastAccessDate: DateTime.now(),
      achievements: updatedAchievements,
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
    var progress = await getUserProgress();
    progress = _updateStreak(progress);
    final totalXp = progress.totalXp + xp;
    final newLevel = _calculateLevel(totalXp);

    final newAchievements = _achievementService.evaluate(
      totalXp: totalXp,
      completedEpisodes: progress.completedEpisodes.length,
      streak: progress.currentStreak,
      unlockedIds:
          progress.achievements.map((a) => a.id).whereType<String>().toList(),
    );
    final updatedAchievements = [
      ...progress.achievements,
      ...newAchievements,
    ];

    final updated = progress.copyWith(
      totalXp: totalXp,
      userLevel: newLevel,
      achievements: updatedAchievements,
      lastAccessDate: DateTime.now(),
    );
    await saveUserProgress(updated);
  }

  @override
  Future<bool> isEpisodeUnlocked(int episodeNumber) async {
    final progress = await getUserProgress();
    return episodeNumber <= progress.lastUnlockedEpisode;
  }

  @override
  Future<List<String>> getUnlockedAchievements() async {
    final progress = await getUserProgress();
    return progress.achievements.map((a) => a.id).whereType<String>().toList();
  }

  @override
  Future<void> addReviewWords({
    required List<String> words,
    required String level,
    required int episodeNumber,
  }) async {
    if (words.isEmpty) return;

    final normalized = words
        .map((word) => word.trim().toLowerCase())
        .where((word) => word.isNotEmpty)
        .toList();

    if (normalized.isEmpty) return;

    await _reviewWordsDb.addWords(
      words: normalized,
      level: level,
      episodeNumber: episodeNumber,
      increment: 1,
    );

    final progress = await getUserProgress();
    final updatedSet = {
      ...progress.reviewWords.map((word) => word.trim().toLowerCase()),
      ...normalized,
    };

    final updated = progress.copyWith(
      reviewWords: updatedSet.toList(),
      lastAccessDate: DateTime.now(),
    );

    await saveUserProgress(updated);
  }

  @override
  Future<List<ReviewWordEntry>> getReviewWords() async {
    return _reviewWordsDb.getAllEntries();
  }

  @override
  Future<void> removeReviewWord({
    required String word,
    required String level,
    required int episodeNumber,
  }) async {
    await _reviewWordsDb.deleteEntry(
      word: word,
      level: level,
      episodeNumber: episodeNumber,
    );

    final progress = await getUserProgress();
    final updated = progress.copyWith(
      reviewWords: progress.reviewWords
          .where((w) => w.toLowerCase() != word.toLowerCase())
          .toList(),
      lastAccessDate: DateTime.now(),
    );

    await saveUserProgress(updated);
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
    await _prefs.remove(_sectionProgressKey);
  }

  @override
  Future<Set<String>> getCompletedSections(int episodeNumber) async {
    final map = await _getSectionProgressMap();
    return map[episodeNumber] ?? <String>{};
  }

  @override
  Future<void> markSectionCompleted({
    required int episodeNumber,
    required String sectionId,
  }) async {
    final map = await _getSectionProgressMap();
    final current = map[episodeNumber] ?? <String>{};
    if (current.contains(sectionId)) return;
    final updated = {...current, sectionId};
    map[episodeNumber] = updated;
    await _saveSectionProgressMap(map);
  }

  Future<Map<int, Set<String>>> _getSectionProgressMap() async {
    final jsonString = _prefs.getString(_sectionProgressKey);
    if (jsonString == null) return {};
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    final result = <int, Set<String>>{};
    for (final entry in decoded.entries) {
      final key = int.tryParse(entry.key);
      if (key == null) continue;
      final list = (entry.value as List).whereType<String>().toSet();
      result[key] = list;
    }
    return result;
  }

  Future<void> _saveSectionProgressMap(
    Map<int, Set<String>> map,
  ) async {
    final jsonMap = <String, dynamic>{};
    for (final entry in map.entries) {
      jsonMap[entry.key.toString()] = entry.value.toList();
    }
    await _prefs.setString(_sectionProgressKey, jsonEncode(jsonMap));
  }

  int _calculateLevel(int totalXp) {
    // Curva: nivel 1 inicia en 0 XP, cada nivel requiere 80 + 25*(n-1)
    int level = 1;
    int xpRemaining = totalXp;
    while (true) {
      final required = 80 + 25 * (level - 1);
      if (xpRemaining < required) break;
      xpRemaining -= required;
      level++;
    }
    return level;
  }

  UserProgress _updateStreak(UserProgress progress) {
    final now = DateTime.now();
    final last = progress.lastAccessDate;
    if (last == null) {
      return progress.copyWith(currentStreak: 1, lastAccessDate: now);
    }
    final lastDate = DateTime(last.year, last.month, last.day);
    final today = DateTime(now.year, now.month, now.day);
    final diff = today.difference(lastDate).inDays;

    int newStreak;
    if (diff == 0) {
      newStreak = progress.currentStreak; // mismo día, no cambia
    } else if (diff == 1) {
      newStreak = progress.currentStreak + 1;
    } else {
      newStreak = 1; // streak roto
    }

    return progress.copyWith(
      currentStreak: newStreak,
      lastAccessDate: now,
    );
  }
}
