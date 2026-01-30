import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/episode_providers.dart';
import '../../../providers/progress_providers.dart';
import '../../vocabulary/vocabulary_story_screen.dart';
import 'episode_item.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/section_progress.dart';
import '../../../../data/sources/content_db.dart';
import '../../../../domain/models/episode/episode.dart';

class EpisodeListScreen extends ConsumerStatefulWidget {
  const EpisodeListScreen({super.key});
  static const String _logTag = 'EPISODE_UNLOCK';

  @override
  ConsumerState<EpisodeListScreen> createState() => _EpisodeListScreenState();
}

class _EpisodeListScreenState extends ConsumerState<EpisodeListScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, BuildContext> _episodeContexts = {};
  final Map<int, int> _episodeIndex = {};
  int? _pendingScrollEpisode;
  int _totalEpisodes = 0;

  Future<void> _scrollToEpisode(int episodeNumber) async {
    for (var attempt = 0; attempt < 8; attempt++) {
      await Future.delayed(const Duration(milliseconds: 60));
      if (!_scrollController.hasClients) continue;
      if (!_scrollController.position.hasContentDimensions) continue;

      final context = _episodeContexts[episodeNumber];
      if (context != null) {
        await Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          alignment: 0.1,
        );
        return;
      }

      final index = _episodeIndex[episodeNumber];
      if (index != null && _totalEpisodes > 1) {
        final maxExtent = _scrollController.position.maxScrollExtent;
        final ratio = index / (_totalEpisodes - 1);
        final targetOffset = (ratio * maxExtent).clamp(0.0, maxExtent);
        await _scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _requestScrollToEpisode(int episodeNumber) {
    setState(() {
      _pendingScrollEpisode = episodeNumber;
    });
  }

  Future<void> _markSectionsUnlocked({
    required List<Episode> episodes,
    required int unlockedEpisode,
  }) async {
    final db = ContentDb();
    for (final episode in episodes) {
      final episodeNumber = episode.episodeMetadata.episodeNumber;
      if (episodeNumber >= unlockedEpisode) continue;

      final sectionIds = <String>{
        SectionProgressIds.vocab,
        SectionProgressIds.story,
        SectionProgressIds.games,
      };

      if (episode.miniStory != null &&
          episode.miniStory!.paragraphs.isNotEmpty) {
        sectionIds.add(SectionProgressIds.miniStory);
      }

      final listening = episode.listeningShadowing;
      if (listening != null && listening.data.isNotEmpty) {
        sectionIds.add(SectionProgressIds.listeningShadowing);
      }

      final hasInterview = await db.hasInterviewForEpisode(episodeNumber);
      if (hasInterview) {
        sectionIds.add(SectionProgressIds.interview);
      }

      for (final scene in episode.scenes.data) {
        sectionIds.add(SectionProgressIds.sceneId(scene.sceneNumber));
      }
      for (final entry in episode.games.data.asMap().entries) {
        sectionIds.add(SectionProgressIds.gameId(entry.key + 1));
      }

      for (final id in sectionIds) {
        await ref.read(markSectionCompletedProvider)(
          episodeNumber: episodeNumber,
          sectionId: id,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final episodesAsyncValue = ref.watch(episodeListProvider);
    final userProgressAsyncValue = ref.watch(userProgressProvider);

    return episodesAsyncValue.when(
      data: (episodes) {
        _totalEpisodes = episodes.length;
        _episodeContexts.clear();
        _episodeIndex.clear();
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
            if (_pendingScrollEpisode != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                final target = _pendingScrollEpisode;
                if (target == null) return;
                await Future.delayed(const Duration(milliseconds: 250));
                await _scrollToEpisode(target);
                if (mounted) {
                  setState(() {
                    _pendingScrollEpisode = null;
                  });
                }
              });
            }
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 16, bottom: 100),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                      final episode = episodes[index];
                      final episodeNumber =
                          episode.episodeMetadata.episodeNumber;
                      _episodeIndex[episodeNumber] = index;

                        // Determinar estado del episodio basado en progreso real
                        final episodeProgress =
                            userProgress.completedEpisodes[episodeNumber];
                        final isUnlocked =
                            episodeNumber <= userProgress.lastUnlockedEpisode;
                        final isCompleted = episodeProgress?.isCompleted ?? false;
                        debugPrint(
                          '${EpisodeListScreen._logTag} episode=$episodeNumber unlocked=$isUnlocked '
                          'lastUnlocked=${userProgress.lastUnlockedEpisode} completed=$isCompleted',
                        );

                        final status = isCompleted
                            ? EpisodeStatus.completed
                            : isUnlocked
                                ? EpisodeStatus.unlocked
                                : EpisodeStatus.locked;

                        final stars = episodeProgress?.starsEarned ?? 0;

                        return Builder(
                          builder: (itemContext) {
                            _episodeContexts[episodeNumber] = itemContext;
                            return EpisodeItem(
                            episode: episode,
                            status: status,
                            starsEarned: stars,
                            onUnlocked: (ep) {
                              _requestScrollToEpisode(ep);
                              _markSectionsUnlocked(
                                episodes: episodes,
                                unlockedEpisode: ep,
                              );
                            },
                            onTap: () {
                              // Navigate to Vocabulary Story screen
                              if (status != EpisodeStatus.locked) {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VocabularyStoryScreen(episode: episode),
                                  ),
                                );
                              }
                            },
                          );
                          },
                        );
                      },
                      childCount: episodes.length,
                    ),
                  ),
                ),
              ],
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
