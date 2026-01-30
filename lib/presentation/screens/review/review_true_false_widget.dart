import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/app_colors.dart';
import 'review_true_false_game.dart';

class ReviewTrueFalseWidget extends StatefulWidget {
  final ReviewTrueFalseGame game;
  final ValueChanged<int> onComplete;

  const ReviewTrueFalseWidget({
    super.key,
    required this.game,
    required this.onComplete,
  });

  @override
  State<ReviewTrueFalseWidget> createState() => _ReviewTrueFalseWidgetState();
}

class _ReviewTrueFalseWidgetState extends State<ReviewTrueFalseWidget> {
  int _index = 0;
  int _score = 0;
  bool _locked = false;
  bool? _selectedTrue;

  ReviewTrueFalseItem get _item => widget.game.items[_index];
  int get _total => widget.game.items.length;

  void _answer(bool value) {
    if (_locked) return;
    final isCorrect = value == _item.isTrue;
    setState(() {
      _selectedTrue = value;
      _locked = true;
      if (isCorrect) _score += 10;
    });
    if (isCorrect) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.mediumImpact();
    }
    Future.delayed(const Duration(milliseconds: 900), _next);
  }

  void _next() {
    if (!mounted) return;
    if (_index + 1 >= _total) {
      widget.onComplete(_score);
      return;
    }
    setState(() {
      _index += 1;
      _locked = false;
      _selectedTrue = null;
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
          _buildCard(),
          const SizedBox(height: 24),
          _buildChoiceButton(
            label: 'Verdadero',
            icon: Icons.check_circle,
            value: true,
          ),
          const SizedBox(height: 12),
          _buildChoiceButton(
            label: 'Falso',
            icon: Icons.cancel,
            value: false,
          ),
          const Spacer(),
          Text(
            'Puntaje: $_score',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          'Pregunta ${_index + 1} / $_total',
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

  Widget _buildChoiceButton({
    required String label,
    required IconData icon,
    required bool value,
  }) {
    final color = _buttonColor(value);
    final foreground = _buttonForeground(value);
    return ElevatedButton.icon(
      onPressed: _locked ? null : () => _answer(value),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: foreground,
        disabledBackgroundColor: color,
        disabledForegroundColor: foreground,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      icon: Icon(icon),
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Color _buttonColor(bool value) {
    if (!_locked) {
      return AppColors.cardBackground;
    }
    if (value == _item.isTrue) {
      return AppColors.primaryGreen;
    }
    if (_selectedTrue == value) {
      return AppColors.errorRed;
    }
    return AppColors.cardBackground;
  }

  Color _buttonForeground(bool value) {
    if (!_locked) {
      return AppColors.textPrimary;
    }
    if (value == _item.isTrue) {
      return Colors.white;
    }
    if (_selectedTrue == value) {
      return Colors.white;
    }
    return AppColors.textPrimary;
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _item.statement,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _item.statementEs,
            style: const TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
