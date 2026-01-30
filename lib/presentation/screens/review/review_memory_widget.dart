import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/app_colors.dart';
import 'review_memory_game.dart';

class ReviewMemoryWidget extends StatefulWidget {
  final ReviewMemoryGame game;
  final ValueChanged<int> onComplete;

  const ReviewMemoryWidget({
    super.key,
    required this.game,
    required this.onComplete,
  });

  @override
  State<ReviewMemoryWidget> createState() => _ReviewMemoryWidgetState();
}

class _ReviewMemoryWidgetState extends State<ReviewMemoryWidget> {
  late final List<_MemoryCard> _cards;
  _MemoryCard? _firstPick;
  _MemoryCard? _secondPick;
  int _score = 0;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _cards = _buildCards(widget.game.pairs);
  }

  List<_MemoryCard> _buildCards(List<ReviewMemoryPair> pairs) {
    final cards = <_MemoryCard>[];
    for (final pair in pairs) {
      cards.add(
        _MemoryCard(
          id: '${pair.id}-L',
          pairId: pair.id,
          text: pair.left,
        ),
      );
      cards.add(
        _MemoryCard(
          id: '${pair.id}-R',
          pairId: pair.id,
          text: pair.right,
        ),
      );
    }
    cards.shuffle(Random());
    return cards;
  }

  void _onTap(_MemoryCard card) {
    if (_busy || card.matched || card.revealed) return;
    setState(() {
      card.revealed = true;
      if (_firstPick == null) {
        _firstPick = card;
      } else {
        _secondPick = card;
      }
    });

    if (_firstPick != null && _secondPick != null) {
      _checkMatch();
    }
  }

  void _checkMatch() {
    final first = _firstPick!;
    final second = _secondPick!;
    final isMatch = first.pairId == second.pairId;

    setState(() {
      _busy = true;
    });

    if (isMatch) {
      setState(() {
        first.matched = true;
        second.matched = true;
        _score += 10;
      });
      HapticFeedback.lightImpact();
      _resetTurn();
      if (_cards.every((c) => c.matched)) {
        widget.onComplete(_score);
      }
    } else {
      HapticFeedback.mediumImpact();
      Timer(const Duration(milliseconds: 800), () {
        setState(() {
          first.revealed = false;
          second.revealed = false;
        });
        _resetTurn();
      });
    }
  }

  void _resetTurn() {
    setState(() {
      _firstPick = null;
      _secondPick = null;
      _busy = false;
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
          Text(
            widget.game.instructionsEs,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(child: _buildGrid()),
          const SizedBox(height: 8),
          Text(
            'Puntaje: $_score',
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
    final remaining =
        _cards.where((card) => !card.matched).length ~/ 2;
    return Row(
      children: [
        Text(
          'Pares restantes: $remaining',
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

  Widget _buildGrid() {
    final columns = _cards.length <= 8 ? 2 : 3;
    return GridView.builder(
      itemCount: _cards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        final card = _cards[index];
        return _MemoryCardTile(
          card: card,
          onTap: () => _onTap(card),
        );
      },
    );
  }
}

class _MemoryCard {
  final String id;
  final int pairId;
  final String text;
  bool revealed = false;
  bool matched = false;

  _MemoryCard({
    required this.id,
    required this.pairId,
    required this.text,
  });
}

class _MemoryCardTile extends StatelessWidget {
  final _MemoryCard card;
  final VoidCallback onTap;

  const _MemoryCardTile({
    required this.card,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final visible = card.revealed || card.matched;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: visible ? Colors.white : AppColors.secondaryBlue.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: visible ? AppColors.divider : Colors.transparent,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            visible ? card.text : '?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: visible ? AppColors.textPrimary : AppColors.secondaryBlue,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
