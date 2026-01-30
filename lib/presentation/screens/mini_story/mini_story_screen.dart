import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/section_progress.dart';
import '../../../core/utils/navigation_utils.dart';
import '../../../domain/models/episode/episode.dart';
import '../../../presentation/providers/progress_providers.dart';
import '../../../presentation/providers/tts_provider.dart';
import '../../providers/template_variable_provider.dart';
import '../../providers/personalization_providers.dart';

class MiniStoryScreen extends ConsumerStatefulWidget {
  final Episode episode;

  const MiniStoryScreen({super.key, required this.episode});

  @override
  ConsumerState<MiniStoryScreen> createState() => _MiniStoryScreenState();
}

class _MiniStoryScreenState extends ConsumerState<MiniStoryScreen> {
  @override
  void dispose() {
    final tts = ref.read(ttsServiceProvider);
    tts.stop();
    super.dispose();
  }

  void _stopAndClose() {
    final tts = ref.read(ttsServiceProvider);
    tts.stop();
  }

  @override
  Widget build(BuildContext context) {
    // Esperar a que las variables personalizadas estén cargadas
    ref.watch(personalizationInitProvider);
    // Escuchar cambios en las variables del template para reconstruir
    final templateVersion = ref.watch(templateVersionProvider);
    debugPrint('TEMPLATE_DEBUG MiniStoryScreen.build templateVersion=$templateVersion');

    final miniStory = widget.episode.miniStory;
    if (miniStory == null) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('No hay mini historia disponible.'),
        ),
      );
    }
    final template = ref.watch(templateVariableServiceProvider);
    // Log de valores actuales
    debugPrint('TEMPLATE_DEBUG MiniStoryScreen template.city=${template.getVariable('city')} company=${template.getVariable('company_name')} office=${template.getVariable('office_type')}');
    
    final tts = ref.read(ttsServiceProvider);
    final title = miniStory.titleEs?.isNotEmpty == true
        ? miniStory.titleEs!
        : miniStory.title ?? 'Mini historia';

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          _stopAndClose();
        }
      },
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _stopAndClose();
              NavigationUtils.closeToHome(context);
            },
            tooltip: 'Cerrar',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: miniStory.paragraphs.length,
              itemBuilder: (context, index) {
                final paragraph = miniStory.paragraphs[index];
                final rawEn = paragraph.text.en;
                final enText = template.replaceVariables(rawEn);
                final esText = template.replaceVariables(paragraph.text.es);
                // Log del primer párrafo para ver si tiene variables
                if (index == 0) {
                  debugPrint('TEMPLATE_DEBUG MiniStoryScreen paragraph[0] rawEn="$rawEn" enText="$enText"');
                }
                return _ParagraphCard(
                  index: index + 1,
                  enText: enText,
                  esText: esText,
                  onPlay: () => tts.speak(enText),
                );
              },
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () async {
                  _stopAndClose();
                  await ref.read(markSectionCompletedProvider)(
                    episodeNumber: widget.episode.episodeMetadata.episodeNumber,
                    sectionId: SectionProgressIds.miniStory,
                  );
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class _ParagraphCard extends StatelessWidget {
  final int index;
  final String enText;
  final String esText;
  final VoidCallback onPlay;

  const _ParagraphCard({
    required this.index,
    required this.enText,
    required this.esText,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Párrafo $index',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.play_circle_fill,
                    color: AppColors.secondaryBlue),
                onPressed: onPlay,
              ),
            ],
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onPlay,
            child: Text(
              enText,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            esText,
            style: const TextStyle(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
