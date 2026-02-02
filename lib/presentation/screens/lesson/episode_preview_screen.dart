import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/atoms/primary_button.dart';
import '../../widgets/molecules/bilingual_text_card.dart';

/// episode preview screen/widget
class EpisodePreviewScreen extends StatelessWidget {
  ///  string
  final String teaserEn;
  /// Teaser en español
  final String teaserEs;
  /// URL de la imagen
  final String imageUrl;
  /// Callback cuando el usuario continúa
  final VoidCallback onContinue;

  /// Crea una pantalla de preview de episodio.
  const EpisodePreviewScreen({
    required this.teaserEn, required this.teaserEs, required this.imageUrl, required this.onContinue, super.key,
  });

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
            BilingualTextCard(
              textEn: teaserEn,
              textEs: teaserEs,
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              enStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              esStyle: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Continuar al próximo episodio',
              onPressed: onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
