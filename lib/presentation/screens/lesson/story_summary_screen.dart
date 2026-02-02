import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../domain/models/vocabulary/vocabulary_word.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/tts_provider.dart';
import '../../widgets/atoms/icon_text_button.dart';
import '../../widgets/atoms/primary_button.dart';
import '../../widgets/molecules/bilingual_text_card.dart';
import '../../widgets/molecules/section_header.dart';

/// story summary screen/widget
class StorySummaryScreen extends ConsumerWidget {
  /// int
  final int correctChoices;
  /// int
  final int incorrectChoices;
  ///  list< string>
  final List<String> wordsToReview;
  /// Palabras de vocabulario aprendidas
  final List<VocabularyWord> learnedWords;
  /// Callback cuando el usuario continúa
  final VoidCallback onContinue;
  /// Callback cuando el usuario quiere revisar palabras
  final VoidCallback onReviewWords;

  /// Crea una pantalla de resumen de historia.
  const StorySummaryScreen({
    required this.correctChoices, required this.incorrectChoices, required this.wordsToReview, required this.learnedWords, required this.onContinue, required this.onReviewWords, super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final template = ref.read(templateVariableServiceProvider);
    final tts = ref.read(ttsServiceProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -60,
            child: _Bubble(
              color: AppColors.secondaryBlue.withValues(alpha: 0.18),
              size: 240,
            ),
          ),
          Positioned(
            bottom: -140,
            left: -40,
            child: _Bubble(
              color: AppColors.primaryGreen.withValues(alpha: 0.16),
              size: 260,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          const SectionHeader(
                            title: 'Resumen de la historia',
                            padding: EdgeInsets.zero,
                            titleStyle: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Esto fue lo que aprendiste',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _StatCard(
                            icon: Icons.check_circle,
                            label: 'Aciertos',
                            value: '$correctChoices',
                            color: AppColors.primaryGreen,
                          ),
                          const SizedBox(height: 12),
                          _StatCard(
                            icon: Icons.error_outline,
                            label: 'Errores',
                            value: '$incorrectChoices',
                            color: AppColors.warningOrange,
                          ),
                          const SizedBox(height: 20),
                          if (learnedWords.isNotEmpty) ...[
                            const Text(
                              'Palabras aprendidas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: learnedWords
                                  .map(
                                    (w) => _LearnedWordTile(
                                      word: template.replaceVariables(w.word),
                                      translation: template.replaceVariables(w.translationEs),
                                      onPlay: () => tts.speak(w.word),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 16),
                          ],
                          if (wordsToReview.isNotEmpty) ...[
                            const Text(
                              'Palabras para repasar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: wordsToReview
                                  .map(
                                    (w) => Chip(
                                      label: Text(w),
                                      backgroundColor: AppColors.cardBackground,
                                      labelStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: IconTextButton(
                                label: 'Ver palabras para repasar',
                                icon: Icons.menu_book,
                                onTap: onReviewWords,
                                foregroundColor: AppColors.secondaryBlue,
                                expand: true,
                                minHeight: 48,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      text: 'Continuar',
                      onPressed: onContinue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: color,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _LearnedWordTile extends StatelessWidget {
  final String word;
  final String translation;
  final VoidCallback onPlay;

  const _LearnedWordTile({
    required this.word,
    required this.translation,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.primaryGreen.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: BilingualTextCard(
              textEn: word,
              textEs: translation,
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              enStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
              esStyle: const TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Escuchar',
            onPressed: onPlay,
            icon: const Icon(
              Icons.volume_up,
              color: AppColors.primaryGreen,
            ),
          ),
        ],
      ),
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
