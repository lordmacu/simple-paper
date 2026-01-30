import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../domain/models/episode/episode.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/section_progress.dart';
import '../../../../data/sources/content_db.dart';
import '../../lesson/main_story_screen.dart';
import '../../vocabulary/vocabulary_story_screen.dart';
import '../../listening_shadowing/listening_shadowing_screen.dart';
import '../../mini_story/mini_story_screen.dart';
import '../../games/games_screen.dart';
import '../../interview/character_interview_screen.dart';
import '../../interview/interview_summary_screen.dart';
import '../../interview/interview_parser.dart';
import '../../../widgets/stacked_3d_section_button.dart';
import '../../../widgets/stacked_3d_button.dart';
import '../../../providers/episode_providers.dart';
import '../../../providers/progress_providers.dart';
import '../../../widgets/common/duolingo_button.dart';
/// Estado del episodio
enum EpisodeStatus {
  locked,    // Bloqueado (no se puede acceder)
  unlocked,  // Desbloqueado (se puede jugar)
  completed, // Completado (ya se jugó)
}

class EpisodeItem extends ConsumerStatefulWidget {
  final Episode episode;
  final VoidCallback? onTap;
  final ValueChanged<int>? onUnlocked;
  final EpisodeStatus status;
  final int starsEarned; // 0-3 estrellas

  const EpisodeItem({
    super.key,
    required this.episode,
    this.onTap,
    this.onUnlocked,
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
  Offset? _tapPosition;

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
      _showUnlockPopover(_tapPosition);
      return;
    }
    
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    
    widget.onTap?.call();
  }

  Future<void> _showUnlockPopover(Offset? tapPosition) async {
    final episodeNumber = widget.episode.episodeMetadata.episodeNumber;
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Episodio $episodeNumber bloqueado',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Desbloquea este episodio y todos los anteriores.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 18),
                DuolingoButton(
                  text: 'Desbloquear',
                  onPressed: () async {
                    await ref.read(unlockEpisodeProvider)(
                      episodeNumber: episodeNumber,
                    );
                    widget.onUnlocked?.call(episodeNumber);
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                const SizedBox(height: 10),
                DuolingoButton(
                  text: 'Ahora no',
                  isSecondary: true,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
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

  void _openMiniStory() {
    if (widget.status == EpisodeStatus.locked) return;
    if (widget.episode.miniStory == null) return;
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => MiniStoryScreen(episode: widget.episode),
      ),
    );
  }

  Future<void> _openInterview() async {
    if (widget.status == EpisodeStatus.locked) return;
    final episodeNumber = widget.episode.episodeMetadata.episodeNumber;
    final level = widget.episode.episodeMetadata.internalLevel;
    final db = ContentDb();
    final progressRepo = ref.read(progressRepositoryProvider);
    final interviewEntries = await db.getInterviewEntries(episodeNumber);
    final episodeCharacterIds = widget.episode.characters.appearingInEpisode
        .map((c) => _normalizeCharacterId(c.characterId))
        .toSet();
    final filtered = interviewEntries.where((entry) {
      final normalized = _normalizeCharacterId(entry.characterId);
      return episodeCharacterIds.contains(normalized) &&
          _matchesLevel(entry.interviewId, level);
    }).toList();
    final entries = (filtered.isNotEmpty ? filtered : interviewEntries)
      ..shuffle();
    debugPrint(
      '$_logTag interview_open episode=$episodeNumber entries=${interviewEntries.map((e) => '${e.characterId}:${e.interviewId}').toList()}',
    );
    if (entries.isEmpty) return;

    for (final entry in entries) {
      final id = entry.characterId;
      final interviewId = entry.interviewId;
      final completed = await progressRepo.isInterviewCompleted(
        level: level,
        episodeNumber: episodeNumber,
        characterId: id,
        interviewId: interviewId,
      );
      debugPrint(
        '$_logTag interview_check episode=$episodeNumber characterId=$id interviewId=$interviewId completed=$completed',
      );
      if (completed) continue;

      final json = await db.getInterviewJson(
        episodeNumber: episodeNumber,
        characterId: id,
        interviewId: interviewId,
      );
      debugPrint(
        '$_logTag interview_json episode=$episodeNumber characterId=$id interviewId=$interviewId found=${json != null}',
      );
      if (json == null) continue;

      final interview = InterviewParser.parse(
        json,
        episodeNumber: episodeNumber,
        fallbackName: _resolveCharacterName(id),
      );
      if (interview == null) continue;

      if (!mounted) return;

      final result = await Navigator.push<Map<String, dynamic>?>(
        context,
        MaterialPageRoute(
          builder: (_) => CharacterInterviewScreen(
            interview: interview,
            onComplete: (correct, total, wrongWords) {
              Navigator.pop<Map<String, dynamic>?>(context, {
                'correct': correct,
                'total': total,
                'wrongWords': wrongWords,
              });
            },
          ),
        ),
      );

      if (!mounted) return;
      if (result != null) {
        if (result['exitToHome'] == true) {
          Navigator.of(context, rootNavigator: true)
              .popUntil((route) => route.isFirst);
          return;
        }
        final correct = result['correct'] ?? 0;
        final total = result['total'] ?? interview.questions.length;
        final wrongWords = (result['wrongWords'] as List<dynamic>?)
                ?.whereType<String>()
                .toList() ??
            const <String>[];
        if (correct < total) {
          final reviewWords = wrongWords
              .map((e) => e.trim().toLowerCase())
              .where((e) => e.isNotEmpty)
              .toList();
          if (reviewWords.isNotEmpty) {
            await ref.read(addReviewWordsProvider)(
              words: reviewWords,
              level: level,
              episodeNumber: episodeNumber,
            );
          }
        }
        await progressRepo.markInterviewCompleted(
          level: level,
          episodeNumber: episodeNumber,
          characterId: id,
          interviewId: interviewId,
        );
        await ref.read(markSectionCompletedProvider)(
          episodeNumber: episodeNumber,
          sectionId: SectionProgressIds.interview,
        );

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InterviewSummaryScreen(
              correct: correct,
              total: total,
              grammarPoints: interview.grammarPoints,
              vocabularyUsed: interview.vocabularyUsed,
              onContinue: () => Navigator.pop(context),
            ),
          ),
        );
      }
      break;
    }
  }

  Future<void> _completeEpisodeIfReady({
    required int totalPoints,
    required int maxPoints,
  }) async {
    final repository = ref.read(progressRepositoryProvider);
    final completed = await repository.getCompletedSections(
      widget.episode.episodeMetadata.episodeNumber,
    );
    final hasInterview = await ContentDb().hasInterviewForEpisode(
      widget.episode.episodeMetadata.episodeNumber,
    );
    final required = _buildRequiredSectionIds(
      includeInterview: hasInterview,
    );
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

  Set<String> _buildRequiredSectionIds({required bool includeInterview}) {
    final ids = <String>{
      SectionProgressIds.vocab,
      SectionProgressIds.story,
      SectionProgressIds.games,
    };
    if (widget.episode.miniStory != null &&
        widget.episode.miniStory!.paragraphs.isNotEmpty) {
      ids.add(SectionProgressIds.miniStory);
    }
    if (includeInterview) {
      ids.add(SectionProgressIds.interview);
    }
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

  String _resolveCharacterName(String characterId) {
    final normalized = _normalizeCharacterId(characterId);
    for (final character in widget.episode.characters.appearingInEpisode) {
      if (_normalizeCharacterId(character.characterId) == normalized) {
        return character.defaultName;
      }
    }
    return characterId;
  }

  String _normalizeCharacterId(String characterId) {
    var value = characterId.trim().toLowerCase().replaceAll(' ', '_');
    if (value.startsWith('char_')) {
      value = value.substring('char_'.length);
    }
    return value;
  }

  bool _matchesLevel(String interviewId, String level) {
    if (interviewId.isEmpty || interviewId == 'default') return true;
    final needle = 'episode_${level.toLowerCase()}_';
    return interviewId.toLowerCase().contains(needle);
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
    final interviewAvailability = ref.watch(
      interviewAvailableProvider(widget.episode.episodeMetadata.episodeNumber),
    );
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
                    return interviewAvailability.when(
                      data: (hasInterview) {
                        final entries = _buildSections(
                          hasInterview: hasInterview,
                        );
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
                        entries: _buildSections(hasInterview: false),
                        completedSectionIds: completed,
                      ),
                      error: (_, __) => SectionPath(
                        entries: _buildSections(hasInterview: false),
                        completedSectionIds: completed,
                      ),
                    );
                  },
                  loading: () => SectionPath(
                    entries: _buildSections(hasInterview: false),
                    completedSectionIds: const <String>{},
                  ),
                  error: (_, __) => SectionPath(
                    entries: _buildSections(hasInterview: false),
                    completedSectionIds: const <String>{},
                  ),
                ),
          ),
      ],
    );
  }

  List<SectionEntry> _buildSections({required bool hasInterview}) {
    final sections = <Map<String, dynamic>>[];

    sections.add({
      'id': SectionProgressIds.vocab,
      'label': 'Vocabulario',
      'icon': Iconsax.book,
      'onTap': _openVocab,
    });

    final miniStory = widget.episode.miniStory;
    if (miniStory != null && miniStory.paragraphs.isNotEmpty) {
      sections.add({
        'id': SectionProgressIds.miniStory,
        'label':
            miniStory.sectionNameEs ?? miniStory.sectionName ?? 'Mini historia',
        'icon': Icons.menu_book,
        'onTap': _openMiniStory,
      });
    }

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

    if (hasInterview) {
      sections.add({
        'id': SectionProgressIds.interview,
        'label': 'Entrevista',
        'icon': Icons.person,
        'onTap': _openInterview,
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
