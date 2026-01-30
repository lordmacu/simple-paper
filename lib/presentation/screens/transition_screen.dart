import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/common/duolingo_button.dart';
import '../../core/constants/app_colors.dart';
import '../../data/sources/content_db.dart';
import '../../domain/models/content_wrappers/content_wrappers.dart';
import '../../domain/models/episode/episode.dart';
import '../../domain/models/character/unlocked_character.dart';
import '../providers/character_providers.dart';
import '../providers/template_variable_provider.dart';
import '../providers/progress_providers.dart';
import '../../core/utils/section_progress.dart';
import 'character_unlock_screen.dart';
import 'interview/character_interview_screen.dart';
import 'interview/interview_summary_screen.dart';
import 'interview/interview_parser.dart';
import '../../core/utils/navigation_utils.dart';

/// Pantalla de transición que se muestra entre Vocabulary Story y Main Story
/// Muestra texto motivacional bilingüe antes de continuar con las escenas
class TransitionScreen extends ConsumerStatefulWidget {
  final BilingualText transitionText;
  final Episode episode;
  final VoidCallback onContinue;

  const TransitionScreen({
    Key? key,
    required this.transitionText,
    required this.episode,
    required this.onContinue,
  }) : super(key: key);

  @override
  ConsumerState<TransitionScreen> createState() => _TransitionScreenState();
}

class _TransitionScreenState extends ConsumerState<TransitionScreen>
    with SingleTickerProviderStateMixin {
  static const String _logTag = 'INTERVIEW_FLOW';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
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
    super.dispose();
  }

  /// Detecta personajes con first_appearance: true y muestra pantalla de unlock
  Future<void> _handleContinue() async {
    // Buscar personajes nuevos en el episodio
    final newCharacters = widget.episode.characters.appearingInEpisode
        .where((character) => character.firstAppearance)
        .toList();

    if (newCharacters.isNotEmpty) {
      // Filtrar solo los personajes que NO han sido desbloqueados previamente
      final repository = ref.read(characterRepositoryProvider);
      final charactersToUnlock = <dynamic>[];
      
      for (final character in newCharacters) {
        final isUnlocked = await repository.isCharacterUnlocked(character.characterId);
        if (!isUnlocked) {
          charactersToUnlock.add(character);
        }
      }
      
      if (charactersToUnlock.isNotEmpty) {
        // Limitar a máximo 2 personajes por vez
        final charactersToShow = charactersToUnlock.take(2).toList();

        // Mostrar pantalla de unlock para cada personaje nuevo
        await _showCharacterUnlocks(charactersToShow, 0);
      }
    }

    widget.onContinue();
  }

  /// Muestra las pantallas de unlock en secuencia y guarda los personajes
  Future<void> _showCharacterUnlocks(List<dynamic> characters, int index) async {
    if (index >= characters.length) {
      return;
    }

    final character = characters[index];
    
    // Guardar el personaje como desbloqueado
    final repository = ref.read(characterRepositoryProvider);
    final unlockedCharacter = UnlockedCharacter(
      characterId: character.characterId,
      defaultName: character.defaultName,
      customName: null, // Se actualizará si el usuario lo renombra
      unlockedAt: DateTime.now().millisecondsSinceEpoch,
      episodeNumber: widget.episode.episodeMetadata.episodeNumber,
    );
    
    await repository.unlockCharacter(unlockedCharacter);

    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterUnlockScreen(
          character: character,
          onContinue: () => Navigator.pop(context),
        ),
      ),
    );

    // Mostrar siguiente personaje o continuar
    if (mounted) {
      await _showCharacterUnlocks(characters, index + 1);
    }
  }

  Future<void> _showPendingInterview() async {
    final progressRepo = ref.read(progressRepositoryProvider);
    final episodeNumber = widget.episode.episodeMetadata.episodeNumber;
    final level = widget.episode.episodeMetadata.internalLevel;
    final candidates = [...widget.episode.characters.appearingInEpisode];
    candidates.sort(
      (a, b) => (b.firstAppearance ? 1 : 0) - (a.firstAppearance ? 1 : 0),
    );

    for (final character in candidates) {
      final completed = await progressRepo.isInterviewCompleted(
        level: level,
        episodeNumber: episodeNumber,
        characterId: character.characterId,
        interviewId: 'default',
      );
      if (completed) {
        continue;
      }

      final interview = await _loadCharacterInterview(
        episodeNumber: episodeNumber,
        characterId: character.characterId,
        interviewId: 'default',
        characterName: character.defaultName,
      );

      if (!mounted) return;
      if (interview == null) {
        continue;
      }

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
          characterId: character.characterId,
          interviewId: 'default',
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

  /// Carga la entrevista desde assets si existe
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
      if (dbJson != null) {
        debugPrint('$_logTag load_db episode=$episodeNumber character=$fileName');
        return InterviewParser.parse(
          dbJson,
          episodeNumber: episodeNumber,
          fallbackName: characterName,
        );
      }
      debugPrint('$_logTag load_db_missing episode=$episodeNumber character=$fileName');
      return null;
    } catch (e) {
      // Si no existe o falla parseo, devolver null
      debugPrint('$_logTag load_fail db episode=$episodeNumber character=$fileName error=$e');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    // Escuchar cambios en las variables del template para reconstruir
    ref.watch(templateVersionProvider);
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    // Header con icono decorativo
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: _buildHeader(),
                    ),

                    // Contenido principal
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            _buildTransitionCard(),
                            const SizedBox(height: 60),
                          ],
                        ),
                      ),
                    ),

                    // Botón Continue
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: DuolingoButton(
                        text: 'Continuar',
                        onPressed: _handleContinue,
                        icon: Icons.arrow_forward,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close, color: AppColors.textPrimary),
                onPressed: () => NavigationUtils.closeToHome(context),
                tooltip: 'Cerrar',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Icono de estrella con animación
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.star_rounded,
                  size: 48,
                  color: AppColors.primaryGreen,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        
        // Título
        Text(
          'Great Job!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        
        // Subtítulo
        Text(
          'You learned the vocabulary',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTransitionCard() {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Texto en inglés
                _buildTextSection(
                  language: 'English',
                  text: ref.read(templateVariableServiceProvider)
                      .replaceVariables(widget.transitionText.en),
                  icon: Icons.translate,
                  color: AppColors.secondaryBlue,
                ),
                
                const SizedBox(height: 24),
                
                // Divider decorativo
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.textSecondary.withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Texto en español
                _buildTextSection(
                  language: 'Español',
                  text: ref.read(templateVariableServiceProvider)
                      .replaceVariables(widget.transitionText.es),
                  icon: Icons.translate,
                  color: AppColors.warningOrange,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextSection({
    required String language,
    required String text,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Language label
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: color,
            ),
            const SizedBox(width: 8),
            Text(
              language,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: color,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        // Transition text
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            height: 1.6,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
