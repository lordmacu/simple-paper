import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/atoms/primary_button.dart';
import '../../widgets/molecules/section_header.dart';

/// interview summary screen/widget
class InterviewSummaryScreen extends StatelessWidget {
  /// int
  final int correct;
  /// int
  final int total;
  ///  list< string>
  final List<String> grammarPoints;
  ///  list< string>
  final List<String> vocabularyUsed;
  /// Callback cuando el usuario continúa
  final VoidCallback onContinue;

  /// Crea una pantalla de resumen de entrevista.
  const InterviewSummaryScreen({
    required this.correct, required this.total, required this.grammarPoints, required this.vocabularyUsed, required this.onContinue, super.key,
  });

  @override
  Widget build(BuildContext context) {
    final percent = total == 0 ? 0 : ((correct / total) * 100).round();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.textPrimary,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(height: 8),
                      const SectionHeader(
                        title: 'Resumen de la entrevista',
                        padding: EdgeInsets.zero,
                        titleStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Puntaje: $correct / $total  ($percent%)',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _StatCard(
                        icon: Icons.check_circle,
                        label: 'Correctas',
                        value: '$correct',
                        color: AppColors.primaryGreen,
                      ),
                      const SizedBox(height: 10),
                      _StatCard(
                        icon: Icons.help_outline,
                        label: 'Incorrectas',
                        value: '${total - correct}',
                        color: AppColors.warningOrange,
                      ),
                      const SizedBox(height: 20),
                      _Section(
                        title: 'Puntos gramaticales',
                        items: grammarPoints,
                      ),
                      const SizedBox(height: 16),
                      _Section(
                        title: 'Vocabulario usado',
                        items: vocabularyUsed,
                      ),
                      const SizedBox(height: 20),
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

class _Section extends StatelessWidget {
  final String title;
  final List<String> items;

  const _Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
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
}
