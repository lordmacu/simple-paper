import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/progress/user_progress.dart';
import '../../domain/models/progress/review_word_entry.dart';
import '../../domain/models/progression/achievement.dart';
import '../../domain/repositories/i_progress_repository.dart';
import '../sources/review_words_db.dart';
import '../services/achievement_service.dart';

/// Implementación del repositorio de progreso usando SharedPreferences
class ProgressRepositoryImpl implements IProgressRepository {
  static const String _progressKey = 'user_progress';
  static const String _sectionProgressKey = 'section_progress_v1';
  static const String _interviewProgressKey = 'interview_progress_v1';
  static const String _gameResultKey = 'user_progress_game_results';
  final SharedPreferences _prefs;
  final ReviewWordsDb _reviewWordsDb;
  final AchievementService _achievementService;

  /// Crea una implementación del repositorio de progreso.
  /// [prefs] Instancia de SharedPreferences para persistencia.
  /// [reviewWordsDb] Base de datos de palabras para repasar (opcional).
  /// [achievementService] Servicio de logros (opcional).
  ProgressRepositoryImpl(
    this._prefs, {
    ReviewWordsDb? reviewWordsDb,
    AchievementService? achievementService,
  })  : _reviewWordsDb = reviewWordsDb ?? ReviewWordsDb.instance,
        _achievementService = achievementService ?? AchievementService();

  // Nuevos métodos para UserProgress
  @override
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

  @override
  Future<void> saveUserProgress(UserProgress progress) async {
    final jsonString = jsonEncode(progress.toJson());
    await _prefs.setString(_progressKey, jsonString);
  }

  @override
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

    // Detectar primer episodio completado
    if (updatedCompletedEpisodes.length == 1 && 
        !currentProgress.achievements.any((a) => a.id == 'first_episode')) {
      // Agregar achievement de primer episodio manualmente
      final firstEpisodeAchievement = Achievement(
        id: 'first_episode',
        name: _getAchievementName('first_episode'),
        description: _getAchievementDescription('first_episode'),
        unlocked: true,
        unlockedAt: DateTime.now(),
      );
      currentProgress = currentProgress.copyWith(
        achievements: [...currentProgress.achievements, firstEpisodeAchievement],
      );
    }

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

  @override
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
  Future<void> unlockEpisode(int episodeNumber) async {
    final progress = await getUserProgress();
    if (episodeNumber <= progress.lastUnlockedEpisode) {
      return;
    }
    final updated = progress.copyWith(
      lastUnlockedEpisode: episodeNumber,
      lastAccessDate: DateTime.now(),
    );
    await saveUserProgress(updated);
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
    if (words.isEmpty) {
      return;
    }

    final normalized = words
        .map((word) => word.trim().toLowerCase())
        .where((word) => word.isNotEmpty)
        .toList();

    if (normalized.isEmpty) {
      return;
    }

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
    final currentProgress = await getUserProgress();
    
    // Verificar si el achievement ya está desbloqueado
    final existingAchievement = currentProgress.achievements.where(
      (a) => a.id == achievementId,
    ).firstOrNull;
    
    if (existingAchievement != null && existingAchievement.unlocked) {
      return; // Ya está desbloqueado
    }
    
    // Crear o actualizar el achievement
    final updatedAchievements = currentProgress.achievements.toList();
    
    if (existingAchievement != null) {
      // Actualizar achievement existente
      final index = updatedAchievements.indexOf(existingAchievement);
      updatedAchievements[index] = existingAchievement.copyWith(
        unlocked: true,
        unlockedAt: DateTime.now(),
      );
    } else {
      // Crear nuevo achievement con datos básicos
      updatedAchievements.add(Achievement(
        id: achievementId,
        name: _getAchievementName(achievementId),
        description: _getAchievementDescription(achievementId),
        unlocked: true,
        unlockedAt: DateTime.now(),
      ));
    }
    
    final updatedProgress = currentProgress.copyWith(
      achievements: updatedAchievements,
    );
    
    await saveUserProgress(updatedProgress);
  }

  @override
  Future<bool> isAchievementUnlocked(String achievementId) async {
    final currentProgress = await getUserProgress();
    
    final achievement = currentProgress.achievements.where(
      (a) => a.id == achievementId,
    ).firstOrNull;
    
    return achievement?.unlocked ?? false;
  }

  @override
  Future<void> saveGameResult(
    int episodeNumber,
    String gameId,
    int score,
    int timeSpent,
  ) async {
    // Validaciones
    if (episodeNumber <= 0) {
      throw ArgumentError('Episode number must be positive');
    }
    if (gameId.trim().isEmpty) {
      throw ArgumentError('Game ID cannot be empty');
    }
    if (score < 0) {
      throw ArgumentError('Score cannot be negative');
    }
    if (timeSpent < 0) {
      throw ArgumentError('Time spent cannot be negative');
    }
    
    final existingData = _prefs.getString(_gameResultKey);
    
    Map<String, dynamic> gameResults = {};
    if (existingData != null && existingData.isNotEmpty) {
      try {
        gameResults = Map<String, dynamic>.from(
          json.decode(existingData) as Map,
        );
      } on Exception {
        // Si hay error al parsear, empezar con datos vacíos
        gameResults = {};
      }
    }
    
    // Estructura: episodeNumber -> gameId -> {score, timeSpent, attempts, bestScore}
    final episodeKey = episodeNumber.toString();
    final episodeData = Map<String, dynamic>.from(
      gameResults[episodeKey] as Map? ?? {},
    );
    
    final gameData = Map<String, dynamic>.from(
      episodeData[gameId] as Map? ?? {},
    );
    
    final currentBestScore = gameData['bestScore'] as int? ?? 0;
    final attempts = (gameData['attempts'] as int? ?? 0) + 1;
    
    // Actualizar datos del juego
    gameData['score'] = score;
    gameData['timeSpent'] = timeSpent;
    gameData['attempts'] = attempts;
    gameData['lastPlayed'] = DateTime.now().toIso8601String();
    
    // Actualizar mejor puntuación si es necesario
    if (score > currentBestScore) {
      gameData['bestScore'] = score;
      gameData['bestScoreDate'] = DateTime.now().toIso8601String();
    }
    
    episodeData[gameId] = gameData;
    gameResults[episodeKey] = episodeData;
    
    await _prefs.setString(_gameResultKey, json.encode(gameResults));
  }

  @override
  Future<Map<String, int>> getGameResults(int episodeNumber) async {
    final existingData = _prefs.getString(_gameResultKey);
    
    if (existingData == null || existingData.isEmpty) {
      return {};
    }
    
    try {
      final gameResults = Map<String, dynamic>.from(
        json.decode(existingData) as Map,
      );
      
      final episodeKey = episodeNumber.toString();
      final episodeData = gameResults[episodeKey] as Map?;
      
      if (episodeData == null) {
        return {};
      }
      
      // Retornar gameId -> bestScore
      final results = <String, int>{};
      for (final entry in episodeData.entries) {
        final gameId = entry.key as String;
        final gameData = entry.value as Map?;
        if (gameData != null) {
          results[gameId] = gameData['bestScore'] as int? ?? 0;
        }
      }
      
      return results;
    } on Exception {
      return {};
    }
  }

  /// Obtiene estadísticas detalladas de un juego específico
  @override
  Future<Map<String, dynamic>?> getGameStats(int episodeNumber, String gameId) async {
    final existingData = _prefs.getString(_gameResultKey);
    
    if (existingData == null || existingData.isEmpty) {
      return null;
    }
    
    try {
      final gameResults = Map<String, dynamic>.from(
        json.decode(existingData) as Map,
      );
      
      final episodeKey = episodeNumber.toString();
      final episodeData = gameResults[episodeKey] as Map?;
      
      if (episodeData == null) {
        return null;
      }
      
      final gameData = episodeData[gameId] as Map?;
      return gameData != null ? Map<String, dynamic>.from(gameData) : null;
    } on Exception {
      return null;
    }
  }

  /// Obtiene el nombre de un achievement basado en su ID
  String _getAchievementName(String achievementId) {
    switch (achievementId) {
      case 'xp_500':
        return '500 XP';
      case 'xp_1000':
        return '1K XP';
      case 'ep_10':
        return '10 Episodes';
      case 'streak_3':
        return 'Streak Master';
      case 'first_episode':
        return 'First Steps';
      case 'perfect_episode':
        return 'Perfectionist';
      default:
        return 'Achievement';
    }
  }
  
  /// Obtiene la descripción de un achievement basado en su ID
  String _getAchievementDescription(String achievementId) {
    switch (achievementId) {
      case 'xp_500':
        return 'Alcanza 500 XP';
      case 'xp_1000':
        return 'Alcanza 1000 XP';
      case 'ep_10':
        return 'Completa 10 episodios';
      case 'streak_3':
        return 'Mantén 3 días seguidos de práctica';
      case 'first_episode':
        return 'Complete your first episode';
      case 'perfect_episode':
        return 'Complete an episode with perfect score';
      default:
        return 'Unlock this achievement by progressing in the app';
    }
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
    if (current.contains(sectionId)) {
      return;
    }
    final updated = {...current, sectionId};
    map[episodeNumber] = updated;
    await _saveSectionProgressMap(map);
  }

  @override
  Future<bool> isInterviewCompleted({
    required String level,
    required int episodeNumber,
    required String characterId,
    required String interviewId,
  }) async {
    final key = _buildInterviewKey(
      level: level,
      episodeNumber: episodeNumber,
      characterId: characterId,
      interviewId: interviewId,
    );
    final list = _prefs.getStringList(_interviewProgressKey) ?? [];
    return list.contains(key);
  }

  @override
  Future<void> markInterviewCompleted({
    required String level,
    required int episodeNumber,
    required String characterId,
    required String interviewId,
  }) async {
    final key = _buildInterviewKey(
      level: level,
      episodeNumber: episodeNumber,
      characterId: characterId,
      interviewId: interviewId,
    );
    final list = _prefs.getStringList(_interviewProgressKey) ?? [];
    if (list.contains(key)) {
      return;
    }
    final updated = [...list, key];
    await _prefs.setStringList(_interviewProgressKey, updated);
  }

  Future<Map<int, Set<String>>> _getSectionProgressMap() async {
    final jsonString = _prefs.getString(_sectionProgressKey);
    if (jsonString == null) {
      return {};
    }
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    final result = <int, Set<String>>{};
    for (final entry in decoded.entries) {
      final key = int.tryParse(entry.key);
      if (key == null) {
        continue;
      }
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

  String _buildInterviewKey({
    required String level,
    required int episodeNumber,
    required String characterId,
    required String interviewId,
  }) {
    final normalized = _normalizeCharacterId(characterId);
    final normalizedInterview = _normalizeInterviewId(interviewId);
    return '${level.toLowerCase()}|$episodeNumber|$normalized|$normalizedInterview';
  }

  String _normalizeCharacterId(String characterId) {
    var value = characterId.trim().toLowerCase().replaceAll(' ', '_');
    if (value.startsWith('char_')) {
      value = value.substring('char_'.length);
    }
    return value;
  }

  String _normalizeInterviewId(String interviewId) {
    var value = interviewId.trim().toLowerCase().replaceAll(' ', '_');
    value = value.replaceAll(RegExp(r'[^a-z0-9_\\-]'), '');
    return value.isEmpty ? 'default' : value;
  }

  int _calculateLevel(int totalXp) {
    // Curva: nivel 1 inicia en 0 XP, cada nivel requiere 80 + 25*(n-1)
    int level = 1;
    int xpRemaining = totalXp;
    while (true) {
      final required = 80 + 25 * (level - 1);
      if (xpRemaining < required) {
        break;
      }
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
