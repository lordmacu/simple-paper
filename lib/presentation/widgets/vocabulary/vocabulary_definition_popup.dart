import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../domain/models/vocabulary/vocabulary_word.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/tts_provider.dart';

/// Popup de definición de vocabulario
/// Muestra la palabra, traducción, tipo, y ejemplo en contexto
class VocabularyDefinitionPopup extends ConsumerStatefulWidget {
  final VocabularyWord word;
  final VoidCallback onClose;

  const VocabularyDefinitionPopup({
    Key? key,
    required this.word,
    required this.onClose,
  }) : super(key: key);

  @override
  ConsumerState<VocabularyDefinitionPopup> createState() =>
      _VocabularyDefinitionPopupState();
}

class _VocabularyDefinitionPopupState
    extends ConsumerState<VocabularyDefinitionPopup> {
  /// Icono basado en el tipo de palabra
  IconData _getWordTypeIcon(String wordType) {
    final type = wordType.toLowerCase();
    if (type.contains('noun') || type.contains('sustantivo')) {
      return Icons.label;
    } else if (type.contains('verb') || type.contains('verbo')) {
      return Icons.play_arrow;
    } else if (type.contains('adjective') || type.contains('adjetivo')) {
      return Icons.style;
    } else if (type.contains('adverb') || type.contains('adverbio')) {
      return Icons.speed;
    } else if (type.contains('preposition') || type.contains('preposición')) {
      return Icons.arrow_forward;
    }
    return Icons.text_fields;
  }

  /// Color basado en dificultad (1-5)
  Color _getDifficultyColor(int difficulty) {
    switch (difficulty) {
      case 1:
        return AppColors.successGreen;
      case 2:
        return Colors.lightGreen;
      case 3:
        return AppColors.warningOrange;
      case 4:
        return Colors.orange.shade700;
      case 5:
        return AppColors.errorRed;
      default:
        return AppColors.textSecondary;
    }
  }

  Future<void> _speakWord() async {
    final template = ref.read(templateVariableServiceProvider);
    final text = template.replaceVariables(widget.word.word);
    if (text.trim().isEmpty) return;
    final tts = ref.read(ttsServiceProvider);
    await tts.speak(text);
  }

  Future<void> _speakExample(String exampleEn) async {
    if (exampleEn.trim().isEmpty) return;
    final tts = ref.read(ttsServiceProvider);
    await tts.speak(exampleEn);
  }

  @override
  Widget build(BuildContext context) {
    final template = ref.read(templateVariableServiceProvider);
    final exampleEn = template.replaceVariables(widget.word.contextSentence);
    final exampleEs = template.replaceVariables(widget.word.contextSentenceEs);
    return GestureDetector(
      onTap: widget.onClose,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: GestureDetector(
            onTap: () {}, // Evitar cerrar al hacer tap en el card
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
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header con la palabra
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
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
                                      color: Colors.white.withOpacity(0.9),
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
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryGreen.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          _getWordTypeIcon(widget.word.wordType),
                                          size: 16,
                                          color: AppColors.primaryGreen,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          widget.word.wordType,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryGreen,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  
                                  // Nivel de dificultad
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getDifficultyColor(widget.word.difficulty)
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.bar_chart,
                                          size: 16,
                                          color: _getDifficultyColor(widget.word.difficulty),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Level ${widget.word.difficulty}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: _getDifficultyColor(widget.word.difficulty),
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
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
                                    color: AppColors.secondaryBlue.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Label
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.chat_bubble_outline,
                                          size: 16,
                                          color: AppColors.secondaryBlue,
                                        ),
                                        const SizedBox(width: 6),
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
                                            child: Text(
                                              exampleEn,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: AppColors.textPrimary,
                                                height: 1.5,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    
                                    // Ejemplo en español
                                    Text(
                                      exampleEs,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.textSecondary,
                                        fontStyle: FontStyle.italic,
                                        height: 1.4,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Botón cerrar
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: widget.onClose,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryGreen,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}
