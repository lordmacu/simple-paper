import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/typing_game.dart';
import '../../../providers/template_variable_provider.dart';
import '../../../widgets/atoms/icon_text_button.dart';
import '../../../widgets/atoms/primary_button.dart';
import '../../../widgets/molecules/bilingual_text_card.dart';
import '../../../widgets/molecules/game_prompt_card.dart';
import '../../../widgets/molecules/hint_row.dart';
import '../../../widgets/molecules/score_footer.dart';
import '../../../widgets/molecules/section_header.dart';
import '../../../widgets/molecules/timer_chip.dart';

/// typing game screen/widget
class TypingGameWidget extends ConsumerStatefulWidget {
  ///  typing game
  final TypingGame game;
  /// Callback cuando se completa el juego con puntos ganados
  final ValueChanged<int> onComplete;

  /// Crea un widget de juego de escritura.
  const TypingGameWidget({
    required this.game, required this.onComplete, super.key,
  });

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
        if (!mounted) {
          return;
        }
        _goNext();
      });
    } else {
      HapticFeedback.mediumImpact();
    }
  }

  void _goNext() {
    if (!mounted) {
      return;
    }
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
          GamePromptCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BilingualTextCard(
                  textEn: promptEs,
                  textEs: promptEs,
                  showEn: false,
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  esStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (hint != null || hintEs != null) ...[
                  const SizedBox(height: 8),
                  HintRow(
                    hint: hint,
                    hintEs: hintEs,
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
                color: AppColors.warningOrange.withValues(alpha: 0.12),
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
            IconTextButton(
              key: const Key('typing_continue'),
              label: 'Continuar',
              icon: Icons.arrow_forward,
              onTap: _goNext,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.secondaryBlue,
              expand: true,
              minHeight: 52,
            )
          else
            PrimaryButton(
              key: const Key('typing_submit'),
              text: 'Enviar',
              onPressed: _submit,
            ),
          const SizedBox(height: 8),
          ScoreFooter(
            label: 'Score',
            score: _score,
          ),
        ],
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
}
