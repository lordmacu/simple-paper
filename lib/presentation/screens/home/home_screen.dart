import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/core/constants/app_colors.dart';
import '../review_words/review_words_screen.dart';
import 'widgets/episode_list_screen.dart';
import 'widgets/global_progress_bar.dart';
import '../settings/settings_screen.dart';
import '../../providers/personalization_providers.dart';
import '../../providers/progress_providers.dart';
import '../../providers/template_variable_provider.dart';
import '../onboarding/welcome_name_screen.dart';
import '../practice/practice_games_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _askedName = false;

  @override
  Widget build(BuildContext context) {
    // Asegura que las variables personalizadas se carguen
    ref.watch(personalizationInitProvider);

    final progressAsync = ref.watch(userProgressProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon:
                  const Icon(Icons.book_outlined, color: AppColors.textSecondary),
              tooltip: 'Palabras para repasar',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ReviewWordsScreen(),
                  ),
                );
              },
            ),
            progressAsync.when(
              data: (progress) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _maybeAskName();
                });
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.videogame_asset_outlined,
                          color: AppColors.textSecondary),
                      tooltip: 'Practicar minijuegos',
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (_) => const PracticeGamesScreen(),
                          ),
                        );
                      },
                    ),
                    const Icon(
                      Icons.local_fire_department,
                      color: AppColors.warningOrange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${progress.currentStreak}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.warningOrange,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.settings,
                          color: AppColors.textSecondary),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: const [
          GlobalProgressBar(),
          Expanded(child: EpisodeListScreen()),
        ],
      ),
    );
  }

  void _maybeAskName() {
    if (_askedName) return;
    // ensure init completed or still fine; but rely on template values
    final currentName =
        ref.read(templateVariableServiceProvider).getVariable('player_name');
    if (currentName != 'New Hire') {
      _askedName = true;
      return;
    }
    _askedName = true;
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => WelcomeNameScreen(
          onFinished: () {
            // after finishing, refresh streak header
            ref.invalidate(userProgressProvider);
          },
        ),
      ),
    );
  }
}
