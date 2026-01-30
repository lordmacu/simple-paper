import 'package:sqflite/sqflite.dart';
import 'review_words_db.dart';

class EpisodeDbEntry {
  final String episodeId;
  final int episodeNumber;
  final String level;
  final String json;

  const EpisodeDbEntry({
    required this.episodeId,
    required this.episodeNumber,
    required this.level,
    required this.json,
  });
}

class InterviewDbEntry {
  final int episodeNumber;
  final String characterId;
  final String interviewId;
  final String json;

  const InterviewDbEntry({
    required this.episodeNumber,
    required this.characterId,
    required this.interviewId,
    required this.json,
  });
}

class ContentDb {
  ContentDb({ReviewWordsDb? dbProvider})
      : _dbProvider = dbProvider ?? ReviewWordsDb.instance;

  static const String episodesTable = 'episodes';
  static const String interviewsTable = 'character_interviews';
  static const String irregularVerbsTable = 'a1_irregular_verbs';
  static const String countriesTable = 'a1_countries';
  static const String citiesTable = 'a1_cities';
  static const String comparativesTable = 'a1_comparatives';

  final ReviewWordsDb _dbProvider;

  Future<Database> get _db async => _dbProvider.database;

  Future<int> getEpisodeCount() async {
    final db = await _db;
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM $episodesTable');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<Map<String, dynamic>?> getEpisodeByNumber(int episodeNumber) async {
    final db = await _db;
    final rows = await db.query(
      episodesTable,
      where: 'episode_number = ?',
      whereArgs: [episodeNumber],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return rows.first;
  }

  Future<Map<String, dynamic>?> getEpisodeById(String episodeId) async {
    final db = await _db;
    final rows = await db.query(
      episodesTable,
      where: 'episode_id = ?',
      whereArgs: [episodeId],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return rows.first;
  }

  Future<List<Map<String, dynamic>>> getAllEpisodes() async {
    final db = await _db;
    return db.query(
      episodesTable,
      orderBy: 'episode_number ASC',
    );
  }

  Future<List<Map<String, dynamic>>> getEpisodesByLevel(String level) async {
    final db = await _db;
    return db.query(
      episodesTable,
      where: 'level = ?',
      whereArgs: [level],
      orderBy: 'episode_number ASC',
    );
  }

  Future<void> upsertEpisodes(List<EpisodeDbEntry> entries) async {
    if (entries.isEmpty) return;
    final db = await _db;
    final batch = db.batch();
    for (final entry in entries) {
      batch.insert(
        episodesTable,
        {
          'episode_id': entry.episodeId,
          'episode_number': entry.episodeNumber,
          'level': entry.level,
          'json': entry.json,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> clearContentTables() async {
    final db = await _db;
    await db.transaction((txn) async {
      await txn.delete(episodesTable);
      await txn.delete(interviewsTable);
    });
  }

  Future<void> clearLanguageTables() async {
    final db = await _db;
    await db.transaction((txn) async {
      await txn.delete(irregularVerbsTable);
      await txn.delete(countriesTable);
      await txn.delete(citiesTable);
      await txn.delete(comparativesTable);
    });
  }

  Future<void> insertIrregularVerbs(
    List<Map<String, dynamic>> items,
  ) async {
    if (items.isEmpty) return;
    final db = await _db;
    final batch = db.batch();
    for (final item in items) {
      batch.insert(
        irregularVerbsTable,
        {
          'base': item['base'],
          'past': item['past'],
          'past_participle': item['past_participle'],
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> addIrregularVerb({
    required String base,
    required String past,
    required String pastParticiple,
  }) async {
    final db = await _db;
    await db.insert(
      irregularVerbsTable,
      {
        'base': base,
        'past': past,
        'past_participle': pastParticiple,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteIrregularVerb(String base) async {
    final db = await _db;
    await db.delete(
      irregularVerbsTable,
      where: 'base = ?',
      whereArgs: [base],
    );
  }

  Future<void> insertCountries(
    List<Map<String, dynamic>> items,
  ) async {
    if (items.isEmpty) return;
    final db = await _db;
    final batch = db.batch();
    for (final item in items) {
      batch.insert(
        countriesTable,
        {
          'country': item['country'],
          'nationality': item['nationality'],
          'language': item['language'],
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> addCountry({
    required String country,
    required String nationality,
    required String language,
  }) async {
    final db = await _db;
    await db.insert(
      countriesTable,
      {
        'country': country,
        'nationality': nationality,
        'language': language,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteCountry(String country) async {
    final db = await _db;
    await db.delete(
      countriesTable,
      where: 'country = ?',
      whereArgs: [country],
    );
  }

  Future<void> insertCities(List<String> cities) async {
    if (cities.isEmpty) return;
    final db = await _db;
    final batch = db.batch();
    for (final city in cities) {
      batch.insert(
        citiesTable,
        {'city': city},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> addCity(String city) async {
    final db = await _db;
    await db.insert(
      citiesTable,
      {'city': city},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteCity(String city) async {
    final db = await _db;
    await db.delete(
      citiesTable,
      where: 'city = ?',
      whereArgs: [city],
    );
  }

  Future<void> insertComparatives(
    List<Map<String, dynamic>> items,
  ) async {
    if (items.isEmpty) return;
    final db = await _db;
    final batch = db.batch();
    for (final item in items) {
      batch.insert(
        comparativesTable,
        {
          'base': item['base'],
          'comparative': item['comparative'],
          'superlative': item['superlative'],
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> addComparative({
    required String base,
    required String comparative,
    required String superlative,
  }) async {
    final db = await _db;
    await db.insert(
      comparativesTable,
      {
        'base': base,
        'comparative': comparative,
        'superlative': superlative,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteComparative(String base) async {
    final db = await _db;
    await db.delete(
      comparativesTable,
      where: 'base = ?',
      whereArgs: [base],
    );
  }

  Future<void> upsertInterviews(List<InterviewDbEntry> entries) async {
    if (entries.isEmpty) return;
    final db = await _db;
    final batch = db.batch();
    for (final entry in entries) {
      batch.insert(
        interviewsTable,
        {
          'episode_number': entry.episodeNumber,
          'character_id': entry.characterId,
          'interview_id': entry.interviewId,
          'json': entry.json,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<String?> getInterviewJson({
    required int episodeNumber,
    required String characterId,
    required String interviewId,
  }) async {
    final db = await _db;
    final rows = await db.query(
      interviewsTable,
      where: 'episode_number = ? AND character_id = ? AND interview_id = ?',
      whereArgs: [episodeNumber, characterId, interviewId],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return rows.first['json'] as String?;
  }

  Future<bool> hasInterviewForEpisode(int episodeNumber) async {
    final db = await _db;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM $interviewsTable WHERE episode_number = ?',
      [episodeNumber],
    );
    final count = Sqflite.firstIntValue(result) ?? 0;
    return count > 0;
  }

  Future<List<String>> getInterviewCharacterIds(int episodeNumber) async {
    final db = await _db;
    final rows = await db.query(
      interviewsTable,
      columns: ['character_id'],
      where: 'episode_number = ?',
      whereArgs: [episodeNumber],
      orderBy: 'character_id ASC',
      distinct: true,
    );
    return rows
        .map((row) => row['character_id'] as String)
        .where((id) => id.isNotEmpty)
        .toList();
  }

  Future<List<InterviewDbEntry>> getInterviewEntries(int episodeNumber) async {
    final db = await _db;
    final rows = await db.query(
      interviewsTable,
      columns: ['episode_number', 'character_id', 'interview_id', 'json'],
      where: 'episode_number = ?',
      whereArgs: [episodeNumber],
      orderBy: 'character_id ASC, interview_id ASC',
    );
    return rows
        .map(
          (row) => InterviewDbEntry(
            episodeNumber: row['episode_number'] as int,
            characterId: row['character_id'] as String,
            interviewId: row['interview_id'] as String,
            json: row['json'] as String,
          ),
        )
        .toList();
  }

  Future<List<Map<String, String>>> fetchIrregularVerbs({
    int limit = 20,
  }) async {
    final db = await _db;
    final rows = await db.query(
      irregularVerbsTable,
      limit: limit,
      orderBy: 'base ASC',
    );
    return rows
        .map((row) => {
              'base': row['base'] as String,
              'past': row['past'] as String,
              'past_participle': row['past_participle'] as String,
            })
        .toList();
  }

  Future<List<Map<String, String>>> fetchIrregularVerbsAll() async {
    final db = await _db;
    final rows = await db.query(
      irregularVerbsTable,
      orderBy: 'base ASC',
    );
    return rows
        .map((row) => {
              'base': row['base'] as String,
              'past': row['past'] as String,
              'past_participle': row['past_participle'] as String,
            })
        .toList();
  }

  Future<List<Map<String, String>>> fetchCountries({
    int limit = 20,
  }) async {
    final db = await _db;
    final rows = await db.query(
      countriesTable,
      limit: limit,
      orderBy: 'country ASC',
    );
    return rows
        .map((row) => {
              'country': row['country'] as String,
              'nationality': row['nationality'] as String,
              'language': row['language'] as String,
            })
        .toList();
  }

  Future<List<Map<String, String>>> fetchCountriesAll() async {
    final db = await _db;
    final rows = await db.query(
      countriesTable,
      orderBy: 'country ASC',
    );
    return rows
        .map((row) => {
              'country': row['country'] as String,
              'nationality': row['nationality'] as String,
              'language': row['language'] as String,
            })
        .toList();
  }

  Future<List<String>> fetchCities({int limit = 20}) async {
    final db = await _db;
    final rows = await db.query(
      citiesTable,
      limit: limit,
      orderBy: 'city ASC',
    );
    return rows.map((row) => row['city'] as String).toList();
  }

  Future<List<String>> fetchCitiesAll() async {
    final db = await _db;
    final rows = await db.query(
      citiesTable,
      orderBy: 'city ASC',
    );
    return rows.map((row) => row['city'] as String).toList();
  }

  Future<List<Map<String, String>>> fetchComparatives({
    int limit = 20,
  }) async {
    final db = await _db;
    final rows = await db.query(
      comparativesTable,
      limit: limit,
      orderBy: 'base ASC',
    );
    return rows
        .map((row) => {
              'base': row['base'] as String,
              'comparative': row['comparative'] as String,
              'superlative': row['superlative'] as String,
            })
        .toList();
  }

  Future<List<Map<String, String>>> fetchComparativesAll() async {
    final db = await _db;
    final rows = await db.query(
      comparativesTable,
      orderBy: 'base ASC',
    );
    return rows
        .map((row) => {
              'base': row['base'] as String,
              'comparative': row['comparative'] as String,
              'superlative': row['superlative'] as String,
            })
        .toList();
  }
}
