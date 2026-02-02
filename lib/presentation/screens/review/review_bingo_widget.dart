import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/app_colors.dart';
import 'review_bingo_game.dart';
import '../../widgets/molecules/bilingual_text_card.dart';
import '../../widgets/molecules/prompt_card.dart';
import '../../widgets/molecules/review_header_row.dart';
import '../../widgets/molecules/score_footer.dart';

/// review bingo screen/widget
class ReviewBingoWidget extends StatefulWidget {
  /// Juego de bingo de revisión
  final ReviewBingoGame game;
  /// Callback cuando se completa el juego
  final ValueChanged<int> onComplete;

  /// Crea un widget de juego de bingo de revisión.
  const ReviewBingoWidget({
    required this.game, required this.onComplete, super.key,
  });

  @override
  State<ReviewBingoWidget> createState() => _ReviewBingoWidgetState();
}

class _ReviewBingoWidgetState extends State<ReviewBingoWidget> {
  int _index = 0;
  int _score = 0;
  int? _selected;
  bool _locked = false;

  ReviewBingoRound get _round => widget.game.rounds[_index];
  int get _total => widget.game.rounds.length;

  void _tapOption(int index) {
    if (_locked) {
      return;
    }
    final isCorrect = index == _round.correctIndex;
    setState(() {
      _selected = index;
      _locked = true;
      if (isCorrect) {
        _score += 10;
      }
    });
    if (isCorrect) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.mediumImpact();
    }
    Timer(const Duration(milliseconds: 900), _next);
  }

  void _next() {
    if (!mounted) {
      return;
    }
    if (_index + 1 >= _total) {
      widget.onComplete(_score);
      return;
    }
    setState(() {
      _index += 1;
      _selected = null;
      _locked = false;
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
          _buildPromptCard(),
          const SizedBox(height: 16),
          Expanded(child: _buildOptionsGrid()),
          const SizedBox(height: 8),
          ScoreFooter(score: _score),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return ReviewHeaderRow(
      title: 'Pregunta ${_index + 1} / $_total',
      score: _score,
    );
  }

  Widget _buildPromptCard() {
    return PromptCard(
      child: BilingualTextCard(
        textEn: _round.prompt,
        textEs: _round.promptEs,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        enStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        esStyle: const TextStyle(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildOptionsGrid() {
    return GridView.builder(
      itemCount: _round.options.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        final option = _round.options[index];
        final isCorrect = index == _round.correctIndex;
        final isSelected = _selected == index;
        Color bg = AppColors.cardBackground;
        Color fg = AppColors.textPrimary;
        if (_locked && isCorrect) {
          bg = AppColors.primaryGreen;
          fg = Colors.white;
        } else if (_locked && isSelected) {
          bg = AppColors.errorRed;
          fg = Colors.white;
        }
        return InkWell(
          onTap: () => _tapOption(index),
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.divider, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                option,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: fg,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
