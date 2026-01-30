import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/core/constants/app_colors.dart';
import 'package:office_app/domain/models/episode/episode.dart';
import 'package:office_app/domain/models/vocabulary/vocabulary_segment.dart';
import 'package:office_app/core/utils/section_progress.dart';
import '../../widgets/vocabulary/vocabulary_segment_card.dart';
import '../../widgets/common/duolingo_button.dart';
import '../transition_screen.dart';
import '../lesson/main_story_screen.dart';
import '../games/games_screen.dart';
import '../../providers/progress_providers.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/tts_provider.dart';
import '../../providers/personalization_providers.dart';
import '../listening_shadowing/listening_shadowing_screen.dart';
import '../mini_story/mini_story_screen.dart';
import '../../../data/sources/content_db.dart';
import '../interview/interview_parser.dart';
import '../interview/character_interview_screen.dart';
import '../interview/interview_summary_screen.dart';
import '../../../core/utils/navigation_utils.dart';

/// Pantalla de Vocabulary Story
/// Muestra la introducción de vocabulario del episodio con segmentos interactivos
class VocabularyStoryScreen extends ConsumerStatefulWidget {
  final Episode episode;

  const VocabularyStoryScreen({
    super.key,
    required this.episode,
  });

  @override
  ConsumerState<VocabularyStoryScreen> createState() =>
      _VocabularyStoryScreenState();
}

class _VocabularyStoryScreenState
    extends ConsumerState<VocabularyStoryScreen>
    with SingleTickerProviderStateMixin {
  int _currentSegmentIndex = 0;
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late final List<VocabularySegment> _shuffledSegments;

  @override
  void initState() {
    super.initState();
    final originalSegments = widget.episode.vocabularyStory?.segments ?? [];
    _shuffledSegments = List<VocabularySegment>.from(originalSegments)
      ..shuffle(Random());
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    ref.read(ttsServiceProvider).stop();
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _stopTtsAndClose() {
    ref.read(ttsServiceProvider).stop();
  }

  void _nextSegment() {
    if (_currentSegmentIndex < _shuffledSegments.length - 1) {
      setState(() {
        _currentSegmentIndex++;
      });
      _pageController.animateToPage(
        _currentSegmentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Completed vocabulary story - navigate to next section
      _completeVocabularyStory();
    }
  }

  void _previousSegment() {
    if (_currentSegmentIndex > 0) {
      setState(() {
        _currentSegmentIndex--;
      });
      _pageController.animateToPage(
        _currentSegmentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _completeVocabularyStory() {
    ref.read(markSectionCompletedProvider)(
      episodeNumber: widget.episode.episodeMetadata.episodeNumber,
      sectionId: SectionProgressIds.vocab,
    );
    _openMiniStoryOrNext();
  }

  void _openMiniStoryOrNext() {
    final miniStory = widget.episode.miniStory;
    if (miniStory != null && miniStory.paragraphs.isNotEmpty) {
      Navigator.of(context, rootNavigator: true)
          .push(
            MaterialPageRoute(
              builder: (_) => MiniStoryScreen(episode: widget.episode),
            ),
          )
          .then((_) => _openListeningShadowingOrTransition());
      return;
    }
    _openListeningShadowingOrTransition();
  }

  void _openListeningShadowingOrTransition() {
    final listening = widget.episode.listeningShadowing;
    if (listening != null && listening.data.isNotEmpty) {
      Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => ListeningShadowingScreen(
            episode: widget.episode,
            onComplete: () {
              final navigator = Navigator.of(context, rootNavigator: true);
              if (navigator.canPop()) {
                navigator.pop();
              }
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                _openTransitionScreen();
              });
            },
          ),
        ),
      );
      return;
    }
    _openTransitionScreen();
  }

  void _openTransitionScreen() {
    // Obtener texto de transición
    final transitionText = widget.episode.contentWrappers.transition;

    // Navegar a pantalla de transición (que detectará personajes nuevos)
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => TransitionScreen(
          transitionText: transitionText,
          episode: widget.episode,
          onContinue: () {
            final navigator = Navigator.of(context, rootNavigator: true);
            if (navigator.canPop()) {
              navigator.pop();
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              _navigateToMainStory();
            });
          },
        ),
      ),
    );
  }

  void _navigateToMainStory() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => MainStoryScreen(
          episode: widget.episode,
          onComplete: () {
            _handleStoryComplete();
          },
        ),
      ),
    );
  }

  Future<void> _handleStoryComplete() async {
    debugPrint(
      'INTERVIEW_FLOW story_complete episode=${widget.episode.episodeMetadata.episodeNumber}',
    );
    final navigator = Navigator.of(context, rootNavigator: true);
    if (navigator.canPop()) {
      navigator.pop();
    }
    await Future.delayed(Duration.zero);
    await _showPendingInterviewBeforeGames();
    if (!mounted) return;
    _navigateToGames();
  }

  Future<void> _showPendingInterviewBeforeGames() async {
    final progressRepo = ref.read(progressRepositoryProvider);
    final episodeNumber = widget.episode.episodeMetadata.episodeNumber;
    final level = widget.episode.episodeMetadata.internalLevel;
    final db = ContentDb();
    final dbEntries = await db.getInterviewEntries(episodeNumber);
    debugPrint(
      'INTERVIEW_FLOW db_entries episode=$episodeNumber entries=${dbEntries.map((e) => '${e.characterId}:${e.interviewId}').toList()}',
    );
    final candidates = [...widget.episode.characters.appearingInEpisode];
    candidates.sort(
      (a, b) => (b.firstAppearance ? 1 : 0) - (a.firstAppearance ? 1 : 0),
    );

    debugPrint(
      'INTERVIEW_FLOW before_games episode=$episodeNumber candidates=${candidates.map((c) => c.characterId).toList()}',
    );

    final entries = dbEntries.isNotEmpty
        ? dbEntries.where((e) => _matchesLevel(e.interviewId, level)).toList()
        : candidates.map((c) {
            return InterviewDbEntry(
              episodeNumber: episodeNumber,
              characterId: c.characterId,
              interviewId: 'default',
              json: '',
            );
          }).toList()
      ..shuffle(Random());

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
        'INTERVIEW_FLOW check episode=$episodeNumber characterId=$id interviewId=$interviewId completed=$completed',
      );
      if (completed) continue;

      final fallbackName = _resolveCharacterName(id, candidates);
      final interview = await _loadCharacterInterview(
        episodeNumber: episodeNumber,
        characterId: id,
        interviewId: interviewId,
        characterName: fallbackName,
      );
      debugPrint(
        'INTERVIEW_FLOW loaded episode=$episodeNumber characterId=$id interviewId=$interviewId found=${interview != null}',
      );
      if (!mounted) return;
      if (interview == null) continue;

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

  String _resolveCharacterName(
    String characterId,
    List<dynamic> candidates,
  ) {
    var normalized = characterId.trim().toLowerCase();
    if (normalized.startsWith('char_')) {
      normalized = normalized.substring('char_'.length);
    }
    for (final character in candidates) {
      var candidateId =
          character.characterId.toString().trim().toLowerCase();
      if (candidateId.startsWith('char_')) {
        candidateId = candidateId.substring('char_'.length);
      }
      if (candidateId == normalized) {
        return character.defaultName;
      }
    }
    return normalized;
  }

  bool _matchesLevel(String interviewId, String level) {
    if (interviewId.isEmpty || interviewId == 'default') return true;
    final needle = 'episode_${level.toLowerCase()}_';
    return interviewId.toLowerCase().contains(needle);
  }

  Future<CharacterInterview?> _loadCharacterInterview({
    required int episodeNumber,
    required String characterId,
    required String interviewId,
    required String characterName,
  }) async {
    var fileName = characterId.toLowerCase().replaceAll(' ', '_');
    if (fileName.startsWith('char_')) {
      fileName = fileName.substring('char_'.length);
    }
    try {
      final db = ContentDb();
      final dbJson = await db.getInterviewJson(
        episodeNumber: episodeNumber,
        characterId: fileName,
        interviewId: interviewId,
      );
      debugPrint(
        'INTERVIEW_FLOW load_db episode=$episodeNumber character=$fileName interviewId=$interviewId found=${dbJson != null}',
      );
      if (dbJson != null) {
        return InterviewParser.parse(
          dbJson,
          episodeNumber: episodeNumber,
          fallbackName: characterName,
        );
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  void _navigateToGames() async {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => GamesScreen(
          episode: widget.episode,
          pointsFromStory: 0, // TODO: pasar puntos reales de MainStoryScreen
          onComplete: (totalPoints, maxPoints) async {
            // Cerrar GamesScreen y VocabularyStoryScreen, volver a home
            Navigator.pop(context); // Close games screen
            Navigator.pop(context); // Close vocabulary screen

            // Calcular estrellas basadas en desempeño de juegos
            final stars = _calculateStars(totalPoints, maxPoints);

            // Marcar episodio como completado
            await ref.read(completeEpisodeProvider)(
              episodeNumber: widget.episode.episodeMetadata.episodeNumber,
              starsEarned: stars,
              xpEarned: totalPoints,
            );
            
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Episode completed! 🎉'),
                backgroundColor: AppColors.successGreen,
              ),
            );
          },
        ),
      ),
    );
  }

  int _calculateStars(int points, int maxPoints) {
    if (maxPoints <= 0) return 3;
    final ratio = points / maxPoints;
    if (ratio >= 0.9) return 3;
    if (ratio >= 0.65) return 2;
    if (ratio >= 0.35) return 1;
    return 0;
  }

  Future<void> _playTextForSegment(VocabularySegment segment) async {
    final template = ref.read(templateVariableServiceProvider);
    final rawText = segment.text.en;
    final text = template.replaceVariables(rawText);

    if (text.trim().isEmpty) return;
    final tts = ref.read(ttsServiceProvider);
    await tts.speak(text);
  }

  Future<void> _playWordForSegment(VocabularySegment segment) async {
    final rawWord = segment.wordFocus ?? '';
    if (rawWord.trim().isEmpty) return;
    final template = ref.read(templateVariableServiceProvider);
    final word = template.replaceVariables(rawWord);
    if (word.trim().isEmpty) return;
    final tts = ref.read(ttsServiceProvider);
    await tts.speak(word);
  }

  @override
  Widget build(BuildContext context) {
    // Esperar a que las variables personalizadas estén cargadas
    ref.watch(personalizationInitProvider);
    // Escuchar cambios en las variables del template para reconstruir
    ref.watch(templateVersionProvider);

    final vocabularyStory = widget.episode.vocabularyStory;

    // Si no hay vocabulary story, mostrar error
    if (vocabularyStory == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('No vocabulary story available for this episode.'),
        ),
      );
    }
    
    final totalSegments = _shuffledSegments.length;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          _stopTtsAndClose();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: AppColors.textPrimary),
            onPressed: () {
              _stopTtsAndClose();
              NavigationUtils.closeToHome(context);
            },
          ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vocabularyStory.title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Episode ${widget.episode.episodeMetadata.episodeNumber}',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          // Progress indicator with animation
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: Text(
                  '${_currentSegmentIndex + 1}/$totalSegments',
                  key: ValueKey<int>(_currentSegmentIndex),
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Progress bar with animation
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: _currentSegmentIndex / totalSegments,
                end: (_currentSegmentIndex + 1) / totalSegments,
              ),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  backgroundColor: AppColors.cardBackground,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primaryGreen,
                  ),
                  minHeight: 6,
                );
              },
            ),

            // Segments (swipeable)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: totalSegments,
                onPageChanged: (index) {
                  setState(() {
                    _currentSegmentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return VocabularySegmentCard(
                    segment: _shuffledSegments[index],
                    onNext: _nextSegment,
                    isLastSegment: index == totalSegments - 1,
                    onPlayWord:
                        (_shuffledSegments[index].wordFocus?.trim().isNotEmpty ??
                                false)
                            ? () => _playWordForSegment(_shuffledSegments[index])
                            : null,
                    onPlayText: () =>
                        _playTextForSegment(_shuffledSegments[index]),
                  );
                },
              ),
            ),

            // Navigation buttons
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      // Previous button
                      if (_currentSegmentIndex > 0) ...[
                        Expanded(
                          child: DuolingoButton(
                            text: 'Anterior',
                            onPressed: _previousSegment,
                            isSecondary: true,
                            icon: Icons.arrow_back,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],

                      // Next/Continue button
                      Expanded(
                        flex: _currentSegmentIndex > 0 ? 1 : 1,
                        child: DuolingoButton(
                          text: _currentSegmentIndex == totalSegments - 1
                              ? 'Continuar'
                              : 'Continuar',
                          onPressed: _nextSegment,
                          icon: _currentSegmentIndex == totalSegments - 1
                              ? Icons.check_circle
                              : Icons.arrow_forward,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
