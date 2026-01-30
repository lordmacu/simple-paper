import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'review_game_select_screen.dart';
import 'review_types.dart';

class ReviewHomeScreen extends StatelessWidget {
  const ReviewHomeScreen({super.key});

  static const _categories = [
    ReviewCategory(
      type: ReviewCategoryType.irregularVerbs,
      title: 'Verbos irregulares',
      subtitle: 'Past y participle',
      icon: Icons.flash_on,
    ),
    ReviewCategory(
      type: ReviewCategoryType.countries,
      title: 'Nacionalidades',
      subtitle: 'País, nacionalidad e idioma',
      icon: Icons.public,
    ),
    ReviewCategory(
      type: ReviewCategoryType.cities,
      title: 'Ciudades',
      subtitle: 'Nombres de ciudades',
      icon: Icons.location_city,
    ),
    ReviewCategory(
      type: ReviewCategoryType.comparatives,
      title: 'Comparativos',
      subtitle: 'Comparative y superlative',
      icon: Icons.compare_arrows,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Repasar',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return _CategoryCard(
            category: category,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ReviewGameSelectScreen(category: category),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final ReviewCategory category;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
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
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider, width: 1.5),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.secondaryBlue.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(category.icon, color: AppColors.secondaryBlue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.subtitle,
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
