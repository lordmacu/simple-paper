import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/spot_word_game.dart';
import '../../../providers/template_variable_provider.dart';
import '../../../../data/services/template_variable_service.dart';

class SpotWordGameWidget extends ConsumerStatefulWidget {
  final SpotWordGame game;
  final ValueChanged<int> onComplete;

  const SpotWordGameWidget({
    Key? key,
    required this.game,
    required this.onComplete,
  }) : super(key: key);

  @override
  ConsumerState<SpotWordGameWidget> createState() => _SpotWordGameWidgetState();
}

class _SpotWordGameWidgetState extends ConsumerState<SpotWordGameWidget> {
  int _currentIndex = 0;
  int _score = 0;
  bool _showFeedback = false;
  int? _selected;
  Timer? _timer;
  int? _timeLeft;
  List<int> _shuffledIndices = [];

  SpotWordItem get _item => widget.game.content.items[_currentIndex];
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

  void _shuffleOptions() {
    _shuffledIndices =
        List<int>.generate(_item.options.length, (i) => i)..shuffle(Random());
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
    final prompt = _item.prompt != null ? template.replaceVariables(_item.prompt!) : '';
    final promptEs = _item.promptEs != null ? template.replaceVariables(_item.promptEs!) : null;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          if (_item.imageUrl != null)
            _buildImage(_item.imageUrl!),
          const SizedBox(height: 12),
          if (prompt.isNotEmpty)
            Text(
              prompt,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          if (promptEs != null && promptEs.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              promptEs,
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ],
          const SizedBox(height: 16),
          _buildOptions(template),
          const Spacer(),
          Text(
            'Score: $_score',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          'Imagen ${_currentIndex + 1} / $_totalItems',
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

  Widget _buildImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: url,
        height: 180,
        fit: BoxFit.cover,
        placeholder: (context, _) => Container(
          height: 180,
          color: AppColors.cardBackground,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, _, __) => Container(
          height: 180,
          color: AppColors.cardBackground,
          child: const Center(child: Icon(Icons.broken_image, color: AppColors.textSecondary)),
        ),
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
        final isCorrect =
            _showFeedback && optionIndex == _item.correctAnswer;
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
