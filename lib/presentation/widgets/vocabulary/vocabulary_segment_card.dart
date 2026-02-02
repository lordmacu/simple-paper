import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/core/constants/app_colors.dart';
import 'package:office_app/domain/models/vocabulary/vocabulary_segment.dart';
import 'package:office_app/presentation/providers/template_variable_provider.dart';
import 'package:office_app/core/utils/haptic_utils.dart';
import 'package:office_app/presentation/widgets/molecules/interactive_input_card.dart';
import 'package:office_app/presentation/widgets/molecules/vocabulary_image_block.dart';
import 'package:office_app/core/utils/vocabulary_icon_helper.dart';

/// Card que muestra un segmento individual de vocabulario.
///
/// Presenta imagen, texto bilingüe, palabra enfatizada y ayudas visuales.
class VocabularySegmentCard extends ConsumerStatefulWidget {
  /// El segmento de vocabulario a mostrar.
  final VocabularySegment segment;

  /// Callback cuando el usuario avanza al siguiente segmento.
  final VoidCallback onNext;

  /// Indica si es el último segmento de la secuencia.
  final bool isLastSegment;

  /// Callback para reproducir la pronunciación de la palabra.
  final VoidCallback? onPlayWord;

  /// Callback para reproducir el texto completo.
  final VoidCallback? onPlayText;

  /// Crea un [VocabularySegmentCard].
  const VocabularySegmentCard({
    required this.segment,
    required this.onNext,
    super.key,
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
                  child: VocabularyImageBlock(
                    word: widget.segment.wordFocus ?? '',
                    icon: vocabularyIconForWord(
                      widget.segment.wordFocus ?? '',
                    ),
                    onPlay: widget.onPlayWord == null
                        ? null
                        : HapticUtils.wrap(widget.onPlayWord),
                    borderColor: AppColors.primaryGreen.withValues(alpha: 0.3),
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
                        onTap: HapticUtils.wrap(widget.onPlayText),
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
                  child: _buildInteractiveInput(widget.segment.interactive!),
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
            : AppColors.primaryGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSpanish
              ? AppColors.textSecondary.withValues(alpha: 0.2)
              : AppColors.primaryGreen.withValues(alpha: 0.3),
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
    VocabularyInteractive interactive,
  ) {
    return InteractiveInputCard(
      question: interactive.question,
      questionEs: interactive.questionEs,
      controller: _inputController,
      hintText: interactive.example,
      onSubmitted: (value) {
        _saveInteractiveInput(interactive.saveAs, value);
        widget.onNext();
      },
    );
  }

  /// Guarda el valor del input interactivo en el template variable service
  void _saveInteractiveInput(String variableName, String value) {
    if (value.trim().isEmpty) {
      return;
    }
    
    final service = ref.read(templateVariableServiceProvider);
    service.updateVariable(variableName, value.trim());
    
    // Actualiza el provider del nombre del jugador si es player_name
    if (variableName == 'player_name' || variableName == 'player_name_vocab') {
      ref.read(playerNameProvider.notifier).state = value.trim();
    }
  }

}
