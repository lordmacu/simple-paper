import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class EpisodePreviewScreen extends StatelessWidget {
  final String teaserEn;
  final String teaserEs;
  final String imageUrl;
  final VoidCallback onContinue;

  const EpisodePreviewScreen({
    Key? key,
    required this.teaserEn,
    required this.teaserEs,
    required this.imageUrl,
    required this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Preview próximo episodio',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: imageUrl.isNotEmpty
                  ? Image.network(imageUrl, height: 180, fit: BoxFit.cover)
                  : Container(
                      height: 180,
                      color: AppColors.cardBackground,
                      child: const Icon(Icons.image, size: 48, color: AppColors.textSecondary),
                    ),
            ),
            const SizedBox(height: 16),
            Text(
              teaserEn,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              teaserEs,
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: onContinue,
              child: const Text(
                'Continuar al próximo episodio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
