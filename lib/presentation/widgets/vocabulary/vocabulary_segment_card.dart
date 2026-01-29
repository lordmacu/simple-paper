import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/core/constants/app_colors.dart';
import 'package:office_app/domain/models/vocabulary/vocabulary_segment.dart';
import 'package:office_app/presentation/providers/template_variable_provider.dart';

/// Card que muestra un segmento individual de vocabulario
/// Con imagen, texto bilingüe, palabra enfatizada y ayudas visuales (emojis)
class VocabularySegmentCard extends ConsumerStatefulWidget {
  final VocabularySegment segment;
  final VoidCallback onNext;
  final bool isLastSegment;
  final VoidCallback? onPlayWord;
  final VoidCallback? onPlayText;

  const VocabularySegmentCard({
    super.key,
    required this.segment,
    required this.onNext,
    this.isLastSegment = false,
    this.onPlayWord,
    this.onPlayText,
  });

  @override
  ConsumerState<VocabularySegmentCard> createState() =>
      _VocabularySegmentCardState();
}

class _VocabularySegmentCardState
    extends ConsumerState<VocabularySegmentCard>
    with SingleTickerProviderStateMixin {
  final TextEditingController _inputController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              // Imagen del vocabulario (con animación de escala)
              if (widget.segment.imageUrl?.isNotEmpty ?? false)
                _buildAnimatedChild(
                  delay: 0,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primaryGreen.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _getIconForWord(widget.segment.wordFocus ?? ''),
                                size: 80,
                                color: AppColors.primaryGreen,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                (widget.segment.wordFocus ?? '').toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryGreen,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.onPlayWord != null)
                          Positioned(
                            right: 12,
                            bottom: 12,
                            child: GestureDetector(
                              onTap: widget.onPlayWord,
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGreen,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.12),
                                      blurRadius: 10,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

              const SizedBox(height: 32),

              // Texto en inglés con palabra enfatizada
              _buildAnimatedChild(
                delay: 200,
                child: widget.onPlayText == null
                    ? _buildTextWithEmphasis(
                        context,
                        widget.segment.text.en,
                        widget.segment.wordFocus ?? '',
                        isSpanish: false,
                      )
                    : GestureDetector(
                        onTap: widget.onPlayText,
                        child: _buildTextWithEmphasis(
                          context,
                          widget.segment.text.en,
                          widget.segment.wordFocus ?? '',
                          isSpanish: false,
                        ),
                      ),
              ),

              const SizedBox(height: 16),

              // Texto en español
              _buildAnimatedChild(
                delay: 300,
                child: _buildTextWithEmphasis(
                  context,
                  widget.segment.text.es,
                  widget.segment.wordFocus ?? '',
                  isSpanish: true,
                ),
              ),

              const SizedBox(height: 32),

              // Input interactivo (si existe)
              if (widget.segment.interactive != null)
                _buildAnimatedChild(
                  delay: 400,
                  child: _buildInteractiveInput(context, widget.segment.interactive!),
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Construye un widget hijo con animación de entrada escalonada
  Widget _buildAnimatedChild({
    required int delay,
    required Widget child,
  }) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 400 + delay),
      curve: Curves.easeOut,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, _) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
    );
  }

  /// Construye el texto con la palabra enfatizada
  Widget _buildTextWithEmphasis(
    BuildContext context,
    String text,
    String wordToEmphasize, {
    required bool isSpanish,
  }) {
    final parts = text.split(RegExp(wordToEmphasize, caseSensitive: false));
    final matches =
        RegExp(wordToEmphasize, caseSensitive: false).allMatches(text);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSpanish
            ? AppColors.cardBackground
            : AppColors.primaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSpanish
              ? AppColors.textSecondary.withOpacity(0.2)
              : AppColors.primaryGreen.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontSize: isSpanish ? 16 : 20,
            color: AppColors.textPrimary,
            height: 1.5,
          ),
          children: _buildTextSpans(parts, matches.toList(), wordToEmphasize),
        ),
      ),
    );
  }

  /// Construye los TextSpans con énfasis
  List<TextSpan> _buildTextSpans(
    List<String> parts,
    List<RegExpMatch> matches,
    String wordToEmphasize,
  ) {
    final List<TextSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      // Agregar parte normal
      spans.add(TextSpan(text: parts[i]));

      // Agregar palabra enfatizada (si no es la última parte)
      if (i < matches.length) {
        spans.add(
          TextSpan(
            text: matches[i].group(0),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.primaryGreen,
              letterSpacing: 1,
            ),
          ),
        );
      }
    }

    return spans;
  }

  /// Construye el input interactivo
  Widget _buildInteractiveInput(
    BuildContext context,
    VocabularyInteractive interactive,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.secondaryBlue.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pregunta en inglés
          Text(
            interactive.question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          
          // Pregunta en español
          Text(
            interactive.questionEs,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          
          // Input field
          TextField(
            controller: _inputController,
            decoration: InputDecoration(
              hintText: interactive.example ?? 'Type here...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.secondaryBlue,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.secondaryBlue,
                  width: 2,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 16),
            onSubmitted: (value) {
              _saveInteractiveInput(interactive.saveAs, value);
              widget.onNext();
            },
          ),
        ],
      ),
    );
  }

  /// Guarda el valor del input interactivo en el template variable service
  void _saveInteractiveInput(String variableName, String value) {
    if (value.trim().isEmpty) return;
    
    final service = ref.read(templateVariableServiceProvider);
    service.updateVariable(variableName, value.trim());
    
    // Actualiza el provider del nombre del jugador si es player_name
    if (variableName == 'player_name' || variableName == 'player_name_vocab') {
      ref.read(playerNameProvider.notifier).state = value.trim();
    }
  }

  /// Obtiene un icono representativo para la palabra
  IconData _getIconForWord(String word) {
    final wordLower = word.toLowerCase();
    
    switch (wordLower) {
      case 'office':
        return Icons.business;
      case 'boss':
        return Icons.person;
      case 'desk':
        return Icons.desk;
      case 'hello':
        return Icons.waving_hand;
      case 'meeting':
        return Icons.groups;
      case 'computer':
        return Icons.computer;
      case 'phone':
        return Icons.phone;
      case 'paper':
        return Icons.description;
      case 'coffee':
        return Icons.coffee;
      case 'work':
        return Icons.work;
      default:
        return Icons.book;
    }
  }
}
