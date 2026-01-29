import 'dart:math';

import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../domain/models/story/choice.dart';

/// Botones de elección interactiva en diálogos
class ChoiceButtons extends StatefulWidget {
  final List<Choice> choices;
  final String? selectedChoiceId;
  final Function(String choiceId, int points) onChoiceSelected;

  const ChoiceButtons({
    Key? key,
    required this.choices,
    this.selectedChoiceId,
    required this.onChoiceSelected,
  }) : super(key: key);

  @override
  State<ChoiceButtons> createState() => _ChoiceButtonsState();
}

class _ChoiceButtonsState extends State<ChoiceButtons> {
  late List<Choice> _shuffledChoices;

  @override
  void initState() {
    super.initState();
    _shuffledChoices = _shuffle(widget.choices);
  }

  @override
  void didUpdateWidget(covariant ChoiceButtons oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_sameChoices(oldWidget.choices, widget.choices)) {
      _shuffledChoices = _shuffle(widget.choices);
    }
  }

  List<Choice> _shuffle(List<Choice> choices) {
    final copy = List<Choice>.from(choices);
    copy.shuffle(Random());
    return copy;
  }

  bool _sameChoices(List<Choice> a, List<Choice> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].choiceId != b[i].choiceId) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final hasSelection = widget.selectedChoiceId != null;
    final maxPoints = _shuffledChoices.isNotEmpty
        ? _shuffledChoices
            .map((choice) => choice.points)
            .reduce((a, b) => a > b ? a : b)
        : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Título de instrucción
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            '¿Cual frase es la correcta?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Botones de opciones
        ..._shuffledChoices.asMap().entries.map((entry) {
          final index = entry.key;
          final choice = entry.value;
          final isSelected = widget.selectedChoiceId == choice.choiceId;
          final isDisabled = hasSelection && !isSelected;
          final isCorrect = hasSelection && choice.points == maxPoints;
          final isIncorrectSelected = hasSelection && isSelected && !isCorrect;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ChoiceButton(
              letter: String.fromCharCode(65 + index), // A, B, C, D
              text: choice.text,
              translationEs: choice.translationEs,
              isSelected: isSelected,
              isDisabled: isDisabled,
              showResult: hasSelection,
              isCorrect: isCorrect,
              isIncorrectSelected: isIncorrectSelected,
              onTap: widget.selectedChoiceId == null
                  ? () => widget.onChoiceSelected(choice.choiceId, choice.points)
                  : null,
            ),
          );
        }).toList(),
      ],
    );
  }
}

/// Botón individual de elección
class _ChoiceButton extends StatefulWidget {
  final String letter;
  final String text;
  final String translationEs;
  final bool isSelected;
  final bool isDisabled;
  final bool showResult;
  final bool isCorrect;
  final bool isIncorrectSelected;
  final VoidCallback? onTap;

  const _ChoiceButton({
    Key? key,
    required this.letter,
    required this.text,
    required this.translationEs,
    required this.isSelected,
    required this.isDisabled,
    required this.showResult,
    required this.isCorrect,
    required this.isIncorrectSelected,
    this.onTap,
  }) : super(key: key);

  @override
  State<_ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<_ChoiceButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    Color textColor;

    if (widget.showResult) {
      if (widget.isCorrect) {
        backgroundColor = AppColors.successGreen.withOpacity(0.2);
        borderColor = AppColors.successGreen;
        textColor = AppColors.successGreen;
      } else if (widget.isIncorrectSelected) {
        backgroundColor = AppColors.errorRed.withOpacity(0.2);
        borderColor = AppColors.errorRed;
        textColor = AppColors.errorRed;
      } else {
        backgroundColor = Colors.grey.withOpacity(0.1);
        borderColor = Colors.grey.withOpacity(0.3);
        textColor = Colors.grey;
      }
    } else if (widget.isSelected) {
      backgroundColor = AppColors.primaryGreen.withOpacity(0.2);
      borderColor = AppColors.primaryGreen;
      textColor = AppColors.primaryGreen;
    } else if (widget.isDisabled) {
      backgroundColor = Colors.grey.withOpacity(0.1);
      borderColor = Colors.grey.withOpacity(0.3);
      textColor = Colors.grey;
    } else {
      backgroundColor = Colors.white;
      borderColor = AppColors.cardBackground;
      textColor = AppColors.textPrimary;
    }

    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: widget.onTap != null ? _handleTapDown : null,
        onTapUp: widget.onTap != null ? _handleTapUp : null,
        onTapCancel: _handleTapCancel,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primaryGreen.withOpacity(0.3),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Row(
            children: [
              // Letra de la opción (A, B, C, D)
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: widget.showResult
                      ? (widget.isCorrect
                          ? AppColors.successGreen
                          : widget.isIncorrectSelected
                              ? AppColors.errorRed
                              : Colors.grey.withOpacity(0.3))
                      : widget.isSelected
                          ? AppColors.primaryGreen
                          : widget.isDisabled
                              ? Colors.grey.withOpacity(0.3)
                              : AppColors.secondaryBlue.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    widget.letter,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: widget.showResult
                          ? Colors.white
                          : widget.isSelected
                              ? Colors.white
                              : widget.isDisabled
                                  ? Colors.grey
                                  : AppColors.secondaryBlue,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Texto de la opción
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.translationEs,
                      style: TextStyle(
                        fontSize: 13,
                        color: textColor.withOpacity(0.7),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              // Icono de selección
              if (widget.showResult)
                Icon(
                  widget.isCorrect
                      ? Icons.check_circle
                      : widget.isIncorrectSelected
                          ? Icons.cancel
                          : Icons.circle_outlined,
                  color: widget.isCorrect
                      ? AppColors.successGreen
                      : widget.isIncorrectSelected
                          ? AppColors.errorRed
                          : Colors.grey.withOpacity(0.4),
                  size: 24,
                )
              else if (widget.isSelected)
                const Icon(
                  Icons.check_circle,
                  color: AppColors.primaryGreen,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
