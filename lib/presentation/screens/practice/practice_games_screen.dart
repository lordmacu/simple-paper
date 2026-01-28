import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/repositories/episode_repository_impl.dart';
import '../../../domain/models/episode/episode.dart';
import '../../../domain/models/episode/episode.dart' as ep_models;
import '../../providers/template_variable_provider.dart';
import '../games/games_screen.dart';
import '../../../domain/models/game/game.dart';
import '../../../domain/models/game/multiple_choice_game.dart';
import '../../../domain/models/game/audio_choice_game.dart';
import '../../../domain/models/game/fill_blank_game.dart';
import '../../../domain/models/game/typing_game.dart';
import '../../../domain/models/game/order_sentence_game.dart';
import '../../../domain/models/game/matching_game.dart';
import '../../../domain/models/game/spot_word_game.dart';

class PracticeGamesScreen extends ConsumerStatefulWidget {
  const PracticeGamesScreen({super.key});

  @override
  ConsumerState<PracticeGamesScreen> createState() => _PracticeGamesScreenState();
}

class _PracticeGamesScreenState extends ConsumerState<PracticeGamesScreen> {
  final _episodeController = TextEditingController(text: '1');
  String? _error;
  Episode? _loadedEpisode;
  List<_GameEntry> _available = [];
  bool _isLoading = false;
  final Map<String, Game> _synthetic = {};

  @override
  void dispose() {
    _episodeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Autocargar episodio inicial para mostrar solo minijuegos disponibles
    Future.microtask(() => _loadEpisode());
  }

  @override
  Widget build(BuildContext context) {
    final items = _available;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Practicar minijuegos',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Elige el tipo de juego y luego el episodio.',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _episodeController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _loadEpisode(),
              decoration: InputDecoration(
                labelText: 'Número de episodio (1-30)',
                errorText: _error,
                filled: true,
                fillColor: AppColors.cardBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 4),
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryGreen,
                      ),
                    )
                  : _available.isEmpty
                      ? const Center(
                          child: Text(
                            'Este episodio no tiene minijuegos disponibles.',
                            style: TextStyle(color: AppColors.textSecondary),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ListView.separated(
                          itemCount: _available.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final item = _available[index];
                            return ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              tileColor: AppColors.cardBackground,
                              leading: CircleAvatar(
                                backgroundColor:
                                    item.color.withOpacity(0.15),
                                child: Icon(item.icon, color: item.color),
                              ),
                              title: Text(
                                item.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              subtitle: Text(
                                item.subtitle,
                                style: const TextStyle(
                                    color: AppColors.textSecondary),
                              ),
                              trailing: const Icon(Icons.chevron_right,
                                  color: AppColors.textSecondary),
                              onTap: () => _launchGame(item.gameType),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadEpisode({int? number}) async {
    final epText = number?.toString() ?? _episodeController.text.trim();
    final epNumber = int.tryParse(epText);
    if (epNumber == null || epNumber < 1 || epNumber > 30) {
      setState(() => _error = 'Ingresa un número entre 1 y 30');
      return;
    }
    setState(() => _error = null);

    final repo = EpisodeRepositoryImpl();
    setState(() => _isLoading = true);
    final Episode? episode = await repo.getEpisodeByNumber(epNumber);
    setState(() => _isLoading = false);
    if (episode == null) {
      setState(() => _error = 'No se pudo cargar el episodio $epNumber');
      return;
    }

    final games = episode.games.data;
    final entries = <_GameEntry>[];
    for (var i = 0; i < games.length; i++) {
      final type = _typeFor(games[i]);
      if (type.isEmpty) continue;
      entries.add(_entryFromType(type, i));
    }

    _synthetic.clear();
    _addSyntheticGames(episode, entries);

    if (entries.isEmpty) {
      setState(() => _error = 'El episodio $epNumber no tiene minijuegos.');
      return;
    }

    setState(() {
      _loadedEpisode = episode;
      _available = entries;
    });
  }

  Future<void> _launchGame(String gameType) async {
    if (_loadedEpisode == null) {
      setState(() => _error = 'Primero carga un episodio');
      return;
    }

    final episode = _loadedEpisode!;
    final gameIndex =
        episode.games.data.indexWhere((g) => _typeFor(g) == gameType);
    Episode targetEpisode = episode;
    int targetIndex = gameIndex;

    if (gameIndex == -1) {
      final synthetic = _synthetic[gameType];
      if (synthetic == null) {
        setState(() => _error = 'Este episodio no tiene ese minijuego');
        return;
      }
      final newData = [...episode.games.data, synthetic];
      targetEpisode = episode.copyWith(
        games: ep_models.GamesSection(
          data: newData,
          image: episode.games.image,
          sectionName: episode.games.sectionName,
          sectionNameEs: episode.games.sectionNameEs,
        ),
      );
      targetIndex = newData.length - 1;
    }

    // Usar root navigator para ocultar bottom nav
    if (!mounted) return;
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => GamesScreen(
          episode: targetEpisode,
          pointsFromStory: 0,
          initialIndex: targetIndex,
          onComplete: (p, m) => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  String _typeFor(dynamic game) {
    final type = game.runtimeType.toString();
    if (type.contains('MatchingGame')) return 'matching';
    if (type.contains('FillBlankGame')) return 'fill_blank';
    if (type.contains('MultipleChoiceGame')) return 'multiple_choice';
    if (type.contains('AudioChoiceGame')) return 'audio_choice';
    if (type.contains('OrderSentenceGame')) return 'order_sentence';
    if (type.contains('TypingGame')) return 'typing';
    if (type.contains('SpotWordGame')) return 'spot_word';
    return '';
  }

  _GameEntry _entryFromType(String type, int index) {
    switch (type) {
      case 'matching':
        return _GameEntry(
          gameType: type,
          title: 'Matching (Juego ${index + 1})',
          subtitle: 'Empareja palabras y traducciones',
          icon: Icons.link,
          color: AppColors.secondaryBlue,
        );
      case 'fill_blank':
        return _GameEntry(
          gameType: type,
          title: 'Fill in the Blank (Juego ${index + 1})',
          subtitle: 'Completa la frase',
          icon: Icons.edit,
          color: AppColors.primaryGreen,
        );
      case 'multiple_choice':
        return _GameEntry(
          gameType: type,
          title: 'Multiple Choice (Juego ${index + 1})',
          subtitle: 'Selecciona la respuesta correcta',
          icon: Icons.list_alt,
          color: AppColors.warningOrange,
        );
      case 'audio_choice':
        return _GameEntry(
          gameType: type,
          title: 'Audio Choice (Juego ${index + 1})',
          subtitle: 'Escucha y elige',
          icon: Icons.volume_up,
          color: AppColors.secondaryBlue,
        );
      case 'order_sentence':
        return _GameEntry(
          gameType: type,
          title: 'Ordenar frase (Juego ${index + 1})',
          subtitle: 'Arrastra las palabras',
          icon: Icons.drag_indicator,
          color: AppColors.primaryGreen,
        );
      case 'typing':
        return _GameEntry(
          gameType: type,
          title: 'Typing (Juego ${index + 1})',
          subtitle: 'Escribe en inglés',
          icon: Icons.keyboard_alt,
          color: AppColors.textPrimary,
        );
      case 'spot_word':
        return _GameEntry(
          gameType: type,
          title: 'Spot the Word (Juego ${index + 1})',
          subtitle: 'Elige la palabra de la imagen',
          icon: Icons.image_search,
          color: AppColors.warningOrange,
        );
      default:
        return _GameEntry(
          gameType: type,
          title: 'Juego ${index + 1}',
          subtitle: 'Minijuego',
          icon: Icons.extension,
          color: AppColors.textSecondary,
        );
    }
  }

  void _addSyntheticGames(Episode episode, List<_GameEntry> entries) {
    // AudioChoice: derivar del primer multiple_choice
    final mc = episode.games.data.firstWhere(
      (g) => _typeFor(g) == 'multiple_choice',
      orElse: () => null,
    );
    if (mc is MultipleChoiceGame && mc.content.items.isNotEmpty) {
      final items = mc.content.items
          .map((it) => AudioChoiceItem(
                id: it.id,
                audioUrl: '', // placeholder sin audio
                prompt: it.question,
                promptEs: it.questionEs,
                options: it.options,
                optionsEs: it.optionsEs,
                correctAnswer: it.correctAnswer,
              ))
          .toList();
      final game = AudioChoiceGame(
        gameId: '${episode.episodeMetadata.episodeId}_audio',
        gameType: 'audio_choice',
        title: mc.title,
        titleEs: mc.titleEs,
        instructions: mc.instructions,
        instructionsEs: mc.instructionsEs,
        content: AudioChoiceContent(items: items),
      );
      _synthetic['audio_choice'] = game;
      entries.add(_entryFromType('audio_choice', episode.games.data.length));
    }

    // Typing: derivar del primer fill_blank
    final fb = episode.games.data.firstWhere(
      (g) => _typeFor(g) == 'fill_blank',
      orElse: () => null,
    );
    if (fb is FillBlankGame && fb.content.items.isNotEmpty) {
      final items = fb.content.items
          .map((it) => TypingItem(
                id: it.id,
                promptEs: it.sentenceEs,
                answerEn: it.answer,
                hint: it.hint,
                hintEs: it.hintEs,
              ))
          .toList();
      final game = TypingGame(
        gameId: '${episode.episodeMetadata.episodeId}_typing',
        gameType: 'typing',
        title: fb.title,
        titleEs: fb.titleEs,
        instructions: fb.instructions,
        instructionsEs: fb.instructionsEs,
        content: TypingGameContent(items: items),
      );
      _synthetic['typing'] = game;
      entries.add(_entryFromType('typing', episode.games.data.length));
    }

    // Order sentence: derivar de fill_blank
    if (fb is FillBlankGame && fb.content.items.isNotEmpty) {
      final items = fb.content.items.map((it) {
        final correct = it.sentence.replaceAll('_____', it.answer);
        return OrderSentenceItem(
          id: it.id,
          prompt: it.sentence,
          promptEs: it.sentenceEs,
          correctSentence: correct,
          words: correct.split(' '),
        );
      }).toList();
      final game = OrderSentenceGame(
        gameId: '${episode.episodeMetadata.episodeId}_order',
        gameType: 'order_sentence',
        title: fb.title,
        titleEs: fb.titleEs,
        instructions: fb.instructions,
        instructionsEs: fb.instructionsEs,
        content: OrderSentenceContent(items: items),
      );
      _synthetic['order_sentence'] = game;
      entries.add(_entryFromType('order_sentence', episode.games.data.length));
    }

    // Spot word: derivar de matching
    final match = episode.games.data.firstWhere(
      (g) => _typeFor(g) == 'matching',
      orElse: () => null,
    );
    if (match is MatchingGame && match.content.items.isNotEmpty) {
      final allTranslations =
          match.content.items.map((e) => e.right).toSet().toList();

      final items = match.content.items.map((it) {
        // arma opciones con la traducción correcta + 3 distractores
        final distractors = List<String>.from(allTranslations)
          ..remove(it.right);
        distractors.shuffle(Random());
        final opts = <String>[it.right, ...distractors.take(3)].toList();
        opts.shuffle(Random());
        final correctIdx = opts.indexOf(it.right);

        return SpotWordItem(
          id: it.id,
          imageUrl: null,
          prompt: 'Select the translation of "${it.left}"',
          promptEs: 'Elige la traducción de "${it.left}"',
          options: opts,
          optionsEs: opts, // ya están en español
          correctAnswer: correctIdx,
        );
      }).toList();
      final game = SpotWordGame(
        gameId: '${episode.episodeMetadata.episodeId}_spot',
        gameType: 'spot_word',
        title: 'Spot the Word',
        titleEs: 'Encuentra la palabra',
        instructions: 'Pick the correct word for the image/text',
        instructionsEs: 'Elige la palabra correcta',
        content: SpotWordContent(items: items),
      );
      _synthetic['spot_word'] = game;
      entries.add(_entryFromType('spot_word', episode.games.data.length));
    }

  }
}

class _GameEntry {
  final String gameType;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _GameEntry({
    required this.gameType,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}
