import '../../domain/models/episode/episode.dart';
import '../../domain/repositories/i_episode_repository.dart';
import '../parsers/episode_json_parser.dart';
import '../sources/content_db.dart';

/// Implementación concreta del repositorio de episodios.
///
/// Utiliza [LocalEpisodeSource] para obtener los datos desde assets JSON.
/// Maneja errores y excepciones convirtiéndolos a null cuando es apropiado
/// para cumplir con el contrato de [IEpisodeRepository].
class EpisodeRepositoryImpl implements IEpisodeRepository {
  final ContentDb _contentDb;
  final EpisodeJsonParser _parser;

  EpisodeRepositoryImpl({
    ContentDb? contentDb,
    EpisodeJsonParser? parser,
  })  : _contentDb = contentDb ?? ContentDb(),
        _parser = parser ?? EpisodeJsonParser();

  @override
  Future<Episode?> getEpisodeByNumber(int episodeNumber) async {
    try {
      final row = await _contentDb.getEpisodeByNumber(episodeNumber);
      if (row != null) {
        return _parser.parseFromString(row['json'] as String);
      }
      return null;
    } catch (e) {
      // Si hay error (ej. archivo no encontrado), retornamos null
      // Esto permite a la UI manejar el caso de "Episodio no encontrado"
      print('EpisodeRepositoryImpl: Error loading episode #$episodeNumber: $e');
      return null;
    }
  }

  @override
  Future<Episode?> getEpisodeById(String episodeId) async {
    try {
      final row = await _contentDb.getEpisodeById(episodeId);
      if (row != null) {
        return _parser.parseFromString(row['json'] as String);
      }
      return null;
    } catch (e) {
      print('EpisodeRepositoryImpl: Error loading episode ID $episodeId: $e');
      return null;
    }
  }

  @override
  Future<List<Episode>> getAllEpisodes() async {
    final rows = await _contentDb.getAllEpisodes();
    return rows
        .map((row) => _parser.parseFromString(row['json'] as String))
        .toList();
  }

  @override
  Future<List<Episode>> getEpisodesByLevel(String level) async {
    try {
      final rows = await _contentDb.getEpisodesByLevel(level.toUpperCase());
      return rows
          .map((row) => _parser.parseFromString(row['json'] as String))
          .toList();
    } catch (e) {
      print(
        'EpisodeRepositoryImpl: Error loading episodes for level $level: $e',
      );
      return [];
    }
  }

  @override
  Future<bool> isEpisodeAvailable(int episodeNumber) async {
    final row = await _contentDb.getEpisodeByNumber(episodeNumber);
    return row != null;
  }

  @override
  Future<int> getTotalEpisodesCount() async {
    return await _contentDb.getEpisodeCount();
  }
}
