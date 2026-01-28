import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../../core/constants/app_colors.dart';
import '../../../domain/models/story/dialogue.dart';
import '../../../domain/models/episode/character.dart';

/// Burbuja de diálogo de personaje estilo The Office
class CharacterDialogueBubble extends StatefulWidget {
  final Dialogue dialogue;
  final List<Character> episodeCharacters;
  final Function(String)? onVocabTap;

  const CharacterDialogueBubble({
    Key? key,
    required this.dialogue,
    required this.episodeCharacters,
    this.onVocabTap,
  }) : super(key: key);

  @override
  State<CharacterDialogueBubble> createState() => _CharacterDialogueBubbleState();
}

class _CharacterDialogueBubbleState extends State<CharacterDialogueBubble> {
  bool _showingTranslation = false;

  /// Obtiene el personaje por su ID
  Character? _getCharacter() {
    if (widget.dialogue.characterId == null) return null;
    try {
      return widget.episodeCharacters.firstWhere(
        (char) => char.characterId == widget.dialogue.characterId,
      );
    } catch (e) {
      return null;
    }
  }

  /// Genera el icono del personaje basado en el nombre
  IconData _getCharacterIcon(String characterName) {
    final name = characterName.toUpperCase();
    if (name.contains('MICHAEL')) return Icons.business_center;
    if (name.contains('JIM')) return Icons.sports_basketball;
    if (name.contains('PAM')) return Icons.brush;
    if (name.contains('DWIGHT')) return Icons.agriculture;
    if (name.contains('ANGELA')) return Icons.pets;
    if (name.contains('KEVIN')) return Icons.fastfood;
    if (name.contains('STANLEY')) return Icons.work;
    if (name.contains('RYAN')) return Icons.laptop;
    return Icons.person;
  }

  /// Construye el texto con palabras de vocabulario resaltadas
  Widget _buildHighlightedText(BuildContext context) {
    // Si mostramos traducción, mostrar solo texto plano sin highlighting
    if (_showingTranslation) {
      return Text(
        widget.dialogue.translationEs ?? widget.dialogue.text ?? '',
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
          height: 1.5,
        ),
      );
    }
    
    if (widget.dialogue.highlightedVocab.isEmpty || widget.dialogue.text == null) {
      return Text(
        widget.dialogue.text ?? '',
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
          height: 1.5,
        ),
      );
    }

    // Crear spans para resaltar vocabulario
    final spans = <InlineSpan>[];
    String remainingText = widget.dialogue.text!;
    
    // Ordenar palabras de vocabulario por longitud (más largas primero)
    final vocabWords = List<String>.from(widget.dialogue.highlightedVocab)
      ..sort((a, b) => b.length.compareTo(a.length));

    while (remainingText.isNotEmpty) {
      bool foundMatch = false;
      
      for (final word in vocabWords) {
        final index = remainingText.toLowerCase().indexOf(word.toLowerCase());
        if (index == 0) {
          // Palabra de vocabulario encontrada al inicio
          final matchedWord = remainingText.substring(0, word.length);
          spans.add(
            TextSpan(
              text: matchedWord,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.secondaryBlue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.secondaryBlue,
                decorationStyle: TextDecorationStyle.dotted,
                height: 1.5,
              ),
              recognizer: widget.onVocabTap != null
                  ? (TapGestureRecognizer()
                      ..onTap = () => widget.onVocabTap!(matchedWord))
                  : null,
            ),
          );
          remainingText = remainingText.substring(word.length);
          foundMatch = true;
          break;
        }
      }
      
      if (!foundMatch) {
        // Texto normal hasta la próxima palabra de vocabulario
        int nextVocabIndex = remainingText.length;
        String nextWord = '';
        
        for (final word in vocabWords) {
          final index = remainingText.toLowerCase().indexOf(word.toLowerCase());
          if (index > 0 && index < nextVocabIndex) {
            nextVocabIndex = index;
            nextWord = word;
          }
        }
        
        spans.add(
          TextSpan(
            text: remainingText.substring(0, nextVocabIndex),
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),
        );
        remainingText = remainingText.substring(nextVocabIndex);
      }
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }

  @override
  Widget build(BuildContext context) {
    final character = _getCharacter();
    final displayName = widget.dialogue.characterDisplayName ?? character?.defaultName ?? 'Unknown';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar del personaje
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppColors.primaryGreen.withOpacity(0.3),
                AppColors.secondaryBlue.withOpacity(0.3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            _getCharacterIcon(displayName),
            color: AppColors.textPrimary,
            size: 24,
          ),
        ),

        const SizedBox(width: 12),

        // Burbuja de diálogo
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nombre del personaje
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 4),
                child: Text(
                  displayName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              
              // Burbuja
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primaryGreen.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Texto del diálogo
                    _buildHighlightedText(context),
                    
                    // Botón de traducción
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _showingTranslation = !_showingTranslation;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _showingTranslation ? Icons.translate_outlined : Icons.translate,
                            size: 16,
                            color: AppColors.secondaryBlue,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _showingTranslation ? 'Ver original' : 'Ver traducción',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.secondaryBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Emoción (opcional)
                    if (widget.dialogue.emotion != null && widget.dialogue.emotion!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        '😊 ${widget.dialogue.emotion}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary.withOpacity(0.7),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
