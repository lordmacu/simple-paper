import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/core/constants/app_colors.dart';
import 'widgets/episode_list_screen.dart';
import 'widgets/global_progress_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Placeholder for Flag/Language
            const Icon(Icons.flag, color: AppColors.textSecondary),

            // Placeholder for Streak
            Row(
              children: [
                const Icon(
                  Icons.local_fire_department,
                  color: AppColors.warningOrange,
                ),
                const SizedBox(width: 4),
                Text(
                  '0',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.warningOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Placeholder for Gems
            Row(
              children: [
                const Icon(Icons.diamond, color: AppColors.secondaryBlue),
                const SizedBox(width: 4),
                Text(
                  '0',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.secondaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Barra de progreso global
          const GlobalProgressBar(),
          
          // Lista de episodios
          const Expanded(
            child: EpisodeListScreen(),
          ),
        ],
      ),
    );
  }
}
