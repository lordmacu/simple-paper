import '../../../domain/models/game/fill_blank_game.dart';
import '../../../domain/models/game/game.dart';
import '../../../domain/models/game/matching_game.dart';
import '../../../domain/models/game/multiple_choice_game.dart';
import 'review_bingo_game.dart';
import 'review_flashcard_game.dart';
import 'review_game_helpers.dart';
import 'review_memory_game.dart';
import 'review_types.dart';

Game buildComparativesGame(
  List<Map<String, String>> items,
  ReviewGameType type,
) {
  final shuffled = reviewShuffle(items);
  switch (type) {
    case ReviewGameType.flashcard:
      final take = shuffled.take(12).toList();
      final cards = <ReviewFlashcardCard>[];
      for (var i = 0; i < take.length; i++) {
        final base = take[i]['base']!;
        final comparative = take[i]['comparative']!;
        final superlative = take[i]['superlative']!;
        final useComparative = i.isEven;
        cards.add(
          ReviewFlashcardCard(
            front: useComparative
                ? 'Comparative of "$base"'
                : 'Superlative of "$base"',
            back: useComparative ? comparative : superlative,
            hint: 'Base: $base',
            hintEs: 'Base: $base',
          ),
        );
      }
      return ReviewFlashcardGame(
        gameId: 'review_comparatives_flashcard',
        gameType: 'flashcard',
        title: 'Comparatives',
        titleEs: 'Comparativos',
        instructions: 'Auto-check the correct form.',
        instructionsEs: 'Autoevalúa la forma correcta.',
        cards: cards,
      );
    case ReviewGameType.matching:
      final take = shuffled.take(5).toList();
      return MatchingGame(
        gameId: 'review_comparatives_matching',
        gameType: 'matching',
        title: 'Comparatives',
        titleEs: 'Comparativos',
        instructions: 'Match the adjective with its comparative.',
        instructionsEs: 'Empareja el adjetivo con su comparativo.',
        content: MatchingGameContent(
          items: List.generate(
            take.length,
            (index) => MatchingItem(
              id: index + 1,
              left: take[index]['base']!,
              right: take[index]['comparative']!,
            ),
          ),
        ),
        settings: const MatchingGameSettings(
          shuffle: true,
          showImages: false,
        ),
      );
    case ReviewGameType.multipleChoice:
      final take = shuffled.take(8).toList();
      final comparativePool = items.map((e) => e['comparative']!).toList();
      final superlativePool = items.map((e) => e['superlative']!).toList();
      final mcItems = <MultipleChoiceItem>[];

      for (var i = 0; i < take.length; i++) {
        final base = take[i]['base']!;
        final useComparative = i.isEven;
        final correct =
            useComparative ? take[i]['comparative']! : take[i]['superlative']!;
        final pool = useComparative ? comparativePool : superlativePool;
        final options = reviewBuildOptions(correct, pool, count: 4);
        final correctIndex = options.indexOf(correct);

        mcItems.add(
          MultipleChoiceItem(
            id: i + 1,
            question: useComparative
                ? "Comparative of '$base'?"
                : "Superlative of '$base'?",
            questionEs: useComparative
                ? '¿Cuál es el comparativo de "$base"?'
                : '¿Cuál es el superlativo de "$base"?',
            options: options,
            optionsEs: const [],
            correctAnswer: correctIndex,
          ),
        );
      }

      return MultipleChoiceGame(
        gameId: 'review_comparatives_quiz',
        gameType: 'multiple_choice',
        title: 'Comparatives quiz',
        titleEs: 'Quiz de comparativos',
        instructions: 'Choose the correct form.',
        instructionsEs: 'Elige la forma correcta.',
        content: MultipleChoiceGameContent(items: mcItems),
      );
    case ReviewGameType.fillBlank:
      final take = shuffled.take(6).toList();
      final comparativePool = items.map((e) => e['comparative']!).toList();
      final fbItems = <FillBlankItem>[];
      for (var i = 0; i < take.length; i++) {
        final base = take[i]['base']!;
        final comparative = take[i]['comparative']!;
        final options = reviewBuildOptions(comparative, comparativePool, count: 4);
        fbItems.add(
          FillBlankItem(
            id: i + 1,
            sentence: 'This desk is _____ than that desk.',
            sentenceEs: 'Este escritorio es _____ que ese escritorio.',
            answer: comparative,
            options: options,
            hint: 'Comparative of $base',
            hintEs: 'Comparativo de $base',
          ),
        );
      }
      return FillBlankGame(
        gameId: 'review_comparatives_fill_blank',
        gameType: 'fill_blank',
        title: 'Comparatives practice',
        titleEs: 'Práctica de comparativos',
        instructions: 'Complete the sentence.',
        instructionsEs: 'Completa la oración.',
        content: FillBlankGameContent(items: fbItems),
      );
    case ReviewGameType.memory:
      final take = shuffled.take(6).toList();
      return ReviewMemoryGame(
        gameId: 'review_comparatives_memory',
        gameType: 'memory',
        title: 'Memory match',
        titleEs: 'Memoria',
        instructions: 'Find the matching pairs.',
        instructionsEs: 'Encuentra los pares.',
        pairs: List.generate(
          take.length,
          (index) => ReviewMemoryPair(
            id: index + 1,
            left: take[index]['base']!,
            right: take[index]['comparative']!,
          ),
        ),
      );
    case ReviewGameType.bingo:
      final take = shuffled.take(8).toList();
      final rounds = <ReviewBingoRound>[];
      for (var i = 0; i < take.length; i++) {
        final correct = take[i];
        final base = correct['base']!;
        final prompt = 'Comparative of "$base"?';
        final promptEs = '¿Cuál es el comparativo de "$base"?';
        final pool = reviewShuffle(items).take(6).toList();
        final options = <String>{correct['comparative']!};
        for (final item in pool) {
          if (options.length >= 6) break;
          options.add(item['comparative']!);
        }
        final optionList = options.toList()..shuffle();
        rounds.add(
          ReviewBingoRound(
            prompt: prompt,
            promptEs: promptEs,
            options: optionList,
            correctIndex: optionList.indexOf(correct['comparative']!),
          ),
        );
      }
      return ReviewBingoGame(
        gameId: 'review_comparatives_bingo',
        gameType: 'bingo',
        title: 'Quick bingo',
        titleEs: 'Bingo rápido',
        instructions: 'Tap the correct option.',
        instructionsEs: 'Toca la opción correcta.',
        rounds: rounds,
      );
    case ReviewGameType.orderForms:
    case ReviewGameType.typing:
    case ReviewGameType.trueFalse:
      throw UnsupportedError('Game not available for comparatives');
  }
}
