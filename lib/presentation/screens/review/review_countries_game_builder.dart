import 'dart:math';

import '../../../domain/models/game/game.dart';
import '../../../domain/models/game/matching_game.dart';
import '../../../domain/models/game/multiple_choice_game.dart';
import 'review_bingo_game.dart';
import 'review_game_helpers.dart';
import 'review_memory_game.dart';
import 'review_true_false_game.dart';
import 'review_types.dart';

Game buildCountriesGame(
  List<Map<String, String>> items,
  ReviewGameType type,
) {
  final shuffled = reviewShuffle(items);
  switch (type) {
    case ReviewGameType.matching:
      final take = shuffled.take(5).toList();
      return MatchingGame(
        gameId: 'review_countries_matching',
        gameType: 'matching',
        title: 'Countries',
        titleEs: 'Países',
        instructions: 'Match the country with its nationality.',
        instructionsEs: 'Empareja el país con su nacionalidad.',
        content: MatchingGameContent(
          items: List.generate(
            take.length,
            (index) => MatchingItem(
              id: index + 1,
              left: take[index]['country']!,
              right: take[index]['nationality']!,
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
      final countriesPool = items.map((e) => e['country']!).toList();
      final nationalitiesPool =
          items.map((e) => e['nationality']!).toList();
      final languagesPool = items.map((e) => e['language']!).toList();
      final mcItems = <MultipleChoiceItem>[];

      for (var i = 0; i < take.length; i++) {
        final item = take[i];
        final kind = i % 3;
        String question;
        String questionEs;
        String correct;
        List<String> pool;

        if (kind == 0) {
          question = 'Nationality of ${item['country']}?';
          questionEs = '¿Cuál es la nacionalidad de ${item['country']}?';
          correct = item['nationality']!;
          pool = nationalitiesPool;
        } else if (kind == 1) {
          question = 'Language of ${item['country']}?';
          questionEs = '¿Cuál es el idioma de ${item['country']}?';
          correct = item['language']!;
          pool = languagesPool;
        } else {
          question = 'Country of ${item['nationality']}?';
          questionEs = '¿De qué país es ${item['nationality']}?';
          correct = item['country']!;
          pool = countriesPool;
        }

        final options = reviewBuildOptions(correct, pool, count: 4);
        final correctIndex = options.indexOf(correct);

        mcItems.add(
          MultipleChoiceItem(
            id: i + 1,
            question: question,
            questionEs: questionEs,
            options: options,
            optionsEs: const [],
            correctAnswer: correctIndex,
          ),
        );
      }

      return MultipleChoiceGame(
        gameId: 'review_countries_quiz',
        gameType: 'multiple_choice',
        title: 'Countries quiz',
        titleEs: 'Quiz de países',
        instructions: 'Choose the correct option.',
        instructionsEs: 'Elige la opción correcta.',
        content: MultipleChoiceGameContent(items: mcItems),
      );
    case ReviewGameType.trueFalse:
      final take = shuffled.take(10).toList();
      final nationalitiesPool =
          items.map((e) => e['nationality']!).toList();
      final languagesPool = items.map((e) => e['language']!).toList();
      final rng = Random();
      final tfItems = <ReviewTrueFalseItem>[];

      for (var i = 0; i < take.length; i++) {
        final item = take[i];
        final useNationality = i.isEven;
        final isTrue = rng.nextBool();
        final correctValue =
            useNationality ? item['nationality']! : item['language']!;
        final pool = useNationality ? nationalitiesPool : languagesPool;
        final wrongValue = pool.firstWhere(
          (value) => value != correctValue,
          orElse: () => correctValue,
        );
        final shownValue = isTrue ? correctValue : wrongValue;
        final statement = useNationality
            ? 'The nationality of ${item['country']} is $shownValue.'
            : 'The language of ${item['country']} is $shownValue.';
        final statementEs = useNationality
            ? 'La nacionalidad de ${item['country']} es $shownValue.'
            : 'El idioma de ${item['country']} es $shownValue.';

        tfItems.add(
          ReviewTrueFalseItem(
            statement: statement,
            statementEs: statementEs,
            isTrue: isTrue,
          ),
        );
      }

      return ReviewTrueFalseGame(
        gameId: 'review_countries_true_false',
        gameType: 'true_false',
        title: 'True or false',
        titleEs: 'Verdadero o falso',
        instructions: 'Decide if the statement is true.',
        instructionsEs: 'Decide si la frase es verdadera.',
        items: tfItems,
      );
    case ReviewGameType.memory:
      final take = shuffled.take(6).toList();
      return ReviewMemoryGame(
        gameId: 'review_countries_memory',
        gameType: 'memory',
        title: 'Memory match',
        titleEs: 'Memoria',
        instructions: 'Find the matching pairs.',
        instructionsEs: 'Encuentra los pares.',
        pairs: List.generate(
          take.length,
          (index) => ReviewMemoryPair(
            id: index + 1,
            left: take[index]['country']!,
            right: take[index]['nationality']!,
          ),
        ),
      );
    case ReviewGameType.bingo:
      final take = shuffled.take(8).toList();
      final rounds = <ReviewBingoRound>[];
      for (var i = 0; i < take.length; i++) {
        final correct = take[i];
        final useNationality = i.isEven;
        final hint = useNationality
            ? correct['nationality']!
            : correct['language']!;
        final prompt = useNationality
            ? 'Country for nationality "$hint"?'
            : 'Country for language "$hint"?';
        final promptEs = useNationality
            ? '¿País de la nacionalidad "$hint"?'
            : '¿País del idioma "$hint"?';
        final pool = reviewShuffle(items).take(6).toList();
        final options = <String>{correct['country']!};
        for (final item in pool) {
          if (options.length >= 6) break;
          options.add(item['country']!);
        }
        final optionList = options.toList()..shuffle();
        rounds.add(
          ReviewBingoRound(
            prompt: prompt,
            promptEs: promptEs,
            options: optionList,
            correctIndex: optionList.indexOf(correct['country']!),
          ),
        );
      }
      return ReviewBingoGame(
        gameId: 'review_countries_bingo',
        gameType: 'bingo',
        title: 'Quick bingo',
        titleEs: 'Bingo rápido',
        instructions: 'Tap the correct option.',
        instructionsEs: 'Toca la opción correcta.',
        rounds: rounds,
      );
    case ReviewGameType.fillBlank:
    case ReviewGameType.flashcard:
    case ReviewGameType.orderForms:
    case ReviewGameType.typing:
      throw UnsupportedError('Game not available for countries');
  }
}

Game buildCitiesGame(
  List<String> cities,
  ReviewGameType type,
) {
  if (type != ReviewGameType.multipleChoice) {
    throw UnsupportedError('Only quiz available for cities');
  }

  final shuffled = reviewShuffle(cities);
  final take = shuffled.take(8).toList();
  final mcItems = <MultipleChoiceItem>[];

  for (var i = 0; i < take.length; i++) {
    final city = take[i];
    final options = reviewBuildOptions(city, cities, count: 4);
    final correctIndex = options.indexOf(city);
    mcItems.add(
      MultipleChoiceItem(
        id: i + 1,
        question: 'Select the city: $city',
        questionEs: 'Selecciona la ciudad: $city',
        options: options,
        optionsEs: const [],
        correctAnswer: correctIndex,
      ),
    );
  }

  return MultipleChoiceGame(
    gameId: 'review_cities_quiz',
    gameType: 'multiple_choice',
    title: 'Cities quiz',
    titleEs: 'Quiz de ciudades',
    instructions: 'Choose the correct city.',
    instructionsEs: 'Elige la ciudad correcta.',
    content: MultipleChoiceGameContent(items: mcItems),
  );
}
