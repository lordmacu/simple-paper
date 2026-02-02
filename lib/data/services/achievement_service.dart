import '../../domain/models/progression/achievement.dart';

/// Servicio de logros.
///
/// Evalúa y desbloquea logros según el progreso del usuario.
/// Servicio para gestionar logros y recompensas del usuario.
class AchievementService {
  /// Logros disponibles
  final Map<String, Achievement> _achievements;

  /// Crea un servicio de logros.
  ///
  /// Parámetros:
  /// - [predefined]: Logros predefinidos (opcional)
  AchievementService({Map<String, Achievement>? predefined})
      : _achievements = predefined ??
            const {
              'xp_500': Achievement(
                id: 'xp_500',
                name: '500 XP',
                description: 'Alcanza 500 XP',
              ),
              'xp_1000': Achievement(
                id: 'xp_1000',
                name: '1K XP',
                description: 'Alcanza 1000 XP',
              ),
              'ep_10': Achievement(
                id: 'ep_10',
                name: '10 episodios',
                description: 'Completa 10 episodios',
              ),
              'streak_3': Achievement(
                id: 'streak_3',
                name: 'Streak 3 días',
                description: 'Mantén 3 días seguidos de práctica',
              ),
            };

  /// Evalúa logros y retorna los recién desbloqueados.
  ///
  /// Compara el progreso actual con los criterios de cada logro.
  List<Achievement> evaluate({
    required int totalXp,
    required int completedEpisodes,
    required int streak,
    required List<String> unlockedIds,
  }) {
    final newlyUnlocked = <Achievement>[];

    void unlockIf(String id, bool condition) {
      if (!condition) {
        return;
      }
      if (unlockedIds.contains(id)) {
        return;
      }
      final ach = _achievements[id];
      if (ach != null) {
        newlyUnlocked.add(ach.copyWith(unlocked: true, unlockedAt: DateTime.now()));
      }
    }

    unlockIf('xp_500', totalXp >= 500);
    unlockIf('xp_1000', totalXp >= 1000);
    unlockIf('ep_10', completedEpisodes >= 10);
    unlockIf('streak_3', streak >= 3);

    return newlyUnlocked;
  }
}
