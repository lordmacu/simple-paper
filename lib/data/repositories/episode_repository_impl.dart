import '../../domain/models/episode/episode.dart';
import '../../domain/repositories/i_episode_repository.dart';
import '../sources/local_episode_source.dart';

/// Implementación concreta del repositorio de episodios.
///
/// Utiliza [LocalEpisodeSource] para obtener los datos desde assets JSON.
/// Maneja errores y excepciones convirtiéndolos a null cuando es apropiado
/// para cumplir con el contrato de [IEpisodeRepository].
class EpisodeRepositoryImpl implements IEpisodeRepository {
  final LocalEpisodeSource _source;

  EpisodeRepositoryImpl({LocalEpisodeSource? source})
    : _source = source ?? LocalEpisodeSource();

  @override
  Future<Episode?> getEpisodeByNumber(int episodeNumber) async {
    try {
      return await _source.loadEpisodeByNumber(episodeNumber);
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
      return await _source.loadEpisodeById(episodeId);
    } catch (e) {
      print('EpisodeRepositoryImpl: Error loading episode ID $episodeId: $e');
      return null;
    }
  }

  @override
  Future<List<Episode>> getAllEpisodes() async {
    // LocalEpisodeSource.loadAllEpisodes ya maneja errores internos
    // y retorna la lista de los que sí pudo cargar.
    return await _source.loadAllEpisodes();
  }

  @override
  Future<List<Episode>> getEpisodesByLevel(String level) async {
    try {
      return await _source.loadEpisodesByLevel(level);
    } catch (e) {
      print(
        'EpisodeRepositoryImpl: Error loading episodes for level $level: $e',
      );
      return [];
    }
  }

  @override
  Future<bool> isEpisodeAvailable(int episodeNumber) async {
    return await _source.isEpisodeAvailable(episodeNumber);
  }

  @override
  Future<int> getTotalEpisodesCount() async {
    return await _source.getTotalEpisodesCount();
  }
}
