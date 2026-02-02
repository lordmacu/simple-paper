import 'package:sqflite/sqflite.dart';
import 'review_words_db.dart';

/// Entrada de episodio en la base de datos.
class EpisodeDbEntry {
  /// ID único del episodio.
  final String episodeId;

  /// Número del episodio.
  final int episodeNumber;

  /// Nivel del episodio (A1, A2, etc.).
  final String level;

  /// JSON serializado del episodio.
  final String json;

  /// Crea un [EpisodeDbEntry].
  const EpisodeDbEntry({
    required this.episodeId,
    required this.episodeNumber,
    required this.level,
    required this.json,
  });
}

/// Entrada de entrevista en la base de datos.
class InterviewDbEntry {
  /// Número del episodio asociado.
  final int episodeNumber;

  /// ID del personaje.
  final String characterId;

  /// ID de la entrevista.
  final String interviewId;

  /// JSON serializado de la entrevista.
  final String json;

  /// Crea un [InterviewDbEntry].
  const InterviewDbEntry({
    required this.episodeNumber,
    required this.characterId,
    required this.interviewId,
    required this.json,
  });
}

/// Base de datos de contenido (episodios, entrevistas, datos de idioma).
///
/// Gestiona el almacenamiento y recuperación de contenido educativo.
class ContentDb {
  /// Crea un [ContentDb].
  ContentDb({ReviewWordsDb? dbProvider})
      : _dbProvider = dbProvider ?? ReviewWordsDb.instance;

  /// Nombre de la tabla de episodios.
  static const String episodesTable = 'episodes';

  /// Nombre de la tabla de entrevistas.
  static const String interviewsTable = 'character_interviews';

  /// Nombre de la tabla de verbos irregulares.
  static const String irregularVerbsTable = 'a1_irregular_verbs';

  /// Nombre de la tabla de países.
  static const String countriesTable = 'a1_countries';

  /// Nombre de la tabla de ciudades.
  static const String citiesTable = 'a1_cities';

  /// Nombre de la tabla de comparativos.
  static const String comparativesTable = 'a1_comparatives';

  final ReviewWordsDb _dbProvider;

  Future<Database> get _db async => _dbProvider.database;

  /// Obtiene el conteo total de episodios.
  Future<int> getEpisodeCount() async {
    final db = await _db;
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM $episodesTable');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  /// Obtiene un episodio por número.
  Future<Map<String, dynamic>?> getEpisodeByNumber(int episodeNumber) async {
    final db = await _db;
    final rows = await db.query(
      episodesTable,
      where: 'episode_number = ?',
      whereArgs: [episodeNumber],
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }
    return rows.first;
  }

  /// Obtiene un episodio por ID.
  Future<Map<String, dynamic>?> getEpisodeById(String episodeId) async {
    final db = await _db;
    final rows = await db.query(
      episodesTable,
      where: 'episode_id = ?',
      whereArgs: [episodeId],
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }
    return rows.first;
  }

  /// Obtiene todos los episodios.
  Future<List<Map<String, dynamic>>> getAllEpisodes() async {
    final db = await _db;
    return db.query(
      episodesTable,
      orderBy: 'episode_number ASC',
    );
  }

  /// Obtiene episodios por nivel.
  Future<List<Map<String, dynamic>>> getEpisodesByLevel(String level) async {
    final db = await _db;
    return db.query(
      episodesTable,
      where: 'level = ?',
      whereArgs: [level],
      orderBy: 'episode_number ASC',
    );
  }

  /// Inserta o actualiza episodios.
  Future<void> upsertEpisodes(List<EpisodeDbEntry> entries) async {
    if (entries.isEmpty) {
      return;
    }
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

  /// Limpia las tablas de contenido.
  Future<void> clearContentTables() async {
    final db = await _db;
    await db.transaction((txn) async {
      await txn.delete(episodesTable);
      await txn.delete(interviewsTable);
    });
  }

  /// Limpia las tablas de datos de idioma.
  Future<void> clearLanguageTables() async {
    final db = await _db;
    await db.transaction((txn) async {
      await txn.delete(irregularVerbsTable);
      await txn.delete(countriesTable);
      await txn.delete(citiesTable);
      await txn.delete(comparativesTable);
    });
  }

  /// Inserta verbos irregulares en batch.
  Future<void> insertIrregularVerbs(
    List<Map<String, dynamic>> items,
  ) async {
    if (items.isEmpty) {
      return;
    }
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

  /// Agrega un verbo irregular.
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

  /// Elimina un verbo irregular.
  Future<void> deleteIrregularVerb(String base) async {
    final db = await _db;
    await db.delete(
      irregularVerbsTable,
      where: 'base = ?',
      whereArgs: [base],
    );
  }

  /// Inserta países en batch.
  Future<void> insertCountries(
    List<Map<String, dynamic>> items,
  ) async {
    if (items.isEmpty) {
      return;
    }
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

  /// Agrega un país.
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

  /// Elimina un país.
  Future<void> deleteCountry(String country) async {
    final db = await _db;
    await db.delete(
      countriesTable,
      where: 'country = ?',
      whereArgs: [country],
    );
  }

  /// Inserta ciudades en batch.
  Future<void> insertCities(List<String> cities) async {
    if (cities.isEmpty) {
      return;
    }
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

  /// Agrega una ciudad.
  Future<void> addCity(String city) async {
    final db = await _db;
    await db.insert(
      citiesTable,
      {'city': city},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Elimina una ciudad.
  Future<void> deleteCity(String city) async {
    final db = await _db;
    await db.delete(
      citiesTable,
      where: 'city = ?',
      whereArgs: [city],
    );
  }

  /// Inserta adjetivos comparativos en batch.
  Future<void> insertComparatives(
    List<Map<String, dynamic>> items,
  ) async {
    if (items.isEmpty) {
      return;
    }
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

  /// Agrega un adjetivo comparativo.
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

  /// Elimina un adjetivo comparativo.
  Future<void> deleteComparative(String base) async {
    final db = await _db;
    await db.delete(
      comparativesTable,
      where: 'base = ?',
      whereArgs: [base],
    );
  }

  /// Inserta o actualiza entrevistas.
  Future<void> upsertInterviews(List<InterviewDbEntry> entries) async {
    if (entries.isEmpty) {
      return;
    }
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

  /// Obtiene el JSON de una entrevista.
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
    if (rows.isEmpty) {
      return null;
    }
    return rows.first['json'] as String?;
  }

  /// Verifica si hay entrevistas para un episodio.
  Future<bool> hasInterviewForEpisode(int episodeNumber) async {
    final db = await _db;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM $interviewsTable WHERE episode_number = ?',
      [episodeNumber],
    );
    final count = Sqflite.firstIntValue(result) ?? 0;
    return count > 0;
  }

  /// Obtiene IDs de personajes con entrevistas en un episodio.
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

  /// Obtiene entradas de entrevistas de un episodio.
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

  /// Obtiene verbos irregulares con límite.
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

  /// Obtiene todos los verbos irregulares.
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

  /// Obtiene países con límite.
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

  /// Obtiene todos los países.
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

  /// Obtiene ciudades con límite.
  Future<List<String>> fetchCities({int limit = 20}) async {
    final db = await _db;
    final rows = await db.query(
      citiesTable,
      limit: limit,
      orderBy: 'city ASC',
    );
    return rows.map((row) => row['city'] as String).toList();
  }

  /// Obtiene todas las ciudades.
  Future<List<String>> fetchCitiesAll() async {
    final db = await _db;
    final rows = await db.query(
      citiesTable,
      orderBy: 'city ASC',
    );
    return rows.map((row) => row['city'] as String).toList();
  }

  /// Obtiene comparativos con límite.
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

  /// Obtiene todos los comparativos.
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
