import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/atoms/primary_button.dart';
import '../../widgets/molecules/bilingual_text_card.dart';

/// Pantalla de conclusión de lección.
class ConclusionScreen extends StatelessWidget {
  ///  string
  final String conclusionEn;
  ///  string
  final String conclusionEs;
  ///  void callback
  final VoidCallback onContinue;

  /// Crea una instancia de conclusion screen.
  const ConclusionScreen({
    required this.conclusionEn, required this.conclusionEs, required this.onContinue, super.key,
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
          'Conclusión',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BilingualTextCard(
              textEn: conclusionEn,
              textEs: conclusionEs,
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              enStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
              esStyle: const TextStyle(
                fontSize: 15,
                color: AppColors.textSecondary,
              ),
            ),
            const Spacer(),
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
    );
  }
}
