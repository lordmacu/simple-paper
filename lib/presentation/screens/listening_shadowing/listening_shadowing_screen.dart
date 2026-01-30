import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/avatar_asset_resolver.dart';
import '../../../core/utils/section_progress.dart';
import '../../../core/utils/haptic_utils.dart';
import '../../../core/utils/navigation_utils.dart';
import '../../../domain/models/episode/episode.dart';
import '../../../domain/models/listening_shadowing/listening_shadowing.dart';
import '../../providers/progress_providers.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/tts_provider.dart';
import '../../providers/personalization_providers.dart';

class ListeningShadowingScreen extends ConsumerStatefulWidget {
  final Episode episode;
  final VoidCallback? onComplete;

  const ListeningShadowingScreen({
    super.key,
    required this.episode,
    this.onComplete,
  });

  @override
  ConsumerState<ListeningShadowingScreen> createState() =>
      _ListeningShadowingScreenState();
}

class _ListeningShadowingScreenState
    extends ConsumerState<ListeningShadowingScreen> {
  static const double _passThreshold = 0.7;
  final SpeechToText _speech = SpeechToText();
  int _currentIndex = 0;
  Timer? _timer;
  int? _timeLeft;
  Timer? _silenceTimer;
  Timer? _ttsTimer;
  DateTime? _lastResultAt;
  String _lastRecognized = '';
  bool _speechReady = false;
  bool _isListening = false;
  bool _isSpeaking = false;
  String? _lastAvatarLogItemId;
  String _avatarAsset = '';
  String? _avatarItemId;
  String _recognized = '';
  double _lastScore = 0.0;
  bool? _isCorrect;

  ListeningShadowingSection? get _section => widget.episode.listeningShadowing;
  List<ListeningShadowingItem> get _items => _section?.data ?? [];
  ListeningShadowingItem get _currentItem => _items[_currentIndex];

  @override
  void initState() {
    super.initState();
    _loadAvatarForCurrentItem();
    _startTimer();
    _initSpeech();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _silenceTimer?.cancel();
    _ttsTimer?.cancel();
    ref.read(ttsServiceProvider).stop();
    super.dispose();
  }

  void _stopAllAndClose() {
    _timer?.cancel();
    _silenceTimer?.cancel();
    _ttsTimer?.cancel();
    if (_isListening) {
      _speech.stop();
    }
    ref.read(ttsServiceProvider).stop();
  }

  void _startTimer() {
    _timer?.cancel();
    if (_items.isEmpty) return;
    final seconds = _currentItem.repeatTimerSeconds ?? 0;
    if (seconds <= 0) {
      _timeLeft = null;
      return;
    }
    _timeLeft = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _timeLeft = (_timeLeft ?? 1) - 1;
        if ((_timeLeft ?? 0) <= 0) {
          timer.cancel();
        }
      });
    });
  }

  Future<void> _initSpeech() async {
    final ok = await _speech.initialize();
    if (!mounted) return;
    setState(() {
      _speechReady = ok;
    });
  }

  Future<void> _toggleListening() async {
    if (!_speechReady) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Micrófono no disponible')),
      );
      return;
    }
    if (_isListening) {
      await _speech.stop();
      _evaluateResult();
      if (!mounted) return;
      setState(() {
        _isListening = false;
      });
      return;
    }
    setState(() {
      _recognized = '';
      _lastRecognized = '';
      _lastResultAt = DateTime.now();
      _isCorrect = null;
      _lastScore = 0.0;
      _isListening = true;
    });
    await _speech.listen(
      localeId: 'en_US',
      onResult: (result) {
        if (!mounted) return;
        final raw = result.recognizedWords;
        // On web, use only the final result to avoid concatenation bugs.
        // Intermediate results on Chrome/Web often contain concatenated
        // partial phrases like "this officethis office hasthis office has a"
        // which are impossible to clean reliably. We simply ignore all
        // intermediate results and only process the final one.
        if (kIsWeb && !result.finalResult) {
          // Show a simple preview to the user but don't commit
          final preview = _extractCleanPreview(raw);
          setState(() {
            _recognized = preview;
            _lastResultAt = DateTime.now();
          });
          return;
        }
        final next = kIsWeb ? _extractCleanPreview(raw) : raw;
        setState(() {
          _recognized = next;
          _lastResultAt = DateTime.now();
        });
        _restartSilenceTimer();
      },
    );
    _restartSilenceTimer();
  }

  void _restartSilenceTimer() {
    _silenceTimer?.cancel();
    _silenceTimer = Timer(const Duration(seconds: 1), () async {
      if (!mounted || !_isListening) return;
      final last = _lastResultAt ?? DateTime.now();
      final idle = DateTime.now().difference(last).inMilliseconds >= 2000;
      final noChange = _recognized.trim() == _lastRecognized.trim();
      if (idle && noChange) {
        await _speech.stop();
        if (!mounted) return;
        _evaluateResult();
        setState(() {
          _isListening = false;
        });
      } else {
        _lastRecognized = _recognized;
        _restartSilenceTimer();
      }
    });
  }

  /// Extracts a clean preview from potentially concatenated web speech results.
  /// Web Speech API on Chrome sometimes concatenates partial results without spaces,
  /// producing strings like "this officethis office has" instead of "this office has".
  /// This method attempts to extract only the final coherent phrase.
  String _extractCleanPreview(String text) {
    if (text.isEmpty) return '';

    // Tokenize the raw input
    final allWords = text.split(RegExp(r'\s+'));
    if (allWords.isEmpty) return text;

    // Get the first word to look for repeated pattern starts
    final firstWord = allWords.first.toLowerCase();
    if (firstWord.isEmpty) return text;

    // Find words that START with the first word (indicates concatenation point)
    // e.g., in "this officethis office has", "officethis" contains "this"
    final result = <String>[];
    for (final word in allWords) {
      final lower = word.toLowerCase();
      // Check if this word contains the first word as a suffix (concatenation)
      final idx = lower.indexOf(firstWord);
      if (idx > 0) {
        // This word is concatenated, like "officethis"
        // Take only the part before the concatenation point
        // Actually, we want to restart from here, so clear previous and start fresh
        result.clear();
        result.add(word.substring(idx)); // Start from "this..."
      } else {
        result.add(word);
      }
    }

    return result.join(' ');
  }

  void _evaluateResult() {
    final template = ref.read(templateVariableServiceProvider);
    final rawTarget = _currentItem.ttsText.isNotEmpty
        ? _currentItem.ttsText
        : _currentItem.text;
    final target = template.replaceVariables(rawTarget);
    final score = _similarityScore(_recognized, target);
    setState(() {
      _lastScore = score;
      _isCorrect = score >= _passThreshold;
    });
  }

  double _similarityScore(String spoken, String target) {
    final spokenTokens = _tokenize(spoken);
    final targetTokens = _tokenize(target);
    if (targetTokens.isEmpty) return 0.0;
    if (spokenTokens.isEmpty) return 0.0;
    final spokenSet = spokenTokens.toSet();
    final targetSet = targetTokens.toSet();
    final matchCount = targetSet.intersection(spokenSet).length;
    return matchCount / targetSet.length;
  }

  List<String> _tokenize(String text) {
    final normalized = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '')
        .trim();
    if (normalized.isEmpty) return [];
    return normalized.split(RegExp(r'\s+'));
  }

  Future<void> _playTts() async {
    _ttsTimer?.cancel();
    setState(() {
      _isSpeaking = true;
    });
    final template = ref.read(templateVariableServiceProvider);
    final raw = _currentItem.ttsText.isNotEmpty
        ? _currentItem.ttsText
        : _currentItem.text;
    final text = template.replaceVariables(raw);
    if (text.trim().isEmpty) return;
    final tts = ref.read(ttsServiceProvider);
    final voiceId = (_currentItem.ttsVoiceId ?? '').toLowerCase();
    final isFemale = RegExp(r'(^|_)female(_|$)').hasMatch(voiceId);
    final isMale = !isFemale && RegExp(r'(^|_)male(_|$)').hasMatch(voiceId);
    final pitch = isMale ? 0.85 : 1.05;
    final baseRate = tts.defaultRate;
    final rate = isMale ? (baseRate * 0.95) : baseRate;
    print('Playing TTS: $text pitch=$pitch rate=$rate voiceId $voiceId');
    await tts.speak(
      text,
      pitch: pitch,
      rate: rate,
      voiceGender: isMale ? 'male' : 'female',
      voiceIdHint: voiceId,
    );
    final seconds = _currentItem.estimatedAudioDurationSeconds ?? 0;
    final duration = Duration(milliseconds: (seconds * 1000) + 400);
    _ttsTimer = Timer(duration, () {
      if (!mounted) return;
      setState(() {
        _isSpeaking = false;
      });
    });
  }

  Set<int> _matchedTokenIndices(String spoken, String target) {
    final spokenTokens = _tokenize(spoken);
    final targetTokens = _tokenize(target);
    if (spokenTokens.isEmpty || targetTokens.isEmpty) return {};
    final matched = <int>{};
    var j = 0;
    for (var i = 0; i < targetTokens.length; i++) {
      if (j >= spokenTokens.length) break;
      if (targetTokens[i] == spokenTokens[j]) {
        matched.add(i);
        j++;
      }
    }
    return matched;
  }

  List<InlineSpan> _buildHighlightedSpans(String text, Set<int> matchedIndices) {
    final spans = <InlineSpan>[];
    final parts = RegExp(r'\s+|\S+').allMatches(text);
    var tokenIndex = 0;
    for (final match in parts) {
      final chunk = match.group(0) ?? '';
      if (chunk.trim().isEmpty) {
        spans.add(TextSpan(text: chunk));
        continue;
      }
      final tokens = _tokenize(chunk);
      final normalized = tokens.isNotEmpty ? tokens.first : '';
      final isMatch =
          normalized.isNotEmpty && matchedIndices.contains(tokenIndex);
      spans.add(
        TextSpan(
          text: chunk,
          style: TextStyle(
            backgroundColor: isMatch
                ? AppColors.successGreen.withOpacity(0.3)
                : Colors.transparent,
          ),
        ),
      );
      if (normalized.isNotEmpty) {
        tokenIndex++;
      }
    }
    return spans;
  }

  void _next() {
    if (_isListening) {
      _speech.stop();
      _silenceTimer?.cancel();
    }
    _ttsTimer?.cancel();
    if (_currentIndex < _items.length - 1) {
      setState(() {
        _currentIndex++;
        _recognized = '';
        _lastRecognized = '';
        _lastResultAt = null;
        _lastScore = 0.0;
        _isCorrect = null;
        _isListening = false;
        _isSpeaking = false;
        _avatarItemId = null;
        _avatarAsset = '';
      });
      _startTimer();
      _loadAvatarForCurrentItem();
      return;
    }
    _completeSection();
  }

  Future<void> _completeSection() async {
    await ref.read(markSectionCompletedProvider)(
      episodeNumber: widget.episode.episodeMetadata.episodeNumber,
      sectionId: SectionProgressIds.listeningShadowing,
    );
    if (widget.onComplete != null) {
      widget.onComplete!.call();
    } else if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Esperar a que las variables personalizadas estén cargadas
    ref.watch(personalizationInitProvider);

    final section = _section;
    if (section == null || section.data.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Listening'),
        ),
        body: const Center(
          child: Text('No listening shadowing data for this episode.'),
        ),
      );
    }

    final template = ref.read(templateVariableServiceProvider);
    final title = section.sectionNameEs ?? section.sectionName ?? 'Listening';
    final instructions = template.replaceVariables(
      section.instructionsEs.isNotEmpty
          ? section.instructionsEs
          : section.instructions,
    );

    final textEn = template.replaceVariables(_currentItem.text);
    final textEs = template.replaceVariables(_currentItem.textEs);
    final speakerName = template.replaceVariables(
      _currentItem.characterDisplayName ?? 'Speaker',
    );
    final avatarAsset = _avatarAsset;
    _logAvatarOnce(speakerName);
    final matched = _matchedTokenIndices(_recognized, textEn);
    final repeatCount = _currentItem.repeatCount ?? 1;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          _stopAllAndClose();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: AppColors.textPrimary),
            onPressed: () {
              _stopAllAndClose();
              NavigationUtils.closeToHome(context);
            },
          ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${_currentIndex + 1}/${_items.length}',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              instructions,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primaryGreen.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (avatarAsset.isNotEmpty) ...[
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: AppColors.cardBackground,
                          backgroundImage: AssetImage(avatarAsset),
                        ),
                        const SizedBox(width: 10),
                      ],
                      Text(
                        speakerName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Spacer(),
                      if (_timeLeft != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.warningOrange.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.timer,
                                size: 16,
                                color: AppColors.warningOrange,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${_timeLeft ?? 0}s',
                                style: const TextStyle(
                                  color: AppColors.warningOrange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: HapticUtils.wrap(_playTts),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          height: 1.4,
                        ),
                        children: _buildHighlightedSpans(textEn, matched),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: OutlinedButton.icon(
                      onPressed: _isListening ? null : HapticUtils.wrap(_playTts),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.secondaryBlue.withOpacity(0.6),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(
                        Icons.volume_up,
                        color: AppColors.secondaryBlue,
                        size: 18,
                      ),
                      label: const Text(
                        'Escuchar',
                        style: TextStyle(
                          color: AppColors.secondaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    textEs,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Icon(
                        Icons.repeat,
                        size: 16,
                        color: AppColors.secondaryBlue,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Repite $repeatCount veces',
                        style: const TextStyle(
                          color: AppColors.secondaryBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Es hora de practicar, intenta leer el texto en inglés.',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                            height: 1.3,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: _isSpeaking
                            ? null
                            : HapticUtils.wrap(_toggleListening),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: _isSpeaking
                                ? AppColors.textSecondary.withOpacity(0.3)
                                : AppColors.primaryGreen,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                blurRadius: 10,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Icon(
                            _isListening ? Icons.stop_circle : Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (_recognized.isNotEmpty) ...[
                    Text(
                      'Tu respuesta:',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _recognized,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                  if (_isCorrect != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          _isCorrect! ? Icons.check_circle : Icons.error_outline,
                          color: _isCorrect!
                              ? AppColors.successGreen
                              : AppColors.errorRed,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            _isCorrect!
                                ? 'Correcto'
                                : 'Intenta leer el texto que dijo el personaje',
                            style: TextStyle(
                              color: _isCorrect!
                                  ? AppColors.successGreen
                                  : AppColors.errorRed,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Score ${(100 * _lastScore).round()}%',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (_isListening || _isSpeaking)
                    ? null
                    : HapticUtils.wrap(_next),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  _currentIndex == _items.length - 1 ? 'Finalizar' : 'Siguiente',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  void _logAvatarOnce(String speakerName) {
    final itemId = _currentItem.itemId;
    if (_lastAvatarLogItemId == itemId) return;
    _lastAvatarLogItemId = itemId;
    final characterId = _currentItem.characterId ?? '';
    final avatarUrl = _resolveAvatarUrl(characterId);
    final avatarAsset = _avatarAsset;
    debugPrint(
      'LISTENING_AVATAR item=$itemId characterId=$characterId name=$speakerName avatarUrl=$avatarUrl avatarAsset=$avatarAsset',
    );
  }

  String _resolveAvatarUrl(String characterId) {
    final normalized = _normalizeCharacterId(characterId);
    for (final character in widget.episode.characters.appearingInEpisode) {
      if (_normalizeCharacterId(character.characterId) == normalized) {
        return character.avatarUrl ?? '';
      }
    }
    return '';
  }

  Future<void> _loadAvatarForCurrentItem() async {
    if (_items.isEmpty) return;
    final itemId = _currentItem.itemId;
    if (_avatarItemId == itemId && _avatarAsset.isNotEmpty) return;
    final characterId = _currentItem.characterId ?? '';
    final avatarUrl = _resolveAvatarUrl(characterId);
    final resolved = await AvatarAssetResolver.resolve(
      avatarUrl: avatarUrl,
      fallbackName: _currentItem.characterDisplayName,
      cacheKey: itemId,
    );
    if (!mounted) return;
    setState(() {
      _avatarItemId = itemId;
      _avatarAsset = resolved;
    });
  }

  String _normalizeCharacterId(String characterId) {
    var value = characterId.trim().toLowerCase().replaceAll(' ', '_');
    if (value.startsWith('char_')) {
      value = value.substring('char_'.length);
    }
    return value;
  }
}
