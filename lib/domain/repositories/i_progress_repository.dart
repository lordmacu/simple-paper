import '../models/progress/user_progress.dart';

/// Interface del repositorio de progreso del usuario
/// Define el contrato para guardar y recuperar el progreso del jugador
abstract class IProgressRepository {
  /// Obtiene el progreso completo del usuario
  /// 
  /// Returns: UserProgress con toda la información
  Future<UserProgress> getUserProgress();
  
  /// Guarda el progreso del usuario
  /// 
  /// [progress] - Progreso a guardar
  Future<void> saveUserProgress(UserProgress progress);
  
  /// Completa un episodio con estrellas y XP
  /// 
  /// [episodeNumber] - Número del episodio
  /// [starsEarned] - Estrellas ganadas (0-3)
  /// [xpEarned] - XP ganado
  Future<void> completeEpisode({
    required int episodeNumber,
    required int starsEarned,
    required int xpEarned,
  });
  
  /// Obtiene el progreso de un episodio específico
  /// 
  /// [episodeNumber] - Número del episodio
  /// 
  /// Returns: EpisodeProgress o null si no existe
  Future<EpisodeProgress?> getEpisodeProgress(int episodeNumber);
  
  /// Obtiene el número del último episodio completado
  /// 
  /// Returns: Número del episodio (0 si no ha completado ninguno)
  Future<int> getLastCompletedEpisode();
  
  /// Marca un episodio como completado
  /// 
  /// [episodeNumber] - Número del episodio completado
  /// [xpEarned] - XP ganado en el episodio
  Future<void> markEpisodeAsCompleted(int episodeNumber, int xpEarned);
  
  /// Obtiene el XP total acumulado del usuario
  /// 
  /// Returns: Total de XP
  Future<int> getTotalXP();
  
  /// Agrega XP al total del usuario
  /// 
  /// [xp] - Cantidad de XP a agregar
  Future<void> addXP(int xp);
  
  /// Verifica si un episodio está desbloqueado
  /// 
  /// [episodeNumber] - Número del episodio a verificar
  /// 
  /// Returns: true si está desbloqueado, false si no
  Future<bool> isEpisodeUnlocked(int episodeNumber);
  
  /// Obtiene la lista de logros desbloqueados
  /// 
  /// Returns: Lista de IDs de logros desbloqueados
  Future<List<String>> getUnlockedAchievements();
  
  /// Desbloquea un logro
  /// 
  /// [achievementId] - ID del logro a desbloquear
  Future<void> unlockAchievement(String achievementId);
  
  /// Verifica si un logro está desbloqueado
  /// 
  /// [achievementId] - ID del logro a verificar
  /// 
  /// Returns: true si está desbloqueado, false si no
  Future<bool> isAchievementUnlocked(String achievementId);
  
  /// Guarda el resultado de un juego
  /// 
  /// [episodeNumber] - Episodio del juego
  /// [gameId] - ID del juego
  /// [score] - Puntuación obtenida
  /// [timeSpent] - Tiempo en segundos
  Future<void> saveGameResult(
    int episodeNumber,
    String gameId,
    int score,
    int timeSpent,
  );
  
  /// Obtiene los resultados de juegos de un episodio
  /// 
  /// [episodeNumber] - Número del episodio
  /// 
  /// Returns: Mapa de gameId -> score
  Future<Map<String, int>> getGameResults(int episodeNumber);
  
  /// Resetea todo el progreso (para testing o reinicio)
  Future<void> resetProgress();
}
