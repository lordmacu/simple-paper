import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/section_progress.dart';
import '../../../domain/models/episode/episode.dart';
import '../../../domain/models/listening_shadowing/listening_shadowing.dart';
import '../../providers/progress_providers.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/tts_provider.dart';

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
  DateTime? _lastResultAt;
  String _lastRecognized = '';
  bool _speechReady = false;
  bool _isListening = false;
  String _recognized = '';
  double _lastScore = 0.0;
  bool? _isCorrect;

  ListeningShadowingSection? get _section => widget.episode.listeningShadowing;
  List<ListeningShadowingItem> get _items => _section?.data ?? [];
  ListeningShadowingItem get _currentItem => _items[_currentIndex];

  @override
  void initState() {
    super.initState();
    _startTimer();
    _initSpeech();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _silenceTimer?.cancel();
    super.dispose();
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
        setState(() {
          _recognized = result.recognizedWords;
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
    final template = ref.read(templateVariableServiceProvider);
    final raw = _currentItem.ttsText.isNotEmpty
        ? _currentItem.ttsText
        : _currentItem.text;
    final text = template.replaceVariables(raw);
    if (text.trim().isEmpty) return;
    final tts = ref.read(ttsServiceProvider);
    await tts.speak(text);
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
    if (_currentIndex < _items.length - 1) {
      setState(() {
        _currentIndex++;
        _recognized = '';
        _lastRecognized = '';
        _lastResultAt = null;
        _lastScore = 0.0;
        _isCorrect = null;
        _isListening = false;
      });
      _startTimer();
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
    final matched = _matchedTokenIndices(_recognized, textEn);
    final repeatCount = _currentItem.repeatCount ?? 1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      const Icon(
                        Icons.record_voice_over,
                        color: AppColors.secondaryBlue,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _currentItem.characterDisplayName ?? 'Speaker',
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
                    onTap: _playTts,
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
                      onPressed: _playTts,
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
                        onTap: _toggleListening,
                        child: Container(
                          width: 44,
                          height: 44,
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
                onPressed: _isListening ? null : _next,
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
    );
  }
}
