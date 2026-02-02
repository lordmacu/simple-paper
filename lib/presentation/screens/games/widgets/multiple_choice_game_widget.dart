import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/multiple_choice_game.dart';
import '../../../providers/template_variable_provider.dart';
import '../../../widgets/molecules/bilingual_text_card.dart';
import '../../../widgets/molecules/score_footer.dart';
import '../../../widgets/molecules/section_header.dart';
import '../../../widgets/molecules/timer_chip.dart';

/// multiple choice game screen/widget
class MultipleChoiceGameWidget extends ConsumerStatefulWidget {
  ///  multiple choice game
  final MultipleChoiceGame game;
  /// Callback cuando se completa el juego con puntos ganados
  final ValueChanged<int> onComplete;

  /// Crea un widget de juego de opción múltiple.
  const MultipleChoiceGameWidget({
    required this.game, required this.onComplete, super.key,
  });

  @override
  ConsumerState<MultipleChoiceGameWidget> createState() =>
      _MultipleChoiceGameWidgetState();
}

class _MultipleChoiceGameWidgetState
    extends ConsumerState<MultipleChoiceGameWidget> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selected;
  bool _showFeedback = false;
  Timer? _timer;
  int? _timeLeft;
  bool _finished = false;
  List<int> _shuffledIndices = [];

  MultipleChoiceItem get _item =>
      widget.game.content.items[_currentIndex];

  int get _totalItems => widget.game.content.items.length;

  @override
  void initState() {
    super.initState();
    _shuffleOptions();
    _startTimerIfNeeded();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimerIfNeeded() {
    final seconds = widget.game.timeLimitSeconds;
    if (seconds == null) {
      return;
    }
    _timeLeft = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        return;
      }
      setState(() {
        _timeLeft = (_timeLeft ?? 1) - 1;
        if ((_timeLeft ?? 0) <= 0) {
          _finishGame();
        }
      });
    });
  }

  void _finishGame() {
    if (_finished) {
      return;
    }
    _finished = true;
    _timer?.cancel();
    Future.microtask(() => widget.onComplete(_score));
  }

  void _shuffleOptions() {
    _shuffledIndices =
        List<int>.generate(_item.options.length, (i) => i)..shuffle(Random());
  }

  void _select(int index) {
    if (_showFeedback) {
      return;
    }
    final originalIndex = _shuffledIndices[index];
    final isCorrect = originalIndex == _item.correctAnswer;
    setState(() {
      _selected = index;
      _showFeedback = true;
      _score = max(0, _score + (isCorrect ? 10 : 0));
    });
    _playSound(correct: isCorrect);
    if (isCorrect) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.mediumImpact();
    }

    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) {
        return;
      }
      if (_currentIndex < _totalItems - 1) {
        setState(() {
          _currentIndex++;
          _selected = null;
          _showFeedback = false;
        });
        _shuffleOptions();
      } else {
        _finishGame();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildQuestionCard(),
          const SizedBox(height: 16),
            ..._shuffledIndices.asMap().entries.map((entry) {
              final idx = entry.key;
              final optIndex = entry.value;
              final opt = _item.options[optIndex];
              final isSelected = _selected == idx;
              final isCorrect = optIndex == _item.correctAnswer;
              final show = _showFeedback && isSelected;

            Color bg = AppColors.cardBackground;
            Color fg = AppColors.textPrimary;
            if (show) {
              bg = isCorrect ? AppColors.primaryGreen : AppColors.errorRed;
              fg = Colors.white;
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () => _select(idx),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      _letterBadge(idx, show, isCorrect),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BilingualTextCard(
                          textEn: _apply(opt),
                          textEs: _item.optionsEs.isNotEmpty
                              ? _apply(_item.optionsEs[optIndex])
                              : '',
                          showEs: _item.optionsEs.isNotEmpty,
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          enStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: fg,
                          ),
                          esStyle: TextStyle(
                            color: show ? Colors.white70 : AppColors.textSecondary,
                          ),
                        ),
                      ),
                      if (show)
                        Icon(
                          isCorrect ? Icons.check_circle : Icons.cancel,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
          const Spacer(),
          Center(
            child: ScoreFooter(
              score: _score,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _letterBadge(int idx, bool show, bool isCorrect) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: show
            ? Colors.white.withValues(alpha: 0.25)
            : AppColors.cardBackground,
      ),
      child: Center(
        child: Text(
          String.fromCharCode(65 + idx),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: show ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SectionHeader(
      title: 'Pregunta ${_currentIndex + 1} / $_totalItems',
      trailing: _timeLeft != null
          ? TimerChip(seconds: _timeLeft!)
          : null,
      padding: EdgeInsets.zero,
    );
  }

  Widget _buildQuestionCard() {
    return BilingualTextCard(
      textEn: _apply(_item.question),
      textEs: _apply(_item.questionEs),
      backgroundColor: AppColors.cardBackground,
      padding: const EdgeInsets.all(16),
      borderRadius: 14,
      enStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      esStyle: const TextStyle(
        color: AppColors.textSecondary,
      ),
    );
  }

  Future<void> _playSound({required bool correct}) async {
    try {
      await SystemSound.play(
        correct ? SystemSoundType.click : SystemSoundType.alert,
      );
    } on Exception catch (_) {}
  }

  String _apply(String text) {
    return ref.read(templateVariableServiceProvider).replaceVariables(text);
  }
}
