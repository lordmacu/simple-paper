import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/typing_game.dart';
import '../../../providers/template_variable_provider.dart';

class TypingGameWidget extends ConsumerStatefulWidget {
  final TypingGame game;
  final ValueChanged<int> onComplete;

  const TypingGameWidget({
    Key? key,
    required this.game,
    required this.onComplete,
  }) : super(key: key);

  @override
  ConsumerState<TypingGameWidget> createState() => _TypingGameWidgetState();
}

class _TypingGameWidgetState extends ConsumerState<TypingGameWidget> {
  int _currentIndex = 0;
  int _score = 0;
  String _input = '';
  String? _error;
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int? _timeLeft;
  String? _revealedAnswer;
  bool _awaitingContinue = false;

  TypingItem get _item => widget.game.content.items[_currentIndex];
  int get _totalItems => widget.game.content.items.length;

  @override
  void initState() {
    super.initState();
    _startTimerIfNeeded();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
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
          _finish();
        }
      });
    });
  }

  void _submit() {
    final attempt = _input.trim();
    if (attempt.isEmpty) {
      setState(() => _error = 'Escribe tu respuesta');
      HapticFeedback.mediumImpact();
      return;
    }

    final correct = attempt.toLowerCase() ==
        _item.answerEn.trim().toLowerCase();

    setState(() {
      _error = null;
      _score = max(0, _score + (correct ? 10 : 0));
      _revealedAnswer = correct ? null : _item.answerEn;
      _awaitingContinue = !correct;
    });

    if (correct) {
      HapticFeedback.lightImpact();
      Future.delayed(const Duration(milliseconds: 900), () {
        if (!mounted) return;
        _goNext();
      });
    } else {
      HapticFeedback.mediumImpact();
    }
  }

  void _goNext() {
    if (!mounted) return;
    if (_currentIndex < _totalItems - 1) {
      setState(() {
        _currentIndex++;
        _input = '';
        _controller.clear();
        _revealedAnswer = null;
        _awaitingContinue = false;
      });
    } else {
      _finish();
    }
  }

  void _finish() {
    _timer?.cancel();
    widget.onComplete(_score);
  }

  @override
  Widget build(BuildContext context) {
    final template = ref.read(templateVariableServiceProvider);
    final promptEs = template.replaceVariables(_item.promptEs);
    final hint = _item.hint != null
        ? template.replaceVariables(_item.hint!)
        : null;
    final hintEs = _item.hintEs != null
        ? template.replaceVariables(_item.hintEs!)
        : null;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promptEs,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (hint != null || hintEs != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.lightbulb_outline,
                          size: 18, color: AppColors.secondaryBlue),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (hint != null)
                              Text(
                                hint,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            if (hintEs != null)
                              Text(
                                hintEs,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            key: const Key('typing_input'),
            controller: _controller,
            onChanged: (v) => setState(() {
              _input = v;
            }),
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(
              hintText: 'Escribe en inglés',
              errorText: _error,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          if (_revealedAnswer != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.warningOrange.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.visibility, color: AppColors.warningOrange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Respuesta correcta: ${_revealedAnswer!}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const Spacer(),
          if (_awaitingContinue)
            ElevatedButton(
              key: const Key('typing_continue'),
              onPressed: _goNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryBlue,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          else
            ElevatedButton(
              key: const Key('typing_submit'),
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Enviar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 8),
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
          'Pregunta ${_currentIndex + 1} / $_totalItems',
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
}
