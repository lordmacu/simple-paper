import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import '../../domain/models/progress/review_word_entry.dart';

/// SQLite database for review words
class ReviewWordsDb {
  ReviewWordsDb._();

  static final ReviewWordsDb instance = ReviewWordsDb._();

  static const String _dbName = 'office_app.db';
  static const String _tableName = 'review_words';
  static const int _dbVersion = 2;

  Database? _db;

  Future<Database> _getDb() async {
    if (_db != null) return _db!;

    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, _dbName);

    _db = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $_tableName (word TEXT, level TEXT, episode_number INTEGER, mistakes INTEGER NOT NULL DEFAULT 0, PRIMARY KEY(word, level, episode_number))',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('DROP TABLE IF EXISTS $_tableName');
          await db.execute(
            'CREATE TABLE $_tableName (word TEXT, level TEXT, episode_number INTEGER, mistakes INTEGER NOT NULL DEFAULT 0, PRIMARY KEY(word, level, episode_number))',
          );
        }
      },
    );

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
