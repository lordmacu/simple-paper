import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class XpLevelHeader extends StatelessWidget {
  final int level;
  final int totalXp;
  final int xpToNext;
  final int xpIntoLevel;

  const XpLevelHeader({
    Key? key,
    required this.level,
    required this.totalXp,
    required this.xpToNext,
    required this.xpIntoLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = xpToNext == 0 ? 1.0 : xpIntoLevel / xpToNext;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Nivel $level',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '$totalXp XP',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              backgroundColor: AppColors.cardBackground,
              valueColor: const AlwaysStoppedAnimation(AppColors.primaryGreen),
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            xpToNext == 0
                ? 'Nivel máximo alcanzado'
                : '$xpIntoLevel / $xpToNext XP para el siguiente nivel',
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
