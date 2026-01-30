import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart' as p;
import '../../domain/models/progress/review_word_entry.dart';

/// SQLite database for review words
class ReviewWordsDb {
  ReviewWordsDb._();

  static final ReviewWordsDb instance = ReviewWordsDb._();

  static const String _dbName = 'office_app.db';
  static const String _tableName = 'review_words';
  static const int _dbVersion = 5;
  static const String _episodesTable = 'episodes';
  static const String _interviewsTable = 'character_interviews';
  static const String _irregularVerbsTable = 'a1_irregular_verbs';
  static const String _countriesTable = 'a1_countries';
  static const String _citiesTable = 'a1_cities';
  static const String _comparativesTable = 'a1_comparatives';

  Database? _db;

  Future<Database> get database async => _getDb();

  Future<Database> _getDb() async {
    if (_db != null) return _db!;

    final String path;
    if (kIsWeb) {
      // Web uses an indexeddb-backed database; no filesystem path.
      path = _dbName;
    } else {
      final dbPath = await getDatabasesPath();
      path = p.join(dbPath, _dbName);
    }

    final factory =
        kIsWeb ? databaseFactoryFfiWebNoWebWorker : databaseFactory;
    _db = await factory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: _dbVersion,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE $_tableName (word TEXT, level TEXT, episode_number INTEGER, mistakes INTEGER NOT NULL DEFAULT 0, PRIMARY KEY(word, level, episode_number))',
          );
          await db.execute(
          'CREATE TABLE $_episodesTable (episode_id TEXT PRIMARY KEY, episode_number INTEGER NOT NULL, level TEXT NOT NULL, json TEXT NOT NULL)',
        );
        await db.execute(
          'CREATE TABLE $_interviewsTable (episode_number INTEGER NOT NULL, character_id TEXT NOT NULL, interview_id TEXT NOT NULL, json TEXT NOT NULL, PRIMARY KEY(episode_number, character_id, interview_id))',
        );
        await db.execute(
          'CREATE TABLE $_irregularVerbsTable (base TEXT PRIMARY KEY, past TEXT NOT NULL, past_participle TEXT NOT NULL)',
        );
        await db.execute(
          'CREATE TABLE $_countriesTable (country TEXT PRIMARY KEY, nationality TEXT NOT NULL, language TEXT NOT NULL)',
        );
        await db.execute(
          'CREATE TABLE $_citiesTable (city TEXT PRIMARY KEY)',
        );
          await db.execute(
            'CREATE TABLE $_comparativesTable (base TEXT PRIMARY KEY, comparative TEXT NOT NULL, superlative TEXT NOT NULL)',
          );
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < 2) {
            await db.execute('DROP TABLE IF EXISTS $_tableName');
            await db.execute(
              'CREATE TABLE $_tableName (word TEXT, level TEXT, episode_number INTEGER, mistakes INTEGER NOT NULL DEFAULT 0, PRIMARY KEY(word, level, episode_number))',
            );
          }
        if (oldVersion < 3) {
          await db.execute(
            'CREATE TABLE IF NOT EXISTS $_episodesTable (episode_id TEXT PRIMARY KEY, episode_number INTEGER NOT NULL, level TEXT NOT NULL, json TEXT NOT NULL)',
          );
          await db.execute(
            'CREATE TABLE IF NOT EXISTS $_interviewsTable (episode_number INTEGER NOT NULL, character_id TEXT NOT NULL, json TEXT NOT NULL, PRIMARY KEY(episode_number, character_id))',
          );
        }
        if (oldVersion < 4) {
          await db.execute(
            'CREATE TABLE IF NOT EXISTS $_irregularVerbsTable (base TEXT PRIMARY KEY, past TEXT NOT NULL, past_participle TEXT NOT NULL)',
          );
          await db.execute(
            'CREATE TABLE IF NOT EXISTS $_countriesTable (country TEXT PRIMARY KEY, nationality TEXT NOT NULL, language TEXT NOT NULL)',
          );
          await db.execute(
            'CREATE TABLE IF NOT EXISTS $_citiesTable (city TEXT PRIMARY KEY)',
          );
          await db.execute(
            'CREATE TABLE IF NOT EXISTS $_comparativesTable (base TEXT PRIMARY KEY, comparative TEXT NOT NULL, superlative TEXT NOT NULL)',
          );
        }
        if (oldVersion < 5) {
          await db.execute(
            'CREATE TABLE IF NOT EXISTS ${_interviewsTable}_new (episode_number INTEGER NOT NULL, character_id TEXT NOT NULL, interview_id TEXT NOT NULL, json TEXT NOT NULL, PRIMARY KEY(episode_number, character_id, interview_id))',
          );
          await db.execute(
            'INSERT OR REPLACE INTO ${_interviewsTable}_new (episode_number, character_id, interview_id, json) '
            'SELECT episode_number, character_id, \"default\", json FROM $_interviewsTable',
          );
          await db.execute('DROP TABLE IF EXISTS $_interviewsTable');
          await db.execute(
            'ALTER TABLE ${_interviewsTable}_new RENAME TO $_interviewsTable',
          );
        }
      },
    ));

    return _db!;
  }

  Future<List<String>> getAllWords() async {
    final db = await _getDb();
    final rows = await db.query(
      _tableName,
      columns: ['word'],
      distinct: true,
      orderBy: 'word ASC',
    );
    return rows.map((row) => row['word'] as String).toList();
  }

  Future<List<ReviewWordEntry>> getAllEntries() async {
    final db = await _getDb();
    final rows = await db.query(
      _tableName,
      orderBy: 'mistakes DESC, word ASC',
    );

    return rows
        .map(
          (row) => ReviewWordEntry(
            word: row['word'] as String,
            level: row['level'] as String,
            episodeNumber: row['episode_number'] as int,
            mistakes: row['mistakes'] as int,
          ),
        )
        .toList();
  }

  Future<void> addWords({
    required List<String> words,
    required String level,
    required int episodeNumber,
    int increment = 1,
  }) async {
    if (words.isEmpty) return;

    final db = await _getDb();

    await db.transaction((txn) async {
      for (final word in words) {
        final updated = await txn.rawUpdate(
          'UPDATE $_tableName SET mistakes = mistakes + ? WHERE word = ? AND level = ? AND episode_number = ?',
          [increment, word, level, episodeNumber],
        );

        if (updated == 0) {
          await txn.insert(
            _tableName,
            {
              'word': word,
              'level': level,
              'episode_number': episodeNumber,
              'mistakes': increment,
            },
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
        }
      }
    });
  }

  Future<void> deleteEntry({
    required String word,
    required String level,
    required int episodeNumber,
  }) async {
    final db = await _getDb();
    await db.delete(
      _tableName,
      where: 'word = ? AND level = ? AND episode_number = ?',
      whereArgs: [word, level, episodeNumber],
    );
  }
}
