import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/core/constants/app_colors.dart';
import '../review_words/review_words_screen.dart';
import 'widgets/episode_list_screen.dart';
import '../settings/settings_screen.dart';
import '../../providers/personalization_providers.dart';
import '../../providers/episode_providers.dart';
import '../../providers/progress_providers.dart';
import '../onboarding/welcome_name_screen.dart';
import '../practice/practice_games_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Asegura que las variables personalizadas se carguen
    ref.watch(personalizationInitProvider);

    final hasNameAsync = ref.watch(hasPlayerNameProvider);
    final hasEpisodesAsync = ref.watch(hasEpisodesProvider);
    final progressAsync = ref.watch(userProgressProvider);

    if (hasNameAsync.isLoading || hasEpisodesAsync.isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (hasNameAsync.hasError || hasEpisodesAsync.hasError) {
      final nameError = hasNameAsync.error;
      final episodesError = hasEpisodesAsync.error;
      if (nameError != null) {
        debugPrint('HOME_BOOT name_error=$nameError');
      }
      if (episodesError != null) {
        debugPrint('HOME_BOOT episodes_error=$episodesError');
      }
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text('Error cargando datos')),
      );
    }
    final hasName = hasNameAsync.value ?? false;
    final hasEpisodes = hasEpisodesAsync.value ?? false;
    if (!hasName || !hasEpisodes) {
      return WelcomeNameScreen(
        onFinished: () {
          ref.invalidate(hasPlayerNameProvider);
          ref.invalidate(hasEpisodesProvider);
          ref.invalidate(episodeListProvider);
          ref.invalidate(userProgressProvider);
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon:
                  const Icon(Icons.book_outlined, color: AppColors.textSecondary),
              tooltip: 'Palabras para repasar',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ReviewWordsScreen(),
                  ),
                );
              },
            ),
            progressAsync.when(
              data: (progress) {
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.videogame_asset_outlined,
                          color: AppColors.textSecondary),
                      tooltip: 'Practicar minijuegos',
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (_) => const PracticeGamesScreen(),
                          ),
                        );
                      },
                    ),
                    const Icon(
                      Icons.local_fire_department,
                      color: AppColors.warningOrange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${progress.currentStreak}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.warningOrange,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.settings,
                          color: AppColors.textSecondary),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: const [
          Expanded(child: EpisodeListScreen()),
        ],
      ),
    );
  }
}
