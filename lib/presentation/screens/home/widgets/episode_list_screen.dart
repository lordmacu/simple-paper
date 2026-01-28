import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/episode_providers.dart';
import '../../../providers/progress_providers.dart';
import '../../vocabulary/vocabulary_story_screen.dart';
import 'episode_item.dart';
import '../../../../core/constants/app_colors.dart';

class EpisodeListScreen extends ConsumerWidget {
  const EpisodeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodesAsyncValue = ref.watch(episodeListProvider);
    final userProgressAsyncValue = ref.watch(userProgressProvider);

    return episodesAsyncValue.when(
      data: (episodes) {
        if (episodes.isEmpty) {
          return const Center(
            child: Text(
              'No episodes found.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          );
        }
        
        return userProgressAsyncValue.when(
          data: (userProgress) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 16, bottom: 100),
              itemCount: episodes.length,
              itemBuilder: (context, index) {
                final episode = episodes[index];
                final episodeNumber = episode.episodeMetadata.episodeNumber;
                
                // Determinar estado del episodio basado en progreso real
                final episodeProgress = userProgress.completedEpisodes[episodeNumber];
                final isUnlocked = episodeNumber <= userProgress.lastUnlockedEpisode;
                final isCompleted = episodeProgress?.isCompleted ?? false;
                
                final status = isCompleted
                    ? EpisodeStatus.completed
                    : isUnlocked
                        ? EpisodeStatus.unlocked
                        : EpisodeStatus.locked;
                
                final stars = episodeProgress?.starsEarned ?? 0;
                
                return EpisodeItem(
                  episode: episode,
                  status: status,
                  starsEarned: stars,
                  onTap: () {
                    // Navigate to Vocabulary Story screen
                    if (status != EpisodeStatus.locked) {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => VocabularyStoryScreen(
                            episode: episode,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primaryGreen),
          ),
          error: (error, stack) => Center(
            child: Text(
              'Error loading progress: $error',
              style: const TextStyle(color: AppColors.errorRed),
            ),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primaryGreen),
      ),
      error: (error, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: AppColors.errorRed,
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading episodes:\n$error',
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.refresh(episodeListProvider);
                },
                child: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
