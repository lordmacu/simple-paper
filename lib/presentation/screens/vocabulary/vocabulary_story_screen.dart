import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/core/constants/app_colors.dart';
import 'package:office_app/domain/models/episode/episode.dart';
import '../../widgets/vocabulary/vocabulary_segment_card.dart';
import '../../widgets/common/duolingo_button.dart';
import '../transition_screen.dart';
import '../lesson/main_story_screen.dart';
import '../games/games_screen.dart';
import '../../providers/progress_providers.dart';

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

  @override
  void initState() {
    super.initState();
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
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _nextSegment() {
    if (_currentSegmentIndex <
        widget.episode.vocabularyStory!.segments.length - 1) {
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
    // Obtener texto de transición
    final transitionText = widget.episode.contentWrappers.transition;
    
    // Navegar a pantalla de transición (que detectará personajes nuevos)
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => TransitionScreen(
          transitionText: transitionText,
          episode: widget.episode,
          onContinue: () {
            Navigator.pop(context);
            _navigateToMainStory();
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
            // Cerrar MainStoryScreen y navegar a GamesScreen
            Navigator.pop(context);
            _navigateToGames();
          },
        ),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
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
    
    final totalSegments = vocabularyStory.segments.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
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
                    segment: vocabularyStory.segments[index],
                    onNext: _nextSegment,
                    isLastSegment: index == totalSegments - 1,
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
                            text: 'Previous',
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
                              ? 'Continue'
                              : 'Next',
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
    );
  }
}
