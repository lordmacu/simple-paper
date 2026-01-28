import 'dart:async';
import 'dart:math';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/audio_choice_game.dart';
import '../../../providers/template_variable_provider.dart';
import '../../../../data/services/template_variable_service.dart';

class AudioChoiceGameWidget extends ConsumerStatefulWidget {
  final AudioChoiceGame game;
  final ValueChanged<int> onComplete;

  const AudioChoiceGameWidget({
    Key? key,
    required this.game,
    required this.onComplete,
  }) : super(key: key);

  @override
  ConsumerState<AudioChoiceGameWidget> createState() =>
      _AudioChoiceGameWidgetState();
}

class _AudioChoiceGameWidgetState
    extends ConsumerState<AudioChoiceGameWidget> {
  final AudioPlayer _player = AudioPlayer();
  final FlutterTts _tts = FlutterTts();
  int _currentIndex = 0;
  int _score = 0;
  bool _showFeedback = false;
  int? _selected;
  Timer? _timer;
  int? _timeLeft;
  List<int> _shuffledIndices = [];
  List<int> _shuffledItems = [];
  List<Map<String, String>> _voices = [];
  List<Map<String, String>> _maleVoices = [];
  int? _voiceIndex;

  AudioChoiceItem get _item =>
      widget.game.content.items[_shuffledItems[_currentIndex]];
  int get _totalItems => widget.game.content.items.length;

  @override
  void initState() {
    super.initState();
    _shuffleItems();
    _shuffleOptions();
    _startTimerIfNeeded();
    _loadVoices();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _player.dispose();
    _tts.stop();
    super.dispose();
  }

  void _shuffleOptions() {
    _shuffledIndices =
        List<int>.generate(_item.options.length, (i) => i)..shuffle(Random());
  }

  void _shuffleItems() {
    _shuffledItems =
        List<int>.generate(widget.game.content.items.length, (i) => i)
          ..shuffle(Random());
    _currentIndex = 0;
  }

  void _startTimerIfNeeded() {
    final seconds = widget.game.timeLimitSeconds;
    if (seconds == null) return;
    _timeLeft = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _timeLeft = (_timeLeft ?? 1) - 1;
        if ((_timeLeft ?? 0) <= 0) {
          _finish();
        }
      });
    });
  }

  Future<void> _play(BuildContext context) async {
    final url = _item.audioUrl.trim();
    await Future.delayed(const Duration(milliseconds: 650));
    if (url.isNotEmpty) {
      try {
        await _player.stop();
        await _player.play(UrlSource(url));
        return;
      } catch (_) {
        // si falla, caemos al TTS
      }
    }

    // Fallback: TTS con el texto de la opción correcta o el prompt
    final template = ref.read(templateVariableServiceProvider);
    final fallbackText = (_item.options.isNotEmpty)
        ? template.replaceVariables(
            _item.options[_item.correctAnswer.clamp(0, _item.options.length - 1)],
          )
        : template.replaceVariables(_item.prompt ?? 'Listen');

    // Elige una voz distinta en cada reproducción si hay varias
    await _setRandomVoice();

    await _tts.stop();
    await _tts.setLanguage('en-US');
    // Más grave y pausado para simular voz masculina aun con una sola voz instalada
    //await _tts.setSpeechRate(0.42);
    //await _setGravePitch();
    await _tts.speak(fallbackText);
  }

  Future<void> _loadVoices() async {
    try {
      if (Platform.isAndroid) {
        // fuerza motor de Google si está disponible
        try {
          await _tts.setEngine('com.google.android.tts');
        } catch (_) {}
      }

      final list = await _tts.getVoices;
      if (list is List) {
        _voices = list
            .whereType<Map>()
            .map((v) => v.map((k, v) => MapEntry(k.toString(), v.toString())))
            .where((v) => (v['locale'] ?? '').startsWith('en'))
            .toList();

        _maleVoices = _voices
            .where((v) =>
                (v['name'] ?? '').toLowerCase().contains('male') ||
                (v['gender'] ?? '').toLowerCase().contains('male'))
            .toList();

        // Loguea las voces disponibles para depurar
        // ignore: avoid_print
        for (final v in _voices) {
          print('TTS voice: $v');
        }

        // Elige una voz aleatoria por sesión de minijuego
        if (_voices.isNotEmpty) {
          _voiceIndex = Random().nextInt(_voices.length);
          await _tts.setVoice(_voices[_voiceIndex!]);
        }
      }
    } catch (_) {
      _voices = [];
      _maleVoices = [];
    }
  }

  Future<Map<String, String>?> _setRandomVoice() async {
    final pool = _maleVoices.isNotEmpty ? _maleVoices : _voices;
    if (pool.isEmpty) return null;
    _voiceIndex = Random().nextInt(pool.length);
    final voice = pool[_voiceIndex!];
    await _tts.setVoice(voice);
    return voice;
  }

  Future<void> _setGravePitch() async {
    // Fija un tono grave consistente (sin depender de otras voces)
    await _tts.setPitch(0.65);
  }

  void _select(int index) {
    if (_showFeedback) return;
    final originalIndex = _shuffledIndices[index];
    final isCorrect = originalIndex == _item.correctAnswer;
    setState(() {
      _selected = index;
      _showFeedback = true;
      _score = max(0, _score + (isCorrect ? 10 : 0));
    });
    if (isCorrect) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.mediumImpact();
    }

    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      if (_currentIndex < _totalItems - 1) {
        setState(() {
          _currentIndex++;
          _selected = null;
          _showFeedback = false;
        });
        _shuffleOptions();
      } else {
        _finish();
      }
    });
  }

  void _finish() {
    _timer?.cancel();
    widget.onComplete(_score);
  }

  @override
  Widget build(BuildContext context) {
    final template = ref.read(templateVariableServiceProvider);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(template),
          const SizedBox(height: 14),
          _buildAudioCard(template),
          const SizedBox(height: 14),
          _buildOptions(template),
          const Spacer(),
          Text(
            'Score: $_score',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(TemplateVariableService template) {
    return Row(
      children: [
        Text(
          'Audio ${_currentIndex + 1} / $_totalItems',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        if (_timeLeft != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.warningOrange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer, size: 18, color: AppColors.warningOrange),
                const SizedBox(width: 6),
                Text(
                  '${_timeLeft}s',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.warningOrange,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildAudioCard(TemplateVariableService template) {
    final prompt = _item.prompt != null ? template.replaceVariables(_item.prompt!) : '';
    final promptEs = _item.promptEs != null ? template.replaceVariables(_item.promptEs!) : null;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton.icon(
                key: const Key('audio_button_play'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => _play(context),
                icon: const Icon(Icons.volume_up),
                label: const Text('Play'),
              ),
              if (_timeLeft != null) ...[
                const SizedBox(width: 12),
                Text(
                  'Escucha y responde',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
          if (prompt.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              prompt,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          if (promptEs != null && promptEs.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              promptEs,
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOptions(TemplateVariableService template) {
    final options = _item.options;
    return Column(
      children: List.generate(options.length, (idx) {
        final optionIndex = _shuffledIndices[idx];
        final text = template.replaceVariables(options[optionIndex]);
        final isSelected = _selected == idx;
        final isCorrect = _showFeedback && optionIndex == _item.correctAnswer;
        final isWrong = _showFeedback && isSelected && !isCorrect;

        Color bg = AppColors.cardBackground;
        Color fg = AppColors.textPrimary;
        if (_showFeedback) {
          if (isCorrect) {
            bg = AppColors.primaryGreen;
            fg = Colors.white;
          } else if (isWrong) {
            bg = AppColors.errorRed;
            fg = Colors.white;
          }
        } else if (isSelected) {
          bg = AppColors.secondaryBlue;
          fg = Colors.white;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              onTap: _showFeedback ? null : () => _select(idx),
              title: Text(
                text,
                style: TextStyle(
                  color: fg,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: _showFeedback
                  ? Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
