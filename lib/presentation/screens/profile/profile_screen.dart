import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../domain/models/progression/achievement.dart';
import '../../providers/progress_providers.dart';
import '../../providers/template_variable_provider.dart';
import '../../widgets/common/duolingo_button.dart';
import '../../widgets/profile/xp_level_header.dart';
import 'widgets/profile_header.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final progressAsync = ref.watch(userProgressProvider);
    final playerName =
        ref.watch(templateVariableServiceProvider).getVariable('player_name');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: progressAsync.when(
        data: (progress) {
          final level = progress.userLevel;
          final totalXp = progress.totalXp;
          final xpSpent = _xpSpentBeforeLevel(level);
          final xpIntoLevel = totalXp - xpSpent;
          final xpToNext = _xpForLevel(level) - xpIntoLevel;
          final unlockedIds =
              progress.achievements.map((a) => a.id).toSet();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(
                  userName: playerName,
                  streak: progress.currentStreak,
                  level: level,
                ),
                const SizedBox(height: 10),
                LevelUpRibbon(level: level),
                const SizedBox(height: 16),
                XpLevelHeader(
                  level: level,
                  totalXp: totalXp,
                  xpToNext: xpToNext < 0 ? 0 : xpToNext,
                  xpIntoLevel: xpIntoLevel.clamp(0, _xpForLevel(level)),
                ),
                const SizedBox(height: 16),
                // Botón de carga de contenido oculto por requerimiento
                _StatRow(
                  icon: Icons.check_circle,
                  label: 'Episodios completados',
                  value: '${progress.completedEpisodes.length}',
                ),
                const SizedBox(height: 10),
                _StatRow(
                  icon: Icons.local_fire_department,
                  label: 'Streak actual',
                  value: '${progress.currentStreak} días',
                ),
                const SizedBox(height: 10),
                _StatRow(
                  icon: Icons.stars,
                  label: 'XP total',
                  value: '${progress.totalXp}',
                ),
                const SizedBox(height: 10),
                _StatRow(
                  icon: Icons.menu_book,
                  label: 'Palabras para repasar',
                  value: '${progress.reviewWords.length}',
                ),
                const SizedBox(height: 18),
                const Text(
                  'Logros',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                AchievementsGrid(
                  achievements: _allAchievements,
                  unlockedIds: unlockedIds,
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Text(
            'Error: $err',
            style: const TextStyle(color: AppColors.errorRed),
          ),
        ),
      ),
    );
  }

  int _xpForLevel(int level) => 80 + 25 * (level - 1);

  int _xpSpentBeforeLevel(int level) {
    int total = 0;
    for (int i = 1; i < level; i++) {
      total += _xpForLevel(i);
    }
    return total;
  }
}

class LevelUpRibbon extends StatelessWidget {
  final int level;
  const LevelUpRibbon({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, anim) => ScaleTransition(
        scale: CurvedAnimation(parent: anim, curve: Curves.easeOutBack),
        child: FadeTransition(opacity: anim, child: child),
      ),
      child: Container(
        key: ValueKey('level-$level'),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryGreen, AppColors.secondaryBlue],
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              '¡Nivel $level!',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.secondaryBlue),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class AchievementsGrid extends StatelessWidget {
  final List<Achievement> achievements;
  final Set<String> unlockedIds;

  const AchievementsGrid({
    super.key,
    required this.achievements,
    required this.unlockedIds,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: achievements.map((a) {
        final unlocked = unlockedIds.contains(a.id);
        final color =
            unlocked ? AppColors.primaryGreen : AppColors.cardBackground;
        final textColor =
            unlocked ? Colors.white : AppColors.textSecondary;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(12),
          width: 155,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _iconForAchievement(a.id),
                    color: textColor,
                  ),
                  const Spacer(),
                  Icon(
                    unlocked ? Icons.check_circle : Icons.lock_outline,
                    size: 18,
                    color: textColor,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                a.name,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                a.description,
                style: TextStyle(
                  color: textColor.withOpacity(0.9),
                  fontSize: 12,
                  height: 1.2,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  IconData _iconForAchievement(String id) {
    switch (id) {
      case 'xp_500':
        return Icons.bolt;
      case 'xp_1000':
        return Icons.flash_on;
      case 'ep_10':
        return Icons.movie_filter;
      case 'streak_3':
        return Icons.local_fire_department;
      default:
        return Icons.emoji_events;
    }
  }
}

final List<Achievement> _allAchievements = [
  const Achievement(
    id: 'xp_500',
    name: '500 XP',
    description: 'Alcanza 500 XP',
  ),
  const Achievement(
    id: 'xp_1000',
    name: '1K XP',
    description: 'Alcanza 1000 XP',
  ),
  const Achievement(
    id: 'ep_10',
    name: '10 episodios',
    description: 'Completa 10 episodios',
  ),
  const Achievement(
    id: 'streak_3',
    name: 'Streak 3 días',
    description: 'Mantén 3 días seguidos',
  ),
];
