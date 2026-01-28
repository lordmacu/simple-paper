import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../widgets/common/duolingo_button.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/models/content_wrappers/content_wrappers.dart';
import '../../domain/models/episode/episode.dart';
import '../../domain/models/character/unlocked_character.dart';
import '../providers/character_providers.dart';
import '../providers/template_variable_provider.dart';
import 'character_unlock_screen.dart';
import 'interview/character_interview_screen.dart';
import 'interview/interview_summary_screen.dart';

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
        _showCharacterUnlocks(charactersToShow, 0);
      } else {
        // Todos los personajes ya están desbloqueados
        widget.onContinue();
      }
    } else {
      // No hay personajes nuevos, continuar directamente
      widget.onContinue();
    }
  }

  /// Muestra las pantallas de unlock en secuencia y guarda los personajes
  Future<void> _showCharacterUnlocks(List<dynamic> characters, int index) async {
    if (index >= characters.length) {
      // Terminamos de mostrar todos los personajes
      widget.onContinue();
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

    // Intentar mostrar entrevista solo si es nuevo
    final interview = await _loadCharacterInterview(
      episodeNumber: widget.episode.episodeMetadata.episodeNumber,
      characterId: character.characterId,
      characterName: character.defaultName,
    );

    if (!mounted) return;

    if (interview != null) {
      final result = await Navigator.push<Map<String, int>?>(
        context,
        MaterialPageRoute(
          builder: (_) => CharacterInterviewScreen(
            interview: interview,
            onComplete: (correct, total) {
              Navigator.pop<Map<String, int>?>(context, {
                'correct': correct,
                'total': total,
              });
            },
          ),
        ),
      );

      if (mounted && result != null) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InterviewSummaryScreen(
              correct: result['correct'] ?? 0,
              total: result['total'] ?? interview.questions.length,
              grammarPoints: interview.grammarPoints,
              vocabularyUsed: interview.vocabularyUsed,
              onContinue: () => Navigator.pop(context),
            ),
          ),
        );
      }
    }

    // Mostrar siguiente personaje o continuar
    if (mounted) {
      _showCharacterUnlocks(characters, index + 1);
    }
  }

  /// Carga la entrevista desde assets si existe
  Future<CharacterInterview?> _loadCharacterInterview({
    required int episodeNumber,
    required String characterId,
    required String characterName,
  }) async {
    final ep = episodeNumber.toString().padLeft(2, '0');
    final fileName = characterId.toLowerCase().replaceAll(' ', '_');
    final path = 'assets/character_interviews/episode_a1_$ep/${fileName}_interview.json';

    try {
      final jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> data = jsonDecode(jsonString)['character_interview'];
      final questions = (data['questions'] as List<dynamic>).map((q) {
        final opts = (q['options'] as List<dynamic>).map((o) {
          return InterviewOption(
            optionId: o['option_id'] ?? '',
            textEn: o['text_en'] ?? '',
            textEs: o['text_es'] ?? '',
            isCorrect: o['is_correct'] ?? false,
            feedbackEn: o['feedback_en'] ?? '',
            feedbackEs: o['feedback_es'] ?? '',
            grammarExplanation: o['grammar_explanation'],
            culturalNote: o['cultural_note'],
            mistakeType: o['mistake_type'],
          );
        }).toList();

        return InterviewQuestion(
          questionEn: q['question']['text_en'] ?? '',
          questionEs: q['question']['text_es'] ?? '',
          options: opts,
        );
      }).toList();

      return CharacterInterview(
        characterName: data['character_name'] ?? characterName,
        avatarUrl: data['avatar_url'] ?? '',
        episodeNumber: episodeNumber,
        introEn: data['introduction']['text_en'] ?? '',
        introEs: data['introduction']['text_es'] ?? '',
        questions: questions,
      );
    } catch (_) {
      // Si no existe o falla parseo, devolver null
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: FadeTransition(
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
                    text: 'Continue to Story',
                    onPressed: _handleContinue,
                    icon: Icons.arrow_forward,
                  ),
                ),
              ],
            ),
          ),
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
