import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'review_item_select_screen.dart';
import 'review_types.dart';

class ReviewGameOption {
  final ReviewGameType type;
  final String title;
  final String subtitle;
  final IconData icon;

  const ReviewGameOption({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class ReviewGameSelectScreen extends StatelessWidget {
  final ReviewCategory category;

  const ReviewGameSelectScreen({super.key, required this.category});

  List<ReviewGameOption> _optionsFor(ReviewCategoryType type) {
    switch (type) {
      case ReviewCategoryType.irregularVerbs:
        return const [
          ReviewGameOption(
            type: ReviewGameType.flashcard,
            title: 'Flashcards',
            subtitle: 'Autoevaluación rápida',
            icon: Icons.style,
          ),
          ReviewGameOption(
            type: ReviewGameType.bingo,
            title: 'Bingo rápido',
            subtitle: 'Toca la opción correcta',
            icon: Icons.bolt,
          ),
          ReviewGameOption(
            type: ReviewGameType.orderForms,
            title: 'Ordena la forma',
            subtitle: 'Base → Past → Participle',
            icon: Icons.reorder,
          ),
          ReviewGameOption(
            type: ReviewGameType.typing,
            title: 'Typing',
            subtitle: 'Escribe la forma correcta',
            icon: Icons.keyboard,
          ),
          ReviewGameOption(
            type: ReviewGameType.memory,
            title: 'Memoria',
            subtitle: 'Base ↔ Past',
            icon: Icons.memory,
          ),
          ReviewGameOption(
            type: ReviewGameType.matching,
            title: 'Matching',
            subtitle: 'Base ↔ Past',
            icon: Icons.compare_arrows,
          ),
          ReviewGameOption(
            type: ReviewGameType.multipleChoice,
            title: 'Quiz',
            subtitle: 'Elige la forma correcta',
            icon: Icons.quiz,
          ),
        ];
      case ReviewCategoryType.countries:
        return const [
          ReviewGameOption(
            type: ReviewGameType.matching,
            title: 'Matching',
            subtitle: 'País ↔ Nacionalidad',
            icon: Icons.link,
          ),
          ReviewGameOption(
            type: ReviewGameType.bingo,
            title: 'Bingo rápido',
            subtitle: 'Toca la opción correcta',
            icon: Icons.bolt,
          ),
          ReviewGameOption(
            type: ReviewGameType.memory,
            title: 'Memoria',
            subtitle: 'País ↔ Nacionalidad',
            icon: Icons.memory,
          ),
          ReviewGameOption(
            type: ReviewGameType.trueFalse,
            title: 'Verdadero / Falso',
            subtitle: 'Comprueba una frase',
            icon: Icons.fact_check,
          ),
          ReviewGameOption(
            type: ReviewGameType.multipleChoice,
            title: 'Quiz',
            subtitle: 'País, nacionalidad o idioma',
            icon: Icons.quiz,
          ),
        ];
      case ReviewCategoryType.cities:
        return const [
          ReviewGameOption(
            type: ReviewGameType.multipleChoice,
            title: 'Quiz',
            subtitle: 'Selecciona la ciudad',
            icon: Icons.location_city,
          ),
        ];
      case ReviewCategoryType.comparatives:
        return const [
          ReviewGameOption(
            type: ReviewGameType.flashcard,
            title: 'Flashcards',
            subtitle: 'Comparatives & superlatives',
            icon: Icons.style,
          ),
          ReviewGameOption(
            type: ReviewGameType.bingo,
            title: 'Bingo rápido',
            subtitle: 'Toca la opción correcta',
            icon: Icons.bolt,
          ),
          ReviewGameOption(
            type: ReviewGameType.memory,
            title: 'Memoria',
            subtitle: 'Base ↔ Comparative',
            icon: Icons.memory,
          ),
          ReviewGameOption(
            type: ReviewGameType.matching,
            title: 'Matching',
            subtitle: 'Base ↔ Comparative',
            icon: Icons.compare_arrows,
          ),
          ReviewGameOption(
            type: ReviewGameType.fillBlank,
            title: 'Fill in the blank',
            subtitle: 'Completa la frase',
            icon: Icons.edit,
          ),
          ReviewGameOption(
            type: ReviewGameType.multipleChoice,
            title: 'Quiz',
            subtitle: 'Comparative o superlative',
            icon: Icons.quiz,
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = _optionsFor(category.type);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          category.title,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return _GameOptionCard(
            option: option,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ReviewItemSelectScreen(
                    category: category,
                    gameType: option.type,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _GameOptionCard extends StatelessWidget {
  final ReviewGameOption option;
  final VoidCallback onTap;

  const _GameOptionCard({
    required this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(option.icon, color: AppColors.primaryGreen),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      option.subtitle,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
