import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../domain/models/story/scene.dart';
import '../../providers/template_variable_provider.dart';

/// Header de la escena mostrando ubicación y tiempo
class SceneHeader extends ConsumerWidget {
  final Scene scene;
  final VoidCallback onShowTranslation;

  const SceneHeader({
    Key? key,
    required this.scene,
    required this.onShowTranslation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final template = ref.read(templateVariableServiceProvider);
    final location = template.replaceVariables(scene.location);
    final time = template.replaceVariables(scene.time);
    final description = template.replaceVariables(scene.description);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryGreen.withOpacity(0.1),
            AppColors.secondaryBlue.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryGreen.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ubicación
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: AppColors.primaryGreen,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              InkWell(
                onTap: onShowTranslation,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.translate,
                    size: 18,
                    color: AppColors.secondaryBlue.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Tiempo
          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: AppColors.secondaryBlue,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                time,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          // Descripción (opcional)
          if (description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
