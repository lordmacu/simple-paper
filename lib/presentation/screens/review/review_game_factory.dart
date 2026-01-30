import '../../../data/sources/content_db.dart';
import '../../../domain/models/game/game.dart';
import 'review_comparatives_game_builder.dart';
import 'review_countries_game_builder.dart';
import 'review_irregular_game_builder.dart';
import 'review_types.dart';

class ReviewGameFactory {
  static Future<Game> build({
    required ReviewCategoryType category,
    required ReviewGameType gameType,
    List<Map<String, String>>? irregularVerbs,
    List<Map<String, String>>? countries,
    List<String>? cities,
    List<Map<String, String>>? comparatives,
  }) async {
    final db = ContentDb();
    switch (category) {
      case ReviewCategoryType.irregularVerbs:
        final verbs =
            irregularVerbs ?? await db.fetchIrregularVerbs(limit: 40);
        if (verbs.isEmpty) {
          throw Exception('No hay verbos irregulares importados.');
        }
        return buildIrregularVerbGame(verbs, gameType);
      case ReviewCategoryType.countries:
        final items = countries ?? await db.fetchCountries(limit: 40);
        if (items.isEmpty) {
          throw Exception('No hay países importados.');
        }
        return buildCountriesGame(items, gameType);
      case ReviewCategoryType.cities:
        final cityList = cities ?? await db.fetchCities(limit: 40);
        if (cityList.isEmpty) {
          throw Exception('No hay ciudades importadas.');
        }
        return buildCitiesGame(cityList, gameType);
      case ReviewCategoryType.comparatives:
        final items =
            comparatives ?? await db.fetchComparatives(limit: 40);
        if (items.isEmpty) {
          throw Exception('No hay comparativos importados.');
        }
        return buildComparativesGame(items, gameType);
    }
  }
}
