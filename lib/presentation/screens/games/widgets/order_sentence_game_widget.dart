import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/order_sentence_game.dart';
import '../../../providers/template_variable_provider.dart';

class OrderSentenceGameWidget extends ConsumerStatefulWidget {
  final OrderSentenceGame game;
  final ValueChanged<int> onComplete;

  const OrderSentenceGameWidget({
    Key? key,
    required this.game,
    required this.onComplete,
  }) : super(key: key);

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
    if (_selected.isEmpty) return;
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
        if (!mounted) return;
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
    final template = ref.read(templateVariableServiceProvider);
    final promptRaw =
        _item.prompt != null ? template.replaceVariables(_item.prompt!) : null;
    final promptEsRaw = _item.promptEs != null
        ? template.replaceVariables(_item.promptEs!)
        : null;

    bool _isSameAsAnswer(String? text) {
      if (text == null) return false;
      return text.trim().toLowerCase() ==
          _item.correctSentence.trim().toLowerCase();
    }

    // Oculta cualquier prompt que coincida con la respuesta correcta
    final String? prompt =
        (_isSameAsAnswer(promptRaw)) ? null : promptRaw;
    final String? promptEs =
        (_isSameAsAnswer(promptEsRaw)) ? null : promptEsRaw;

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
                color: AppColors.warningOrange.withOpacity(0.12),
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
            ElevatedButton(
              onPressed: _goNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryBlue,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else
            ElevatedButton(
              onPressed: _selected.isEmpty ? null : _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Confirmar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          TextButton(
            onPressed: _removeLast,
            child: const Text('Deshacer última palabra'),
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
          'Frase ${_currentIndex + 1} / $_totalItems',
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
                      backgroundColor: AppColors.primaryGreen.withOpacity(0.15),
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
