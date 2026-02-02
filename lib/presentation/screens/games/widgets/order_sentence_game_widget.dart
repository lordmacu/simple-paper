import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/order_sentence_game.dart';
import '../../../widgets/atoms/icon_text_button.dart';
import '../../../widgets/atoms/primary_button.dart';
import '../../../widgets/molecules/score_footer.dart';
import '../../../widgets/molecules/section_header.dart';
import '../../../widgets/molecules/timer_chip.dart';

/// order sentence game screen/widget
class OrderSentenceGameWidget extends ConsumerStatefulWidget {
  ///  order sentence game
  final OrderSentenceGame game;
  /// Callback cuando se completa el juego con puntos ganados
  final ValueChanged<int> onComplete;

  /// Crea un widget de juego de ordenar oraciones.
  const OrderSentenceGameWidget({
    required this.game, required this.onComplete, super.key,
  });

  @override
  ConsumerState<OrderSentenceGameWidget> createState() =>
      _OrderSentenceGameWidgetState();
}

class _OrderSentenceGameWidgetState
    extends ConsumerState<OrderSentenceGameWidget> {
  int _currentIndex = 0;
  int _score = 0;
  List<String> _currentWords = [];
  List<String> _selected = [];
  Timer? _timer;
  int? _timeLeft;
  String? _revealedSentence;
  bool _awaitingContinue = false;

  OrderSentenceItem get _item => widget.game.content.items[_currentIndex];
  int get _totalItems => widget.game.content.items.length;

  @override
  void initState() {
    super.initState();
    _prepareWords();
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
          _finish();
        }
      });
    });
  }

  void _prepareWords() {
    _selected = [];
    _currentWords = List<String>.from(_item.words.isNotEmpty
        ? _item.words
        : _item.correctSentence.split(' '));
    _currentWords.shuffle(Random());
    _revealedSentence = null;
    _awaitingContinue = false;
  }

  void _selectWord(String word) {
    setState(() {
      _currentWords.remove(word);
      _selected.add(word);
    });
    HapticFeedback.selectionClick();
  }

  void _removeLast() {
    if (_selected.isEmpty) {
      return;
    }
    setState(() {
      final last = _selected.removeLast();
      _currentWords.insert(0, last);
    });
  }

  void _submit() {
    final attempt = _selected.join(' ').trim();
    final correct = attempt.toLowerCase() ==
        _item.correctSentence.trim().toLowerCase();
    setState(() {
      _score = max(0, _score + (correct ? 10 : 0));
      if (!correct) {
        _revealedSentence = _item.correctSentence;
        _awaitingContinue = true;
      }
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
    if (_currentIndex < _totalItems - 1) {
      setState(() {
        _currentIndex++;
      });
      _prepareWords();
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),

          const SizedBox(height: 14),
          _buildSelected(),
          if (_revealedSentence != null) ...[
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
                      'Frase correcta: ${_revealedSentence!}',
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
          const SizedBox(height: 12),
          _buildChoices(),
          const Spacer(),
          if (_awaitingContinue)
            IconTextButton(
              label: 'Continuar',
              icon: Icons.arrow_forward,
              onTap: _goNext,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.secondaryBlue,
              expand: true,
              minHeight: 48,
            )
          else
            PrimaryButton(
              text: 'Confirmar',
              onPressed: _selected.isEmpty ? null : _submit,
            ),
          TextButton(
            onPressed: _removeLast,
            child: const Text('Deshacer última palabra'),
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
      title: 'Frase ${_currentIndex + 1} / $_totalItems',
      trailing: _timeLeft != null
          ? TimerChip(seconds: _timeLeft!)
          : null,
      padding: EdgeInsets.zero,
    );
  }

  Widget _buildSelected() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: _selected.isEmpty
            ? [
                const Text(
                  'Toca las palabras para armar la frase',
                  style: TextStyle(color: AppColors.textSecondary),
                )
              ]
            : _selected
                .map((w) => Chip(
                      label: Text(
                        w,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      backgroundColor: AppColors.primaryGreen.withValues(alpha: 0.15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ))
                .toList(),
      ),
    );
  }

  Widget _buildChoices() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _currentWords
          .map(
            (w) => ChoiceChip(
              key: ValueKey('word-$w'),
              label: Text(
                w,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              selected: false,
              onSelected: (_) => _selectWord(w),
              selectedColor: AppColors.primaryGreen,
            ),
          )
          .toList(),
    );
  }
}
