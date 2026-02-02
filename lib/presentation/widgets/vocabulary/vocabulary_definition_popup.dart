import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/core/utils/difficulty_color_helper.dart';
import 'package:office_app/core/utils/vocabulary_icon_helper.dart';
import '../../../core/constants/app_colors.dart';
import '../../../domain/models/vocabulary/vocabulary_word.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/tts_provider.dart';
import '../atoms/info_chip.dart';
import '../atoms/primary_button.dart';
import '../molecules/modal_overlay_base.dart';
import '../molecules/bilingual_text_card.dart';

/// Popup de definición de vocabulario.
///
/// Muestra la palabra, traducción, tipo, y ejemplo en contexto.
class VocabularyDefinitionPopup extends ConsumerStatefulWidget {
  /// Palabra de vocabulario a mostrar.
  final VocabularyWord word;

  /// Callback cuando se cierra el popup.
  final VoidCallback onClose;

  /// Crea un [VocabularyDefinitionPopup].
  const VocabularyDefinitionPopup({
    required this.word,
    required this.onClose,
    super.key,
  });

  @override
  ConsumerState<VocabularyDefinitionPopup> createState() =>
      _VocabularyDefinitionPopupState();
}

class _VocabularyDefinitionPopupState
    extends ConsumerState<VocabularyDefinitionPopup> {
  Future<void> _speakWord() async {
    final template = ref.read(templateVariableServiceProvider);
    final text = template.replaceVariables(widget.word.word);
    if (text.trim().isEmpty) {
      return;
    }
    final tts = ref.read(ttsServiceProvider);
    await tts.speak(text);
  }

  Future<void> _speakExample(String exampleEn) async {
    if (exampleEn.trim().isEmpty) {
      return;
    }
    final tts = ref.read(ttsServiceProvider);
    await tts.speak(exampleEn);
  }

  @override
  Widget build(BuildContext context) {
    final template = ref.read(templateVariableServiceProvider);
    final exampleEn = template.replaceVariables(widget.word.contextSentence);
    final exampleEs = template.replaceVariables(widget.word.contextSentenceEs);
    return BaseModalOverlay(
      onClose: widget.onClose,
      alignment: Alignment.center,
      slideFrom: const Offset(0, 0.05),
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 300),
        tween: Tween(begin: 0.0, end: 1.0),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Opacity(
              opacity: value.clamp(0.0, 1.0),
              child: child,
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                        // Header con la palabra
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primaryGreen,
                                AppColors.secondaryBlue,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  // Palabra en inglés
                                  GestureDetector(
                                    onTap: _speakWord,
                                    child: Text(
                                      widget.word.word.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 1.5,
                                        decoration: TextDecoration.none,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // Traducción
                                  Text(
                                    widget.word.translationEs,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white.withValues(alpha: 0.9),
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: IconButton(
                                  tooltip: 'Escuchar palabra',
                                  onPressed: _speakWord,
                                  icon: const Icon(
                                    Icons.volume_up,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Contenido
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Tipo de palabra
                              Row(
                                children: [
                                  InfoChip(
                                    label: widget.word.wordType,
                                    icon: vocabularyIconForType(widget.word.wordType),
                                    color: AppColors.primaryGreen,
                                  ),
                                  const SizedBox(width: 12),
                                  
                                  // Nivel de dificultad
                                  InfoChip(
                                    label: 'Level ${widget.word.difficulty}',
                                    icon: Icons.bar_chart,
                                    color: difficultyColor(widget.word.difficulty),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24),

                              // Ejemplo en contexto
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.cardBackground,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppColors.secondaryBlue.withValues(alpha: 0.2),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Label
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.chat_bubble_outline,
                                          size: 16,
                                          color: AppColors.secondaryBlue,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Example',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.secondaryBlue,
                                            letterSpacing: 0.5,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    
                                    // Ejemplo en inglés
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () => _speakExample(exampleEn),
                                          child: const Icon(
                                            Icons.play_circle_filled,
                                            size: 18,
                                            color: AppColors.primaryGreen,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () => _speakExample(exampleEn),
                                            child: BilingualTextCard(
                                              textEn: exampleEn,
                                              textEs: exampleEs,
                                              backgroundColor: Colors.transparent,
                                              padding: EdgeInsets.zero,
                                              enStyle: const TextStyle(
                                                fontSize: 15,
                                                color: AppColors.textPrimary,
                                                height: 1.5,
                                                decoration: TextDecoration.none,
                                              ),
                                              esStyle: const TextStyle(
                                                fontSize: 14,
                                                color: AppColors.textSecondary,
                                                fontStyle: FontStyle.italic,
                                                height: 1.4,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Botón cerrar
                              SizedBox(
                                width: double.infinity,
                                child: PrimaryButton(
                                  text: 'OK',
                                  onPressed: widget.onClose,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
