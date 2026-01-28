import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/fill_blank_game.dart';
import '../../../providers/template_variable_provider.dart';
import '../../../../data/services/template_variable_service.dart';

/// Widget interactivo para el juego Fill in the Blank.
class FillBlankGameWidget extends ConsumerStatefulWidget {
  final FillBlankGame game;
  final ValueChanged<int> onComplete;

  const FillBlankGameWidget({
    Key? key,
    required this.game,
    required this.onComplete,
  }) : super(key: key);

  @override
  ConsumerState<FillBlankGameWidget> createState() =>
      _FillBlankGameWidgetState();
}

class _FillBlankGameWidgetState extends ConsumerState<FillBlankGameWidget> {
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
    if (seconds == null) return;
    _timeLeft = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _timeLeft = (_timeLeft ?? 1) - 1;
        if ((_timeLeft ?? 0) <= 0) {
          _finishGame();
        }
      });
    });
  }

  void _finishGame() {
    if (_finished) return;
    _finished = true;
    _timer?.cancel();
    widget.onComplete(_score);
  }

  void _selectOption(String option) {
    if (_selectedOption != null) return;

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

    Future.delayed(const Duration(milliseconds: 2000), () {
      if (!mounted) return;
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
    } catch (_) {
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
          Text(
            'Score: $_score',
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
    return Row(
      children: [
        Text(
          template.replaceVariables('Question ${_currentIndex + 1} / $_totalItems'),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        if (_timeLeft != null) ...[
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
      ],
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
          Text(
            sentenceEs,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          if (_currentItem.hint != null || _currentItem.hintEs != null) ...[
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () => _showHint(template),
              icon: const Icon(Icons.lightbulb_outline, color: AppColors.secondaryBlue),
              label: const Text('Hint'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _blankChip() {
    Color color;
    if (_isCorrect == null) {
      color = AppColors.secondaryBlue.withOpacity(0.15);
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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_currentItem.hint != null)
              Text(template.replaceVariables(_currentItem.hint!)),
            if (_currentItem.hintEs != null) ...[
              const SizedBox(height: 8),
              Text(
                template.replaceVariables(_currentItem.hintEs!),
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          )
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
    Color border = Colors.transparent;
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
            color: Colors.black.withOpacity(0.05),
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
