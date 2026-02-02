import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/avatar_asset_resolver.dart';
import '../../../domain/models/story/dialogue.dart';
import '../../../domain/models/episode/character.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/tts_provider.dart';
import '../molecules/dialogue_actions_row.dart';
import '../molecules/dialogue_bubble.dart';
import '../molecules/dialogue_avatar_badge.dart';
import '../molecules/character_name_label.dart';
import '../molecules/dialogue_layout_row.dart';

/// Burbuja de diálogo de personaje estilo The Office.
///
/// Muestra avatar, nombre y texto del diálogo con opciones de traducción.
class CharacterDialogueBubble extends ConsumerStatefulWidget {
  /// Datos del diálogo.
  final Dialogue dialogue;

  /// Lista de personajes del episodio.
  final List<Character> episodeCharacters;

  /// Callback cuando se toca una palabra de vocabulario.
  final Function(String)? onVocabTap;

  /// Si el avatar va a la derecha.
  final bool avatarOnRight;

  /// Si la burbuja se alinea a la derecha.
  final bool bubbleAlignRight;

  /// Número de escena actual.
  final int sceneNumber;

  /// Crea un [CharacterDialogueBubble].
  const CharacterDialogueBubble({
    required this.dialogue,
    required this.episodeCharacters,
    required this.sceneNumber,
    super.key,
    this.onVocabTap,
    this.avatarOnRight = false,
    this.bubbleAlignRight = false,
  });

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
    if (widget.dialogue.characterId == null) {
      return null;
    }
    try {
      final target = _normalizeId(widget.dialogue.characterId ?? '');
      return widget.episodeCharacters.firstWhere(
        (char) => _normalizeId(char.characterId) == target,
        orElse: () => widget.episodeCharacters.first, // Fallback al primer personaje
      );
    } on Exception catch (_) {
      return null;
    }
  }

  /// Genera el icono del personaje basado en el nombre
  IconData _getCharacterIcon(String characterName) {
    final name = characterName.toUpperCase();
    if (name.contains('MICHAEL')) {
      return Icons.business_center;
    }
    if (name.contains('JIM')) {
      return Icons.sports_basketball;
    }
    if (name.contains('PAM')) {
      return Icons.brush;
    }
    if (name.contains('DWIGHT')) {
      return Icons.agriculture;
    }
    if (name.contains('ANGELA')) {
      return Icons.pets;
    }
    if (name.contains('KEVIN')) {
      return Icons.fastfood;
    }
    if (name.contains('STANLEY')) {
      return Icons.work;
    }
    if (name.contains('RYAN')) {
      return Icons.laptop;
    }
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
    if (characterKey.isEmpty || _avatarCharacterKey == characterKey) {
      return;
    }
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
    if (!mounted) {
      return;
    }
    if (resolved.isNotEmpty) {
      await precacheImage(AssetImage(resolved), context);
      if (!mounted) {
        return;
      }
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

    return DialogueAvatarBadge(
      displayName: displayName,
      avatarAsset: _avatarAsset,
      isLoading: _isAvatarLoading,
      hasAvatarHint: hasAvatarHint,
      fallbackIcon: _getCharacterIcon(displayName),
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

        for (final word in vocabWords) {
          final index = remainingText.toLowerCase().indexOf(word.toLowerCase());
          if (index > 0 && index < nextVocabIndex) {
            nextVocabIndex = index;
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
    if (text.trim().isEmpty) {
      return;
    }
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
    final contentAlign =
        bubbleOnRight ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return DialogueLayoutRow(
      avatarOnRight: widget.avatarOnRight,
      avatar: _buildAvatar(
        displayName,
        hasAvatarHint: (character?.avatarUrl ?? '').isNotEmpty,
      ),
      content: Column(
        crossAxisAlignment: contentAlign,
        children: [
          // Nombre del personaje
          CharacterNameLabel(
            name: displayName,
            alignRight: widget.avatarOnRight,
            padding: EdgeInsets.only(
              left: widget.avatarOnRight ? 0 : 12,
              right: widget.avatarOnRight ? 12 : 0,
              bottom: 4,
            ),
          ),
          
          // Burbuja
          DialogueBubble(
            isRight: bubbleOnRight,
            child: Column(
              crossAxisAlignment: contentAlign,
              children: [
                // Texto del diálogo
                _buildHighlightedText(context),
                
                // Botón de traducción
                const SizedBox(height: 8),
                DialogueActionsRow(
                  isShowingTranslation: _showingTranslation,
                  onToggleTranslation: () {
                    setState(() {
                      _showingTranslation = !_showingTranslation;
                    });
                  },
                  onSpeak: _speakDialogue,
                ),
                
                // Emoción (opcional)
                if (widget.dialogue.emotion != null && widget.dialogue.emotion!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    '😊 ${widget.dialogue.emotion}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary.withValues(alpha: 0.7),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
