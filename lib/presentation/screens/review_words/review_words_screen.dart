import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../domain/models/progress/review_word_entry.dart';
import '../../../domain/models/vocabulary/vocabulary_word.dart';
import '../../providers/episode_providers.dart';
import '../../providers/progress_providers.dart';
import '../../widgets/vocabulary/vocabulary_definition_popup.dart';

class ReviewWordsScreen extends ConsumerWidget {
  const ReviewWordsScreen({super.key});

  Future<void> _showWordDefinition(
    BuildContext context,
    WidgetRef ref,
    ReviewWordEntry entry,
  ) async {
    final repository = ref.read(episodeRepositoryProvider);
    final episode = await repository.getEpisodeByNumber(entry.episodeNumber);

    if (episode == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo cargar el episodio.')),
      );
      return;
    }

    VocabularyWord? word;
    try {
      word = episode.vocabularyFocus.targetWords.firstWhere(
        (w) => w.word.toLowerCase() == entry.word.toLowerCase(),
      );
    } catch (_) {
      word = null;
    }

    if (word == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Palabra no encontrada en el episodio.')),
      );
      return;
    }

    // Mostrar el popup de definición
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => VocabularyDefinitionPopup(
        word: word!,
        onClose: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewWordsAsync = ref.watch(reviewWordsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 16,
        title: const SizedBox.shrink(),
        leading: IconButton(
          tooltip: 'Atrás',
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: reviewWordsAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return _EmptyState(onBack: () => Navigator.of(context).pop());
          }

          final totalMistakes =
              items.fold<int>(0, (sum, e) => sum + e.mistakes);

          return Stack(
            children: [
              Positioned(
                top: -120,
                right: -80,
                child:
                    _Bubble(color: AppColors.secondaryBlue.withOpacity(0.15), size: 220),
              ),
              Positioned(
                bottom: -100,
                left: -60,
                child: _Bubble(color: AppColors.primaryGreen.withOpacity(0.12), size: 260),
              ),
              ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            'Palabras para repasar',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            'Enfócate en lo que fallaste',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        _HeroHeader(
                          totalWords: items.length,
                          totalMistakes: totalMistakes,
                        ),
                      ],
                    );
                  }
                  final item = items[index - 1];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ReviewCard(
                      entry: item,
                      colorSeed: _colorForIndex(index),
                      onReview: () => _showWordDefinition(context, ref, item),
                      onDelete: () async {
                        await ref.read(removeReviewWordProvider)(
                          word: item.word,
                          level: item.level,
                          episodeNumber: item.episodeNumber,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Text(
            'Error: $err',
            style: const TextStyle(color: AppColors.errorRed),
          ),
        ),
      ),
    );
  }

  Color _colorForIndex(int index) {
    const palette = [
      Color(0xFF58CC02), // green
      Color(0xFF1CB0F6), // blue
      Color(0xFFFF9600), // orange
      Color(0xFFFF4B4B), // red
    ];
    return palette[index % palette.length];
  }
}

class _HeroHeader extends StatelessWidget {
  final int totalWords;
  final int totalMistakes;

  const _HeroHeader({
    required this.totalWords,
    required this.totalMistakes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18, top: 6),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7BE15F),
            Color(0xFF1CB0F6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.book_outlined, color: Colors.white, size: 32),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$totalWords palabras en espera',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$totalMistakes errores detectados',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final ReviewWordEntry entry;
  final Color colorSeed;
  final VoidCallback onReview;
  final VoidCallback onDelete;

  const _ReviewCard({
    required this.entry,
    required this.colorSeed,
    required this.onReview,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final intensity = min(entry.mistakes / 5, 1.0);
    final badgeColor = Color.lerp(colorSeed, Colors.redAccent, intensity)!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorSeed.withOpacity(0.12),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: badgeColor.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    entry.word,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  tooltip: 'Eliminar',
                  icon: const Icon(Icons.delete_outline, color: AppColors.errorRed),
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _Tag(
                  icon: Icons.bolt,
                  label: '${entry.mistakes} errores',
                  color: badgeColor,
                ),
                const SizedBox(width: 8),
                _Tag(icon: Icons.map, label: 'Ep. ${entry.episodeNumber}'),
                const SizedBox(width: 8),
                _Tag(icon: Icons.school, label: entry.level.toUpperCase()),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onReview,
                  icon: const Icon(Icons.visibility, color: AppColors.secondaryBlue),
                  label: const Text(
                    'Ver definición',
                    style: TextStyle(color: AppColors.secondaryBlue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _Tag({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color ?? AppColors.textSecondary),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onBack;

  const _EmptyState({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -140,
          right: -80,
          child: _Bubble(color: AppColors.secondaryBlue.withOpacity(0.15), size: 240),
        ),
        Positioned(
          bottom: -120,
          left: -80,
          child: _Bubble(color: AppColors.primaryGreen.withOpacity(0.12), size: 260),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, size: 72, color: AppColors.successGreen),
              const SizedBox(height: 12),
              const Text(
                'No tienes palabras para repasar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                '¡Sigue así!',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: onBack,
                child: const Text('Volver'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Bubble extends StatelessWidget {
  final Color color;
  final double size;

  const _Bubble({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
