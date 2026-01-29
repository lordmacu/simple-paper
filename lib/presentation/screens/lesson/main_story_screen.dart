import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/common/duolingo_button.dart';
import '../../widgets/common/translation_overlay.dart';
import '../../../core/constants/app_colors.dart';
import '../../../domain/models/episode/episode.dart';
import '../../../domain/models/story/scene.dart';
import '../../../domain/models/story/dialogue.dart';
import '../../../domain/models/vocabulary/vocabulary_word.dart';
import '../../../core/utils/section_progress.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/progress_providers.dart';
import '../../widgets/story/character_dialogue_bubble.dart';
import '../../widgets/story/choice_buttons.dart';
import '../../widgets/story/scene_header.dart';
import '../../widgets/story/scene_transition.dart';
import '../../widgets/vocabulary/vocabulary_definition_popup.dart';
import '../review_words/review_words_screen.dart';
import 'story_summary_screen.dart';

/// Pantalla principal de escenas del episodio
/// Muestra los diálogos secuencialmente con personajes
class MainStoryScreen extends ConsumerStatefulWidget {
  final Episode episode;
  final VoidCallback onComplete;
  final int initialSceneIndex;

  const MainStoryScreen({
    Key? key,
    required this.episode,
    required this.onComplete,
    this.initialSceneIndex = 0,
  }) : super(key: key);

  @override
  ConsumerState<MainStoryScreen> createState() => _MainStoryScreenState();
}

class _MainStoryScreenState extends ConsumerState<MainStoryScreen>
    with SingleTickerProviderStateMixin {
  _SpeakerSide _speakerSide(String? characterId) {
    if (characterId == null || characterId.isEmpty) {
      return _SpeakerSide.leftAvatarRightBubble;
    }
    final ids = <String>[];
    for (final d in _currentScene.dialogue) {
      final id = d.characterId;
      if (id == null || id.isEmpty) continue;
      if (!ids.contains(id)) ids.add(id);
      if (ids.length >= 2) break;
    }
    if (ids.isEmpty) {
      return _SpeakerSide.leftAvatarRightBubble;
    }
    if (ids.length == 1) {
      return _SpeakerSide.leftAvatarRightBubble;
    }
    if (characterId == ids.first) {
      return _SpeakerSide.rightAvatarLeftBubble;
    }
    if (characterId == ids[1]) {
      return _SpeakerSide.leftAvatarRightBubble;
    }
    return _SpeakerSide.leftAvatarRightBubble;
  }
  static const String _logTag = '[MainStory]';
  late int _currentSceneIndex;
  int _currentDialogueIndex = 0;
  int _totalPoints = 0;
  final ScrollController _scrollController = ScrollController();
  bool _showingChoices = false;
  bool _showingSceneTransition = false;
  bool _showingSceneTranslation = false;
  String? _selectedChoiceId;
  
  // Lista de diálogos mostrados hasta ahora en la escena actual
  final List<Dialogue> _displayedDialogues = [];

  // Resultados de respuestas
  int _totalChoices = 0;
  int _correctChoices = 0;
  int _incorrectChoices = 0;
  int _incorrectChoicesWithoutVocab = 0;
  bool _showingSummary = false;
  final Set<String> _reviewWords = {};

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _currentSceneIndex = widget.initialSceneIndex.clamp(
      0,
      widget.episode.scenes.data.isEmpty
          ? 0
          : widget.episode.scenes.data.length - 1,
    );
    _setupAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Scene get _currentScene => widget.episode.scenes.data[_currentSceneIndex];
  Dialogue get _currentDialogue => _currentScene.dialogue[_currentDialogueIndex];

  int get _totalScenes => widget.episode.scenes.data.length;
  int get _totalDialogues => _currentScene.dialogue.length;

  /// Avanza al siguiente diálogo o escena
  void _handleNext() {
    setState(() {
      // Agregar el diálogo actual a la lista de mostrados
      if (!_displayedDialogues.contains(_currentDialogue)) {
        _displayedDialogues.add(_currentDialogue);
      }
      
      if (_currentDialogueIndex < _totalDialogues - 1) {
        // Siguiente diálogo en la misma escena
        _currentDialogueIndex++;
        _resetAnimation();
      } else if (_currentSceneIndex < _totalScenes - 1) {
        // Mostrar transición a la siguiente escena
        _showingSceneTransition = true;
      } else {
        // Completado
        _showStorySummary();
      }
    });
    _scheduleScrollToBottom();
  }

  /// Continúa a la siguiente escena después de la transición
  void _continueToNextScene() {
    setState(() {
      _showingSceneTransition = false;
      _currentSceneIndex++;
      _currentDialogueIndex = 0;
      // Limpiar diálogos mostrados al cambiar de escena
      _displayedDialogues.clear();
      _resetAnimation();
    });
    _scheduleScrollToBottom();
  }

  /// Maneja la selección de una opción
  void _handleChoiceSelected(String choiceId, int points) {
    final choices = _currentDialogue.choices;
    final maxPoints = choices.isNotEmpty
        ? choices.map((choice) => choice.points).reduce((a, b) => a > b ? a : b)
        : 0;
    final selectedChoice = choices.firstWhere(
      (choice) => choice.choiceId == choiceId,
    );
    final isCorrect = selectedChoice.points == maxPoints;

    setState(() {
      _selectedChoiceId = choiceId;
      _totalPoints += points;
      _totalChoices += 1;
      if (isCorrect) {
        _correctChoices += 1;
      } else {
        _incorrectChoices += 1;
        final vocabFromChoice = selectedChoice.vocabUsed.isNotEmpty
            ? selectedChoice.vocabUsed
            : _extractVocabFromText(selectedChoice.text);
        if (vocabFromChoice.isNotEmpty) {
          _reviewWords.addAll(vocabFromChoice);
        } else {
          _incorrectChoicesWithoutVocab += 1;
        }
      }
    });
    // Esperar un momento para mostrar feedback antes de continuar
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _showingChoices = false;
          _selectedChoiceId = null;
        });
        _handleNext();
      }
    });
  }

  List<String> _extractVocabFromText(String text) {
    final lower = text.toLowerCase();
    final found = <String>{};

    for (final vocab in widget.episode.vocabularyFocus.targetWords) {
      final word = vocab.word.toLowerCase();
      if (lower.contains(word)) {
        found.add(vocab.word);
      }
    }

    return found.toList();
  }

  Future<void> _showStorySummary() async {
    if (_showingSummary) return;
    _showingSummary = true;

    final wordsToReview = _reviewWords.toList()..sort();

    if (!mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StorySummaryScreen(
          correctChoices: _correctChoices,
          incorrectChoices: _incorrectChoices,
          wordsToReview: wordsToReview,
          learnedWords: widget.episode.vocabularyFocus.targetWords,
          onReviewWords: () async {
            await ref.read(addReviewWordsProvider)(
              words: wordsToReview,
              level: widget.episode.episodeMetadata.internalLevel,
              episodeNumber: widget.episode.episodeMetadata.episodeNumber,
            );
            if (!mounted) return;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ReviewWordsScreen(),
              ),
            );
          },
          onContinue: () async {
            debugPrint('$_logTag onContinue start');
            if (wordsToReview.isNotEmpty) {
              debugPrint('$_logTag adding review words: ${wordsToReview.length}');
              await ref.read(addReviewWordsProvider)(
                words: wordsToReview,
                level: widget.episode.episodeMetadata.internalLevel,
                episodeNumber: widget.episode.episodeMetadata.episodeNumber,
              );
            }
            debugPrint('$_logTag marking story/scene sections');
            await ref.read(markSectionCompletedProvider)(
              episodeNumber: widget.episode.episodeMetadata.episodeNumber,
              sectionId: SectionProgressIds.story,
            );
            for (final scene in widget.episode.scenes.data) {
              await ref.read(markSectionCompletedProvider)(
                episodeNumber: widget.episode.episodeMetadata.episodeNumber,
                sectionId: SectionProgressIds.sceneId(scene.sceneNumber),
              );
            }
            if (!mounted) return;
            debugPrint('$_logTag onContinue finish -> pop summary + onComplete');
            Navigator.of(context).pop(); // close summary screen
            widget.onComplete();
          },
        ),
      ),
    );
  }

  /// Reinicia la animación
  void _resetAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  /// Aplica variables de template al texto
  String _applyTemplateVars(String text) {
    return ref.read(templateVariableServiceProvider).replaceVariables(text);
  }

  void _scheduleScrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    });
  }

  /// Construye el contenido de la traducción de la escena
  String _buildSceneTranslationContent() {
    final scene = _currentScene;
    final parts = <String>[];
    
    // Ubicación
    if (scene.locationEs.isNotEmpty) {
      parts.add('📍 Ubicación: ${scene.locationEs}');
    }
    
    // Tiempo
    if (scene.timeEs.isNotEmpty) {
      parts.add('🕐 Momento: ${scene.timeEs}');
    }
    
    // Descripción
    if (scene.descriptionEs.isNotEmpty) {
      parts.add('\n${scene.descriptionEs}');
    }
    
    return parts.join('\n\n');
  }

  /// Encuentra la palabra de vocabulario por su texto
  VocabularyWord? _findVocabularyWord(String word) {
    final cleanWord = word.toLowerCase().trim();
    try {
      return widget.episode.vocabularyFocus.targetWords.firstWhere(
        (vocabWord) => vocabWord.word.toLowerCase() == cleanWord,
      );
    } catch (e) {
      return null;
    }
  }

  /// Muestra el popup de definición de vocabulario
  void _showVocabularyDefinition(String word) {
    final vocabularyWord = _findVocabularyWord(word);
    if (vocabularyWord == null) {
      // Si no se encuentra la palabra, mostrar un mensaje simple
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Definition not available for: $word'),
          duration: const Duration(seconds: 1),
        ),
      );
      return;
    }

    // Mostrar el popup
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => VocabularyDefinitionPopup(
        word: vocabularyWord,
        onClose: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.episode.scenes.data.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text(
            'No scenes available for this episode.',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    // Mostrar transición de escena
    if (_showingSceneTransition) {
      final nextScene = widget.episode.scenes.data[_currentSceneIndex + 1];
      return Scaffold(
        backgroundColor: Colors.white,
        body: SceneTransition(
          scene: nextScene,
          onContinue: _continueToNextScene,
        ),
      );
    }

    final isLastDialogue = _currentDialogueIndex == _totalDialogues - 1;
    final isLastScene = _currentSceneIndex == _totalScenes - 1;
    final isComplete = isLastDialogue && isLastScene;

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
              widget.episode.episodeMetadata.title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Scene ${_currentSceneIndex + 1}/$_totalScenes',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          // Puntos acumulados
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Row(
                children: [
                  const Icon(
                    Icons.stars,
                    color: AppColors.warningOrange,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$_totalPoints',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Barra de progreso
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                tween: Tween<double>(
                  begin: (_currentSceneIndex * _totalDialogues + _currentDialogueIndex) /
                      (_totalScenes * _totalDialogues),
                  end: (_currentSceneIndex * _totalDialogues + _currentDialogueIndex + 1) /
                      (_totalScenes * _totalDialogues),
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

              // Contenido principal
          Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header de escena (location y time)
                      SceneHeader(
                        scene: _currentScene,
                        onShowTranslation: () {
                          setState(() {
                            _showingSceneTranslation = true;
                          });
                        },
                      ),

                      const SizedBox(height: 24),

                      // Diálogos previos ya mostrados
                      ..._displayedDialogues.map((dialogue) {
                        final side = _speakerSide(dialogue.characterId);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CharacterDialogueBubble(
                            dialogue: dialogue,
                            episodeCharacters: widget.episode.characters.appearingInEpisode,
                            onVocabTap: _showVocabularyDefinition,
                            avatarOnRight: side == _SpeakerSide.rightAvatarLeftBubble,
                            bubbleAlignRight: side == _SpeakerSide.leftAvatarRightBubble,
                          ),
                        );
                      }),

                      // Diálogo actual (no interactivo)
                      if (!_currentDialogue.isInteractive && !_displayedDialogues.contains(_currentDialogue))
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: CharacterDialogueBubble(
                                dialogue: _currentDialogue,
                                episodeCharacters: widget.episode.characters.appearingInEpisode,
                                onVocabTap: _showVocabularyDefinition,
                                avatarOnRight:
                                    _speakerSide(_currentDialogue.characterId) ==
                                        _SpeakerSide.rightAvatarLeftBubble,
                                bubbleAlignRight:
                                    _speakerSide(_currentDialogue.characterId) ==
                                        _SpeakerSide.leftAvatarRightBubble,
                              ),
                            ),
                          ),
                        ),

                      // Elecciones interactivas (siempre al final)
                      if (_currentDialogue.isInteractive && _currentDialogue.choices.isNotEmpty)
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 32),
                              child: ChoiceButtons(
                                choices: _currentDialogue.choices,
                                selectedChoiceId: _selectedChoiceId,
                                onChoiceSelected: _handleChoiceSelected,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // Botón Continuar (solo si no es interactivo)
              if (!_currentDialogue.isInteractive)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                  child: SafeArea(
                    top: false,
                    bottom: true,
                    minimum: const EdgeInsets.only(bottom: 6),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: DuolingoButton(
                        text: isComplete ? 'Terminar Historia' : 'Continuar',
                        onPressed: _handleNext,
                        icon: isComplete ? Icons.check_circle : Icons.arrow_forward,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Overlay de traducción de escena
          if (_showingSceneTranslation)
            TranslationOverlay(
              title: 'Escena (Español)',
              content: _buildSceneTranslationContent(),
              onClose: () {
                setState(() {
                  _showingSceneTranslation = false;
                });
              },
            ),
        ],
      ),
    );
  }
}

enum _SpeakerSide {
  rightAvatarLeftBubble,
  leftAvatarRightBubble,
}
