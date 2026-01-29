import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../domain/models/episode/episode.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/section_progress.dart';
import '../../lesson/main_story_screen.dart';
import '../../vocabulary/vocabulary_story_screen.dart';
import '../../listening_shadowing/listening_shadowing_screen.dart';
import '../../games/games_screen.dart';
import '../../../widgets/stacked_3d_section_button.dart';
import '../../../widgets/stacked_3d_button.dart';
import '../../../providers/progress_providers.dart';
/// Estado del episodio
enum EpisodeStatus {
  locked,    // Bloqueado (no se puede acceder)
  unlocked,  // Desbloqueado (se puede jugar)
  completed, // Completado (ya se jugó)
}

class EpisodeItem extends ConsumerStatefulWidget {
  final Episode episode;
  final VoidCallback? onTap;
  final EpisodeStatus status;
  final int starsEarned; // 0-3 estrellas

  const EpisodeItem({
    super.key,
    required this.episode,
    this.onTap,
    this.status = EpisodeStatus.unlocked,
    this.starsEarned = 0,
  });

  @override
  ConsumerState<EpisodeItem> createState() => _EpisodeItemState();
}

class _EpisodeItemState extends ConsumerState<EpisodeItem>
    with SingleTickerProviderStateMixin {
  static const String _logTag = 'EPISODE_UNLOCK';
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _getCardColor() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Colors.grey.shade200;
      case EpisodeStatus.completed:
        return Colors.white;
      case EpisodeStatus.unlocked:
        return Colors.white;
    }
  }

  Color _getShadowColor() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Colors.grey.shade400;
      case EpisodeStatus.completed:
        return AppColors.successGreen;
      case EpisodeStatus.unlocked:
        return AppColors.primaryGreen;
    }
  }

  Color _getCircleColor() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Colors.grey.shade400;
      case EpisodeStatus.completed:
        return AppColors.successGreen;
      case EpisodeStatus.unlocked:
        return AppColors.primaryGreen;
    }
  }

  IconData _getStatusIcon() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Icons.lock_rounded;
      case EpisodeStatus.completed:
        return Icons.check_circle_rounded;
      case EpisodeStatus.unlocked:
        return Icons.play_circle_filled_rounded;
    }
  }

  Color _getStatusIconColor() {
    switch (widget.status) {
      case EpisodeStatus.locked:
        return Colors.grey.shade600;
      case EpisodeStatus.completed:
        return AppColors.successGreen;
      case EpisodeStatus.unlocked:
        return AppColors.primaryGreen;
    }
  }

  void _handleTap() {
    if (widget.status == EpisodeStatus.locked) {
      debugPrint(
        '$_logTag tap_locked episode=${widget.episode.episodeMetadata.episodeNumber}',
      );
      return;
    }
    
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    
    widget.onTap?.call();
  }

  void _openStory({int? initialScene}) {
    if (widget.status == EpisodeStatus.locked) return;
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => MainStoryScreen(
          episode: widget.episode,
          initialSceneIndex: initialScene ?? 0,
          onComplete: () {
            final navigator = Navigator.of(context, rootNavigator: true);
            if (navigator.canPop()) {
              navigator.pop();
            }
          },
        ),
      ),
    );
  }

  void _openVocab() {
    if (widget.status == EpisodeStatus.locked) return;
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => VocabularyStoryScreen(episode: widget.episode),
      ),
    );
  }

  void _openGames({int initialIndex = 0}) {
    if (widget.status == EpisodeStatus.locked) return;
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => GamesScreen(
          episode: widget.episode,
          pointsFromStory: 0,
          initialIndex: initialIndex,
          onComplete: (totalPoints, maxPoints) async {
            await _completeEpisodeIfReady(
              totalPoints: totalPoints,
              maxPoints: maxPoints,
            );
            final navigator = Navigator.of(context, rootNavigator: true);
            if (navigator.canPop()) {
              navigator.pop();
            }
          },
        ),
      ),
    );
  }

  void _openListeningShadowing() {
    if (widget.status == EpisodeStatus.locked) return;
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => ListeningShadowingScreen(
          episode: widget.episode,
          onComplete: () {
            final navigator = Navigator.of(context, rootNavigator: true);
            if (navigator.canPop()) {
              navigator.pop();
            }
          },
        ),
      ),
    );
  }

  Future<void> _completeEpisodeIfReady({
    required int totalPoints,
    required int maxPoints,
  }) async {
    final repository = ref.read(progressRepositoryProvider);
    final completed = await repository.getCompletedSections(
      widget.episode.episodeMetadata.episodeNumber,
    );
    final required = _buildRequiredSectionIds();
    debugPrint(
      '$_logTag check_complete episode=${widget.episode.episodeMetadata.episodeNumber} '
      'completed=${completed.length} required=${required.length}',
    );
    final missing = required.difference(completed);
    if (missing.isNotEmpty) {
      final done = required.intersection(completed).toList()..sort();
      final total = required.length;
      final doneCount = done.length;
      final percent = total == 0 ? 0 : ((doneCount / total) * 100).round();
      debugPrint(
        '$_logTag missing_sections episode=${widget.episode.episodeMetadata.episodeNumber} '
        'missing=${missing.toList()} done=$done '
        'progress=$doneCount/$total (${percent}%)',
      );
      return;
    }
    final stars = _calculateStars(totalPoints, maxPoints);
    debugPrint(
      '$_logTag completing episode=${widget.episode.episodeMetadata.episodeNumber} '
      'stars=$stars xp=$totalPoints max=$maxPoints',
    );
    await ref.read(completeEpisodeProvider)(
      episodeNumber: widget.episode.episodeMetadata.episodeNumber,
      starsEarned: stars,
      xpEarned: totalPoints,
    );
  }

  Set<String> _buildRequiredSectionIds() {
    final ids = <String>{
      SectionProgressIds.vocab,
      SectionProgressIds.story,
      SectionProgressIds.games,
    };
    final listening = widget.episode.listeningShadowing;
    if (listening != null && listening.data.isNotEmpty) {
      ids.add(SectionProgressIds.listeningShadowing);
    }
    for (final scene in widget.episode.scenes.data) {
      ids.add(SectionProgressIds.sceneId(scene.sceneNumber));
    }
    for (final entry in widget.episode.games.data.asMap().entries) {
      ids.add(SectionProgressIds.gameId(entry.key + 1));
    }
    return ids;
  }

  int _calculateStars(int points, int maxPoints) {
    if (maxPoints <= 0) return 3;
    final ratio = points / maxPoints;
    if (ratio >= 0.9) return 3;
    if (ratio >= 0.65) return 2;
    if (ratio >= 0.35) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _getCardColor(),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 4),
                  blurRadius: 0,
                ),
                BoxShadow(
                  color: _getShadowColor(),
                  offset: const Offset(0, 4),
                  blurRadius: 0,
                ),
              ],
              border: Border.all(color: AppColors.divider, width: 2),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _handleTap,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Episode Number Circle
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: _getCircleColor(),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '${widget.episode.episodeMetadata.episodeNumber}',
                            style: TextStyle(
                              color: widget.status == EpisodeStatus.locked
                                  ? Colors.grey.shade700
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Title and Progress
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Episode ${widget.episode.episodeMetadata.episodeNumber}',
                              style: TextStyle(
                                color: widget.status == EpisodeStatus.locked
                                    ? Colors.grey.shade600
                                    : AppColors.textSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.episode.episodeMetadata.title,
                              style: TextStyle(
                                color: widget.status == EpisodeStatus.locked
                                    ? Colors.grey.shade700
                                    : AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            // Progress indicator (stars)
                            if (widget.status == EpisodeStatus.completed ||
                                widget.starsEarned > 0) ...[
                              const SizedBox(height: 6),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Icon(
                                      index < widget.starsEarned
                                          ? Icons.star_rounded
                                          : Icons.star_outline_rounded,
                                      color: index < widget.starsEarned
                                          ? AppColors.warningOrange
                                          : Colors.grey.shade400,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                      // Status Icon (Locked/Unlocked/Completed)
                      Icon(
                        _getStatusIcon(),
                        color: _getStatusIconColor(),
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.status != EpisodeStatus.locked)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ref
                .watch(completedSectionsProvider(
                  widget.episode.episodeMetadata.episodeNumber,
                ))
                .when(
                  data: (completed) {
                    final entries = _buildSections();
                    debugPrint(
                      '$_logTag home_sections episode=${widget.episode.episodeMetadata.episodeNumber} '
                      'completed=${completed.toList()} entries=${entries.map((e) => e.id).toList()}',
                    );
                    return SectionPath(
                      entries: entries,
                      completedSectionIds: completed,
                    );
                  },
                  loading: () => SectionPath(
                    entries: _buildSections(),
                    completedSectionIds: const <String>{},
                  ),
                  error: (_, __) => SectionPath(
                    entries: _buildSections(),
                    completedSectionIds: const <String>{},
                  ),
                ),
          ),
      ],
    );
  }

  List<SectionEntry> _buildSections() {
    final sections = <Map<String, dynamic>>[];

    sections.add({
      'id': SectionProgressIds.vocab,
      'label': 'Vocabulario',
      'icon': Iconsax.book,
      'onTap': _openVocab,
    });

    final listening = widget.episode.listeningShadowing;
    if (listening != null && listening.data.isNotEmpty) {
      sections.add({
        'id': SectionProgressIds.listeningShadowing,
        'label': listening.sectionNameEs ??
            listening.sectionName ??
            'Listening',
        'icon': Icons.headphones,
        'onTap': _openListeningShadowing,
      });
    }

    for (final scene in widget.episode.scenes.data) {
      final sceneName = (scene.sceneName?.isNotEmpty ?? false)
          ? scene.sceneName!
          : 'Scene ${scene.sceneNumber}';
      sections.add({
        'id': SectionProgressIds.sceneId(scene.sceneNumber),
        'label': sceneName,
        'icon': Iconsax.message,
        'onTap': () => _openStory(initialScene: scene.sceneNumber - 1),
      });
    }

    for (final entry in widget.episode.games.data.asMap().entries) {
      final idx = entry.key;
      final dynamic game = entry.value;
      final gameTitle = (game.titleEs ?? game.title ?? 'Juego ${idx + 1}');
      sections.add({
        'id': SectionProgressIds.gameId(idx + 1),
        'label': gameTitle,
        'icon': Iconsax.play,
        'onTap': () => _openGames(initialIndex: idx),
      });
    }

    return sections.asMap().entries.map((entry) {
      final idx = entry.key;
      final data = entry.value;
      return SectionEntry(
        id: data['id'] as String,
        label: data['label'] as String,
        icon: data['icon'] as IconData?,
        onTap: data['onTap'] as VoidCallback,
      );
    }).toList();
  }
}

class SectionPath extends StatelessWidget {
  final List<SectionEntry> entries;
  final Set<String> completedSectionIds;

  const SectionPath({
    required this.entries,
    required this.completedSectionIds,
  });

  @override
  Widget build(BuildContext context) {
    const offsets = [-90.0, 0.0, 90.0, 0.0];
    final firstIncompleteIndex =
        entries.indexWhere((e) => !completedSectionIds.contains(e.id));
    final enabledIndex =
        firstIncompleteIndex == -1 ? entries.length - 1 : firstIncompleteIndex;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final data = entries[index];
        final isLast = index == entries.length - 1;
        final offsetX = offsets[index % offsets.length];
        final isEnabled = index <= enabledIndex;
        return SizedBox(
          width: double.infinity,
          height: isLast ? 130 : 130,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: Offset(offsetX, 0),
                child: isEnabled
                    ? Stacked3DSectionButton(
                        label: data.label,
                        onTap: data.onTap,
                        topColor: AppColors.primaryGreen,
                        isEnabled: true,
                        icon: data.icon,
                        iconSize: 35,
                      )
                    : _DisabledSectionButton(label: data.label, icon: data.icon),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DisabledSectionButton extends StatelessWidget {
  final String? label;
  final IconData? icon;

  const _DisabledSectionButton({
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final hasLabel = (label ?? '').trim().isNotEmpty;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stacked3DButton(
          topColor: AppColors.primaryGreen,
          isEnabled: false,
          icon: icon,
          iconSize: 35,
        ),
        if (hasLabel) ...[
          const SizedBox(height: 6),
          SizedBox(
            width: 140,
            height: 36,
            child: Text(
              label!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.1,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class SectionEntry {
  final String id;
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  const SectionEntry({
    required this.id,
    required this.label,
    this.icon,
    required this.onTap,
  });
}
