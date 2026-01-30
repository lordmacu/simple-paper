import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/common/duolingo_button.dart';
import 'review_flashcard_game.dart';

class ReviewFlashcardWidget extends StatefulWidget {
  final ReviewFlashcardGame game;
  final ValueChanged<int> onComplete;

  const ReviewFlashcardWidget({
    super.key,
    required this.game,
    required this.onComplete,
  });

  @override
  State<ReviewFlashcardWidget> createState() => _ReviewFlashcardWidgetState();
}

class _ReviewFlashcardWidgetState extends State<ReviewFlashcardWidget> {
  int _index = 0;
  bool _revealed = false;
  int _score = 0;

  ReviewFlashcardCard get _card => widget.game.cards[_index];
  int get _total => widget.game.cards.length;

  void _reveal() {
    setState(() => _revealed = true);
  }

  void _mark(bool knew) {
    final nextIndex = _index + 1;
    final newScore = knew ? _score + 10 : _score;
    if (nextIndex >= _total) {
      widget.onComplete(newScore);
      return;
    }
    setState(() {
      _index = nextIndex;
      _score = newScore;
      _revealed = false;
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
          Expanded(child: _buildCard()),
          const SizedBox(height: 16),
          if (!_revealed)
            DuolingoButton(
              text: 'Mostrar respuesta',
              onPressed: _reveal,
              icon: Icons.visibility,
            )
          else
            Row(
              children: [
                Expanded(
                  child: DuolingoButton(
                    text: 'Lo sabía',
                    onPressed: () => _mark(true),
                    icon: Icons.check_circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DuolingoButton(
                    text: 'Aprenderé',
                    onPressed: () => _mark(false),
                    isSecondary: true,
                    icon: Icons.refresh,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          'Card ${_index + 1} / $_total',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.secondaryBlue.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Puntaje: $_score',
            style: const TextStyle(
              color: AppColors.secondaryBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.divider, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _card.front,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          if (_revealed) ...[
            const Divider(height: 24),
            Text(
              _card.back,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryGreen,
              ),
              textAlign: TextAlign.center,
            ),
          ] else
            Text(
              '¿Recuerdas la respuesta?',
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          if (_card.hint != null || _card.hintEs != null) ...[
            const SizedBox(height: 16),
            Text(
              _card.hintEs ?? _card.hint!,
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
