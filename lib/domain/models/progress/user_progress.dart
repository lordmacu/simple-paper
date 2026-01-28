import 'package:freezed_annotation/freezed_annotation.dart';

import '../progression/achievement.dart';

part 'user_progress.freezed.dart';
part 'user_progress.g.dart';

/// Progreso del usuario en la app
@freezed
class UserProgress with _$UserProgress {
  const factory UserProgress({
    /// Episodios completados (episodeNumber -> EpisodeProgress)
    @Default({}) Map<int, EpisodeProgress> completedEpisodes,
    
    /// Último episodio desbloqueado
    @Default(1) int lastUnlockedEpisode,
    
    /// Nivel actual del usuario
    @Default(1) int userLevel,
    
    /// XP total acumulado
    @Default(0) int totalXp,

    /// Logros
    @Default([]) List<Achievement> achievements,

    /// Palabras para repasar
    @JsonKey(name: 'review_words') @Default([]) List<String> reviewWords,
    
    /// Streak actual (días consecutivos)
    @Default(0) int currentStreak,
    
    /// Fecha del último acceso
    DateTime? lastAccessDate,
  }) = _UserProgress;

  factory UserProgress.fromJson(Map<String, dynamic> json) =>
      _$UserProgressFromJson(json);
}

/// Progreso de un episodio específico
@freezed
class EpisodeProgress with _$EpisodeProgress {
  const factory EpisodeProgress({
    /// Número del episodio
    required int episodeNumber,
    
    /// Si está completado
    @Default(false) bool isCompleted,
    
    /// Estrellas ganadas (0-3)
    @Default(0) int starsEarned,
    
    /// XP ganado en este episodio
    @Default(0) int xpEarned,
    
    /// Fecha de completitud
    DateTime? completedAt,
    
    /// Número de intentos
    @Default(1) int attempts,
  }) = _EpisodeProgress;

  factory EpisodeProgress.fromJson(Map<String, dynamic> json) =>
      _$EpisodeProgressFromJson(json);
}
