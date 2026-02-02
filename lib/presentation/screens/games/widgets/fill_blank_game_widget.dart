import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/fill_blank_game.dart';
import '../../../providers/template_variable_provider.dart';
import '../../../../data/services/template_variable_service.dart';
import '../../../widgets/atoms/icon_text_button.dart';
import '../../../widgets/molecules/bilingual_text_card.dart';
import '../../../widgets/molecules/score_footer.dart';
import '../../../widgets/molecules/section_header.dart';
import '../../../widgets/molecules/timer_chip.dart';
import '../../../widgets/molecules/dialog_action_row.dart';

/// Widget interactivo para el juego Fill in the Blank.
class FillBlankGameWidget extends ConsumerStatefulWidget {
  /// Juego de llenar espacios en blanco
  final FillBlankGame game;
  /// Callback cuando se completa el juego
  final ValueChanged<int> onComplete;

  /// Crea una instancia de fill blank game widget.
  const FillBlankGameWidget({
    required this.game, required this.onComplete, super.key,
  });

  @override
  ConsumerState<FillBlankGameWidget> createState() =>
      _FillBlankGameWidgetState();
}

class _FillBlankGameWidgetState extends ConsumerState<FillBlankGameWidget> {
  static const Duration _feedbackDelay = Duration(milliseconds: 500);
  int _currentIndex = 0;
  int _score = 0;
  Timer? _timer;
  int? _timeLeft;
  bool _finished = false;
  String? _selectedOption;
  bool? _isCorrect;
  List<String> _shuffledOptions = [];

  FillBlankItem get _currentItem => widget.game.content.items[_currentIndex];
  int get _totalItems => widget.game.content.items.length;

  @override
  void initState() {
    super.initState();
    _startTimerIfNeeded();
    _prepareOptions();
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
    widget.onComplete(_score);
  }

  void _selectOption(String option) {
    if (_selectedOption != null) {
      return;
    }

    final correct = option.trim().toLowerCase() ==
        _currentItem.answer.trim().toLowerCase();

    setState(() {
      _selectedOption = option;
      _isCorrect = correct;
      _score += correct ? 10 : -5;
      _score = max(0, _score);
    });

    _playSound(correct: correct);
    if (correct) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.mediumImpact();
    }

    Future.delayed(_feedbackDelay, () {
      if (!mounted) {
        return;
      }
      if (_currentIndex < _totalItems - 1) {
        setState(() {
          _currentIndex++;
          _selectedOption = null;
          _isCorrect = null;
          _prepareOptions();
        });
      } else {
        _finishGame();
      }
    });
  }

  Future<void> _playSound({required bool correct}) async {
    try {
      await SystemSound.play(
        correct ? SystemSoundType.click : SystemSoundType.alert,
      );
    } on Exception catch (_) {
      // Ignorar errores de sonido
    }
  }

  void _prepareOptions() {
    _shuffledOptions = List<String>.from(_currentItem.options);
    _shuffledOptions.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final template = ref.read(templateVariableServiceProvider);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildHeader(template),
          const SizedBox(height: 16),
          _buildSentenceCard(template),
          const SizedBox(height: 24),
          _buildOptions(template),
          const Spacer(),
          ScoreFooter(
            label: 'Score',
            score: _score,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildHeader(TemplateVariableService template) {
    return SectionHeader(
      title: template.replaceVariables('Question ${_currentIndex + 1} / $_totalItems'),
      trailing: _timeLeft != null
          ? TimerChip(seconds: _timeLeft!)
          : null,
      padding: EdgeInsets.zero,
    );
  }

  Widget _buildSentenceCard(TemplateVariableService template) {
    final sentence = template.replaceVariables(_currentItem.sentence);
    final sentenceEs = template.replaceVariables(_currentItem.sentenceEs);
    final parts = sentence.split('_____');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              Text(
                parts[0],
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.textPrimary,
                ),
              ),
              _blankChip(),
              if (parts.length > 1)
                Text(
                  parts.sublist(1).join('_____'),
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.textPrimary,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          BilingualTextCard(
            textEn: sentence,
            textEs: sentenceEs,
            showEn: false,
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            esStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          if (_currentItem.hint != null || _currentItem.hintEs != null) ...[
            const SizedBox(height: 12),
            IconTextButton(
              label: 'Hint',
              icon: Icons.lightbulb_outline,
              onTap: () => _showHint(template),
              foregroundColor: AppColors.secondaryBlue,
            ),
          ],
        ],
      ),
    );
  }

  Widget _blankChip() {
    Color color;
    if (_isCorrect == null) {
      color = AppColors.secondaryBlue.withValues(alpha: 0.15);
    } else {
      color = _isCorrect! ? AppColors.primaryGreen : AppColors.errorRed;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        _selectedOption ?? '_____',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: _isCorrect == null
              ? AppColors.textPrimary
              : Colors.white,
        ),
      ),
    );
  }

  Widget _buildOptions(TemplateVariableService template) {
    return Column(
      children: _shuffledOptions
          .map(
            (option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: _OptionButton(
                text: template.replaceVariables(option),
                isSelected: _selectedOption == option,
                isCorrect: _selectedOption != null &&
                    option == _currentItem.answer &&
                    _isCorrect == true,
                isWrong: _selectedOption == option && _isCorrect == false,
                onTap: () => _selectOption(option),
              ),
            ),
          )
          .toList(),
    );
  }

  void _showHint(TemplateVariableService template) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Hint'),
        content: BilingualTextCard(
          textEn: _currentItem.hint != null
              ? template.replaceVariables(_currentItem.hint!)
              : '',
          textEs: _currentItem.hintEs != null
              ? template.replaceVariables(_currentItem.hintEs!)
              : '',
          showEn: _currentItem.hint != null,
          showEs: _currentItem.hintEs != null,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          enStyle: const TextStyle(color: AppColors.textPrimary),
          esStyle: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          DialogActionRow(
            primaryAction: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final VoidCallback onTap;

  const _OptionButton({
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.isWrong,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = AppColors.cardBackground;
    const Color border = Colors.transparent;
    Color fg = AppColors.textPrimary;

    if (isSelected) {
      bg = isCorrect
          ? AppColors.primaryGreen
          : isWrong
              ? AppColors.errorRed
              : AppColors.secondaryBlue;
      fg = Colors.white;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: fg,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
