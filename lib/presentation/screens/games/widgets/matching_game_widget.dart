import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/game/matching_game.dart';
import '../../../providers/template_variable_provider.dart';
import '../../../../data/services/template_variable_service.dart';

/// Widget interactivo para el juego de Matching (drag & drop).
class MatchingGameWidget extends ConsumerStatefulWidget {
  final MatchingGame game;
  final ValueChanged<int> onComplete;

  const MatchingGameWidget({
    Key? key,
    required this.game,
    required this.onComplete,
  }) : super(key: key);

  @override
  ConsumerState<MatchingGameWidget> createState() => _MatchingGameWidgetState();
}

class _MatchingGameWidgetState extends ConsumerState<MatchingGameWidget> {
  late List<MatchingItem> _leftItems;
  late List<MatchingItem> _rightItems;
  final Set<int> _matchedIds = {};
  int _score = 0;
  Timer? _timer;
  int? _timeLeft;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _setupItems();
    _startTimerIfNeeded();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _setupItems() {
    final items = widget.game.content.items;
    _leftItems = List<MatchingItem>.from(items);
    _rightItems = List<MatchingItem>.from(items);

    if (widget.game.settings?.shuffle ?? true) {
      _leftItems.shuffle(Random());
      _rightItems.shuffle(Random());
    }
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
    // Llamar onComplete en el siguiente microtask para evitar conflictos de layout
    Future.microtask(() => widget.onComplete(_score));
  }

  void _handleMatch(MatchingItem target, MatchingItem dragged) {
    final isCorrect = target.id == dragged.id;
    setState(() {
      if (isCorrect) {
        _matchedIds.add(target.id);
        _score += 10;
        _playSound(correct: true);
        HapticFeedback.lightImpact();
      } else {
        _score = max(0, _score - 5);
        _playSound(correct: false);
        HapticFeedback.mediumImpact();
      }
    });

    if (_matchedIds.length == widget.game.content.items.length) {
      _finishGame();
    }
  }

  Future<void> _playSound({required bool correct}) async {
    try {
      await SystemSound.play(
        correct ? SystemSoundType.click : SystemSoundType.alert,
      );
    } catch (_) {
      // Silently ignore sound failures
    }
  }

  @override
  Widget build(BuildContext context) {
    final template = ref.read(templateVariableServiceProvider);
    final instructions = template.replaceVariables(widget.game.instructions);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildHeader(instructions, template),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildColumn(_leftItems, template, isTarget: true)),
                const SizedBox(width: 12),
                Expanded(child: _buildColumn(_rightItems, template)),
              ],
            ),
          ),
          const SizedBox(height: 12),
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

  Widget _buildHeader(String instructions, TemplateVariableService template) {
    final matched = _matchedIds.length;
    final total = widget.game.content.items.length;

    return Wrap(
      spacing: 12,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 220),
          child: Text(
            instructions,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            softWrap: true,
          ),
        ),
        InkWell(
          onTap: _showInstructionTranslation,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.secondaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.translate, size: 16, color: AppColors.secondaryBlue),
                SizedBox(width: 6),
                Text(
                  'ES',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.link, size: 18, color: AppColors.secondaryBlue),
              const SizedBox(width: 6),
              Text(
                '$matched/$total',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        if (_timeLeft != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.warningOrange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
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

  void _showInstructionTranslation() {
    final instructionsEs = widget.game.instructionsEs;
    if (instructionsEs.isEmpty) return;
    final template = ref.read(templateVariableServiceProvider);
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Instrucciones (ES)'),
        content: Text(
          template.replaceVariables(instructionsEs),
          style: const TextStyle(color: AppColors.textPrimary, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(
    List<MatchingItem> items,
    TemplateVariableService template, {
    bool isTarget = false,
  }) {
    return Column(
      children: [
        for (final item in items) ...[
          _buildCard(item, template: template, isTarget: isTarget),
          const SizedBox(height: 12),
        ],
      ],
    );
  }

  Widget _buildCard(
    MatchingItem item, {
    required TemplateVariableService template,
    required bool isTarget,
  }) {
    final matched = _matchedIds.contains(item.id);
    final left = template.replaceVariables(item.left);
    final right = template.replaceVariables(item.right);

    if (isTarget) {
      return DragTarget<MatchingItem>(
        onWillAccept: (_) => !matched,
        onAccept: (dragged) => _handleMatch(item, dragged),
        builder: (context, candidateData, rejectedData) {
          final hovering = candidateData.isNotEmpty;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: BoxDecoration(
              color: matched
                  ? AppColors.primaryGreen.withOpacity(0.15)
                  : hovering
                      ? AppColors.secondaryBlue.withOpacity(0.1)
                      : AppColors.cardBackground,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: matched
                    ? AppColors.primaryGreen
                    : hovering
                        ? AppColors.secondaryBlue
                        : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  matched ? Icons.check_circle : Icons.anchor,
                  color: matched ? AppColors.primaryGreen : AppColors.textSecondary,
                  size: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: matched ? AppColors.primaryGreen : AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    // Draggable side (right column)
    return Opacity(
      opacity: matched ? 0.35 : 1,
      child: Draggable<MatchingItem>(
        data: item,
        feedback: _dragChip(right),
        childWhenDragging: _dragChip(right, dimmed: true),
        child: _dragChip(right),
      ),
    );
  }

  Widget _dragChip(String text, {bool dimmed = false}) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: dimmed
              ? AppColors.cardBackground.withOpacity(0.6)
              : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: dimmed ? AppColors.textSecondary : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
