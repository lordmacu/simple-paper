import '../../../domain/models/game/game.dart';
import '../../../domain/models/game/matching_game.dart';
import '../../../domain/models/game/multiple_choice_game.dart';
import '../../../domain/models/game/typing_game.dart';
import 'review_bingo_game.dart';
import 'review_flashcard_game.dart';
import 'review_game_helpers.dart';
import 'review_memory_game.dart';
import 'review_order_forms_game.dart';
import 'review_types.dart';

Game buildIrregularVerbGame(
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
        final past = take[i]['past']!;
        final participle = take[i]['past_participle']!;
        final isPast = i.isEven;
        cards.add(
          ReviewFlashcardCard(
            front: isPast ? 'Past of "$base"' : 'Past participle of "$base"',
            back: isPast ? past : participle,
            hint: 'Base: $base',
            hintEs: 'Base: $base',
          ),
        );
      }
      return ReviewFlashcardGame(
        gameId: 'review_irregular_flashcard',
        gameType: 'flashcard',
        title: 'Irregular verbs',
        titleEs: 'Verbos irregulares',
        instructions: 'Check if you remember the correct form.',
        instructionsEs: 'Marca si recuerdas la forma correcta.',
        cards: cards,
      );
    case ReviewGameType.matching:
      final take = shuffled.take(5).toList();
      return MatchingGame(
        gameId: 'review_irregular_matching',
        gameType: 'matching',
        title: 'Irregular verbs',
        titleEs: 'Verbos irregulares',
        instructions: 'Match the base form with the past form.',
        instructionsEs: 'Empareja el infinitivo con el pasado.',
        content: MatchingGameContent(
          items: List.generate(
            take.length,
            (index) => MatchingItem(
              id: index + 1,
              left: take[index]['base']!,
              right: take[index]['past']!,
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
      final pastPool = items.map((e) => e['past']!).toList();
      final participlePool =
          items.map((e) => e['past_participle']!).toList();
      final mcItems = <MultipleChoiceItem>[];

      for (var i = 0; i < take.length; i++) {
        final verb = take[i];
        final base = verb['base']!;
        final isPast = i.isEven;
        final correct = isPast ? verb['past']! : verb['past_participle']!;
        final pool = isPast ? pastPool : participlePool;
        final options = reviewBuildOptions(correct, pool, count: 4);
        final correctIndex = options.indexOf(correct);

        mcItems.add(
          MultipleChoiceItem(
            id: i + 1,
            question:
                isPast ? "Past of '$base'?" : "Past participle of '$base'?",
            questionEs: isPast
                ? '¿Cuál es el pasado de "$base"?'
                : '¿Cuál es el participio de "$base"?',
            options: options,
            optionsEs: const [],
            correctAnswer: correctIndex,
          ),
        );
      }

      return MultipleChoiceGame(
        gameId: 'review_irregular_quiz',
        gameType: 'multiple_choice',
        title: 'Irregular verbs quiz',
        titleEs: 'Quiz de verbos irregulares',
        instructions: 'Choose the correct form.',
        instructionsEs: 'Elige la forma correcta.',
        content: MultipleChoiceGameContent(items: mcItems),
      );
    case ReviewGameType.orderForms:
      final take = shuffled.take(10).toList();
      return ReviewOrderFormsGame(
        gameId: 'review_irregular_order_forms',
        gameType: 'order_forms',
        title: 'Order the forms',
        titleEs: 'Ordena las formas',
        instructions: 'Arrange base, past, and participle in order.',
        instructionsEs: 'Ordena base, pasado y participio en orden.',
        items: take
            .map(
              (item) => ReviewOrderFormsItem(
                base: item['base']!,
                past: item['past']!,
                participle: item['past_participle']!,
              ),
            )
            .toList(),
      );
    case ReviewGameType.typing:
      final take = shuffled.take(8).toList();
      final items = <TypingItem>[];
      for (var i = 0; i < take.length; i++) {
        final base = take[i]['base']!;
        final past = take[i]['past']!;
        final participle = take[i]['past_participle']!;
        final askPast = i.isEven;
        items.add(
          TypingItem(
            id: i + 1,
            promptEs: askPast
                ? 'Escribe el pasado de "$base"'
                : 'Escribe el participio de "$base"',
            answerEn: askPast ? past : participle,
            hint: 'Base: $base',
            hintEs: 'Base: $base',
          ),
        );
      }
      return TypingGame(
        gameId: 'review_irregular_typing',
        gameType: 'typing',
        title: 'Irregular verbs typing',
        titleEs: 'Escritura de verbos irregulares',
        instructions: 'Type the correct form.',
        instructionsEs: 'Escribe la forma correcta.',
        content: TypingGameContent(items: items),
      );
    case ReviewGameType.memory:
      final take = shuffled.take(6).toList();
      return ReviewMemoryGame(
        gameId: 'review_irregular_memory',
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
            right: take[index]['past']!,
          ),
        ),
      );
    case ReviewGameType.bingo:
      final take = shuffled.take(8).toList();
      final rounds = <ReviewBingoRound>[];
      for (var i = 0; i < take.length; i++) {
        final correct = take[i];
        final hintPast = i.isEven;
        final hint = hintPast ? correct['past']! : correct['past_participle']!;
        final prompt = hintPast
            ? 'Base form for past "$hint"?'
            : 'Base form for participle "$hint"?';
        final promptEs = hintPast
            ? '¿Cuál es el infinitivo de "$hint"?'
            : '¿Cuál es el infinitivo del participio "$hint"?';
        final pool = reviewShuffle(items).take(6).toList();
        final options = <String>{correct['base']!};
        for (final item in pool) {
          if (options.length >= 6) break;
          options.add(item['base']!);
        }
        final optionList = options.toList()..shuffle();
        rounds.add(
          ReviewBingoRound(
            prompt: prompt,
            promptEs: promptEs,
            options: optionList,
            correctIndex: optionList.indexOf(correct['base']!),
          ),
        );
      }
      return ReviewBingoGame(
        gameId: 'review_irregular_bingo',
        gameType: 'bingo',
        title: 'Quick bingo',
        titleEs: 'Bingo rápido',
        instructions: 'Tap the correct option.',
        instructionsEs: 'Toca la opción correcta.',
        rounds: rounds,
      );
    case ReviewGameType.fillBlank:
      throw UnsupportedError('Fill blank not available for irregular verbs');
    case ReviewGameType.trueFalse:
      throw UnsupportedError('Game not available for irregular verbs');
  }
}
