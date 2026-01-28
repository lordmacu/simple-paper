import '../../domain/models/progression/achievement.dart';

class AchievementService {
  final Map<String, Achievement> _achievements;

  AchievementService({Map<String, Achievement>? predefined})
      : _achievements = predefined ??
            {
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

  List<Achievement> evaluate({
    required int totalXp,
    required int completedEpisodes,
    required int streak,
    required List<String> unlockedIds,
  }) {
    final newlyUnlocked = <Achievement>[];

    void unlockIf(String id, bool condition) {
      if (!condition) return;
      if (unlockedIds.contains(id)) return;
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
