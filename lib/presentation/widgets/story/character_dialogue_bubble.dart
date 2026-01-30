import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/avatar_asset_resolver.dart';
import '../../../domain/models/story/dialogue.dart';
import '../../../domain/models/episode/character.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/tts_provider.dart';

/// Burbuja de diálogo de personaje estilo The Office
class CharacterDialogueBubble extends ConsumerStatefulWidget {
  final Dialogue dialogue;
  final List<Character> episodeCharacters;
  final Function(String)? onVocabTap;
  final bool avatarOnRight;
  final bool bubbleAlignRight;
  final int sceneNumber;

  const CharacterDialogueBubble({
    Key? key,
    required this.dialogue,
    required this.episodeCharacters,
    required this.sceneNumber,
    this.onVocabTap,
    this.avatarOnRight = false,
    this.bubbleAlignRight = false,
  }) : super(key: key);

  @override
  ConsumerState<CharacterDialogueBubble> createState() =>
      _CharacterDialogueBubbleState();
}

class _CharacterDialogueBubbleState
    extends ConsumerState<CharacterDialogueBubble> {
  bool _showingTranslation = false;
  String _avatarAsset = '';
  String? _avatarCharacterKey;
  bool _isAvatarLoading = false;

  /// Obtiene el personaje por su ID
  Character? _getCharacter() {
    if (widget.dialogue.characterId == null) return null;
    try {
      final target = _normalizeId(widget.dialogue.characterId ?? '');
      return widget.episodeCharacters.firstWhere(
        (char) => _normalizeId(char.characterId) == target,
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

  Future<void> _loadAvatar() async {
    final character = _getCharacter();
    final template = ref.read(templateVariableServiceProvider);
    final fallbackName = template.replaceVariables(
      widget.dialogue.characterDisplayName ?? character?.defaultName ?? '',
    );
    final avatarUrl = character?.avatarUrl ?? '';
    final characterKey = _normalizeCharacterKey(
      widget.dialogue.characterId ?? '',
      avatarUrl,
    );
    if (characterKey.isEmpty || _avatarCharacterKey == characterKey) return;
    final cacheKey = 'scene_${widget.sceneNumber}_character_$characterKey';
    final cached = AvatarAssetResolver.getCached(cacheKey);
    if (cached != null && cached.isNotEmpty) {
      setState(() {
        _avatarCharacterKey = characterKey;
        _avatarAsset = cached;
        _isAvatarLoading = false;
      });
      return;
    }
    if (avatarUrl.isNotEmpty && mounted) {
      setState(() {
        _isAvatarLoading = true;
      });
    }
    final resolved = await AvatarAssetResolver.resolve(
      avatarUrl: avatarUrl,
      fallbackName: fallbackName,
      cacheKey: cacheKey,
    );
    if (!mounted) return;
    if (resolved.isNotEmpty) {
      await precacheImage(AssetImage(resolved), context);
      if (!mounted) return;
      setState(() {
        _avatarCharacterKey = characterKey;
        _avatarAsset = resolved;
        _isAvatarLoading = false;
      });
      return;
    }
    setState(() {
      _avatarCharacterKey = characterKey;
      _isAvatarLoading = false;
    });
  }

  Widget _buildAvatar(String displayName, {required bool hasAvatarHint}) {
    if (_avatarAsset.isNotEmpty) {
      debugPrint('DIALOGUE_AVATAR render asset=$_avatarAsset');
    }
          debugPrint('DIALOGUE_AVATAR render $displayName asset=$_avatarAsset');

    final child = _avatarAsset.isNotEmpty
        ? ClipOval(
            key: ValueKey<String>(_avatarAsset),
            child: SizedBox(
              width: 48,
              height: 48,
              child: Image.asset(
                _avatarAsset,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
            ),
          )
        : (_isAvatarLoading || hasAvatarHint
            ? const SizedBox(
                key: ValueKey<String>('avatar_placeholder'),
                width: 48,
                height: 48,
              )
            : Container(
            key: ValueKey<String>('icon_$displayName'),
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
          ));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 260),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: child,
    );
  }

  /// Construye el texto con palabras de vocabulario resaltadas
  Widget _buildHighlightedText(BuildContext context) {
    final template = ref.read(templateVariableServiceProvider);
    final rawText = widget.dialogue.text;
    final rawTranslation = widget.dialogue.translationEs;
    final text =
        rawText != null ? template.replaceVariables(rawText) : null;
    final translation = rawTranslation != null
        ? template.replaceVariables(rawTranslation)
        : null;

    // Si mostramos traducción, mostrar solo texto plano sin highlighting
    if (_showingTranslation) {
      return Text(
        translation ?? text ?? '',
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
          height: 1.5,
        ),
      );
    }
    
    if (widget.dialogue.highlightedVocab.isEmpty || text == null) {
      return Text(
        text ?? '',
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
          height: 1.5,
        ),
      );
    }

    // Crear spans para resaltar vocabulario
    final spans = <InlineSpan>[];
    String remainingText = text;
    
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

  Future<void> _speakDialogue() async {
    final template = ref.read(templateVariableServiceProvider);
    final rawText = widget.dialogue.text ?? '';
    final text = template.replaceVariables(rawText);
    if (text.trim().isEmpty) return;
    final tts = ref.read(ttsServiceProvider);
    await tts.speak(text);
  }

  @override
  void initState() {
    super.initState();
    _loadAvatar();
  }

  @override
  void didUpdateWidget(covariant CharacterDialogueBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dialogue.characterId != widget.dialogue.characterId) {
      _loadAvatar();
    }
  }

  String _normalizeCharacterKey(String value, String fallback) {
    final raw = value.isNotEmpty ? value : fallback;
    return _normalizeId(raw);
  }

  String _normalizeId(String value) {
    var normalized = value.trim().toLowerCase();
    if (normalized.startsWith('char_')) {
      normalized = normalized.substring('char_'.length);
    }
    normalized = normalized.replaceAll(RegExp(r'[^a-z0-9_]'), '');
    return normalized;
  }

  @override
  Widget build(BuildContext context) {
    final character = _getCharacter();
    final displayNameRaw =
        widget.dialogue.characterDisplayName ?? character?.defaultName ?? 'Unknown';
    final displayName = ref
        .read(templateVariableServiceProvider)
        .replaceVariables(displayNameRaw);

    final bubbleOnRight = widget.bubbleAlignRight;
    final bubbleColor = bubbleOnRight
        ? AppColors.secondaryBlue.withOpacity(0.12)
        : AppColors.cardBackground;
    final bubbleBorder = bubbleOnRight
        ? AppColors.secondaryBlue.withOpacity(0.4)
        : AppColors.primaryGreen.withOpacity(0.2);
    final nameAlign = widget.avatarOnRight ? TextAlign.right : TextAlign.left;
    final contentAlign =
        bubbleOnRight ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          bubbleOnRight ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!widget.avatarOnRight) ...[
          // Avatar del personaje (izquierda)
          _buildAvatar(
            displayName,
            hasAvatarHint: (character?.avatarUrl ?? '').isNotEmpty,
          ),
          const SizedBox(width: 12),
        ],

        // Burbuja de diálogo
        Expanded(
          child: Column(
            crossAxisAlignment: contentAlign,
            children: [
              // Nombre del personaje
              Padding(
                padding: EdgeInsets.only(
                  left: widget.avatarOnRight ? 0 : 12,
                  right: widget.avatarOnRight ? 12 : 0,
                  bottom: 4,
                ),
                child: Align(
                  alignment: widget.avatarOnRight
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    displayName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: nameAlign,
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
                  color: bubbleColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: bubbleBorder,
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
                  crossAxisAlignment: contentAlign,
                  children: [
                    // Texto del diálogo
                    _buildHighlightedText(context),
                    
                    // Botón de traducción
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                                _showingTranslation
                                    ? Icons.translate_outlined
                                    : Icons.translate,
                                size: 16,
                                color: AppColors.secondaryBlue,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _showingTranslation
                                    ? 'Ver original'
                                    : 'Ver traducción',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.secondaryBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: _speakDialogue,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.volume_up,
                                size: 16,
                                color: AppColors.primaryGreen,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Escuchar',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primaryGreen,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

        if (widget.avatarOnRight) ...[
          const SizedBox(width: 12),
          // Avatar del personaje (derecha)
          _buildAvatar(
            displayName,
            hasAvatarHint: (character?.avatarUrl ?? '').isNotEmpty,
          ),
        ],
      ],
    );
  }
}
