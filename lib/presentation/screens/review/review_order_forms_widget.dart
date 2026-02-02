import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/common/duolingo_button.dart';
import '../../widgets/molecules/bilingual_text_card.dart';
import '../../widgets/molecules/prompt_card.dart';
import '../../widgets/molecules/review_header_row.dart';
import 'review_order_forms_game.dart';

/// review order forms screen/widget
class ReviewOrderFormsWidget extends StatefulWidget {
  ///  review order forms game
  final ReviewOrderFormsGame game;
  /// Callback cuando se completa el juego
  final ValueChanged<int> onComplete;

  /// Crea un widget de juego de ordenar formas de revisión.
  const ReviewOrderFormsWidget({
    required this.game, required this.onComplete, super.key,
  });

  @override
  State<ReviewOrderFormsWidget> createState() =>
      _ReviewOrderFormsWidgetState();
}

class _ReviewOrderFormsWidgetState extends State<ReviewOrderFormsWidget> {
  int _index = 0;
  int _score = 0;
  bool _checked = false;
  late List<_OrderToken> _order;

  ReviewOrderFormsItem get _item => widget.game.items[_index];
  int get _total => widget.game.items.length;

  @override
  void initState() {
    super.initState();
    _resetOrder();
  }

  void _resetOrder() {
    final forms = [_item.base, _item.past, _item.participle];
    forms.shuffle(Random());
    _order = List.generate(
      forms.length,
      (index) => _OrderToken(id: index, text: forms[index]),
    );
    _checked = false;
  }

  void _check() {
    final correct = _order[0].text == _item.base &&
        _order[1].text == _item.past &&
        _order[2].text == _item.participle;
    setState(() {
      _checked = true;
      if (correct) {
        _score += 10;
      }
    });
  }

  void _next() {
    if (_index + 1 >= _total) {
      widget.onComplete(_score);
      return;
    }
    setState(() {
      _index += 1;
      _resetOrder();
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
          const SizedBox(height: 16),
          _buildOrderList(),
          const Spacer(),
          if (!_checked)
            DuolingoButton(
              text: 'Verificar',
              onPressed: _check,
              icon: Icons.check,
            )
          else
            DuolingoButton(
              text: _index + 1 >= _total ? 'Finalizar' : 'Siguiente',
              onPressed: _next,
              icon: Icons.arrow_forward,
            ),
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

  Widget _buildCard() {
    return PromptCard(
      child: BilingualTextCard(
        textEn: 'Orden correcto: base → past → participle',
        textEs: widget.game.instructionsEs,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        enStyle: const TextStyle(
          color: AppColors.textSecondary,
        ),
        esStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildOrderList() {
    return ReorderableListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      onReorder: (oldIndex, newIndex) {
        if (_checked) {
          return;
        }
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = _order.removeAt(oldIndex);
          _order.insert(newIndex, item);
        });
      },
      children: [
        for (var i = 0; i < _order.length; i++)
          _OrderChip(
            key: ValueKey('${_order[i].id}-$_index'),
            text: _order[i].text,
            isCorrect: _checked ? _order[i].text == _targetAt(i) : null,
          ),
      ],
    );
  }

  String _targetAt(int index) {
    if (index == 0) {
      return _item.base;
    }
    if (index == 1) {
      return _item.past;
    }
    return _item.participle;
  }
}

class _OrderChip extends StatelessWidget {
  final String text;
  final bool? isCorrect;

  const _OrderChip({
    required super.key,
    required this.text,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = Colors.white;
    Color fg = AppColors.textPrimary;
    if (isCorrect != null) {
      bg = isCorrect! ? AppColors.primaryGreen : AppColors.errorRed;
      fg = Colors.white;
    }

    return Container(
      key: key,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
      child: Row(
        children: [
          const Icon(Icons.drag_indicator, color: AppColors.textSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: fg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderToken {
  final int id;
  final String text;

  const _OrderToken({
    required this.id,
    required this.text,
  });
}
