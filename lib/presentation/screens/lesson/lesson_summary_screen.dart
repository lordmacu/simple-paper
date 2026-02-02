import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/atoms/primary_button.dart';
import '../../widgets/molecules/section_header.dart';

/// lesson summary screen/widget
class LessonSummaryScreen extends StatefulWidget {
  /// int
  final int baseXp;
  /// int
  final int bonusXp;
  ///  list< string>
  final List<String> wordsLearned;
  /// Lista de logros obtenidos
  final List<String> achievements;
  /// Racha actual del usuario
  final int streak;
  /// Callback cuando el usuario continúa
  final VoidCallback onContinue;

  /// Crea una pantalla de resumen de lección.
  const LessonSummaryScreen({
    required this.baseXp, required this.bonusXp, required this.wordsLearned, required this.achievements, required this.streak, required this.onContinue, super.key,
  });

  @override
  State<LessonSummaryScreen> createState() => _LessonSummaryScreenState();
}

class _LessonSummaryScreenState extends State<LessonSummaryScreen> {
  late ConfettiController _confetti;

  @override
  void initState() {
    super.initState();
    _confetti = ConfettiController(duration: const Duration(seconds: 2));
    _confetti.play();
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalXp = widget.baseXp + widget.bonusXp;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confetti,
              blastDirectionality: BlastDirectionality.explosive,
              colors: const [
                AppColors.primaryGreen,
                AppColors.secondaryBlue,
                AppColors.warningOrange,
                AppColors.errorRed,
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(
                    title: '¡Lección completada!',
                    padding: EdgeInsets.zero,
                    titleStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _xpCard(totalXp, widget.baseXp, widget.bonusXp),
                  const SizedBox(height: 14),
                  _section('Palabras aprendidas', widget.wordsLearned),
                  const SizedBox(height: 14),
                  _section('Achievements desbloqueados', widget.achievements),
                  const SizedBox(height: 14),
                  _streakRow(widget.streak),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      text: 'Continuar',
                      onPressed: widget.onContinue,
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

  Widget _xpCard(int total, int base, int bonus) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.stars, color: AppColors.warningOrange, size: 28),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'XP total',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '$total (Base $base + Bonus $bonus)',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _section(String title, List<String> items) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: title,
            padding: EdgeInsets.zero,
            titleStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          if (items.isEmpty)
            const Text(
              'No disponible',
              style: TextStyle(color: AppColors.textSecondary),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: items
                  .map((e) => Chip(
                        label: Text(e),
                        backgroundColor: Colors.white,
                        labelStyle: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _streakRow(int streak) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_fire_department,
              color: AppColors.warningOrange, size: 28),
          const SizedBox(width: 10),
          Text(
            'Streak: $streak días',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
