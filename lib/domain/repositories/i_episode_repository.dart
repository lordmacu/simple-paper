import '../models/episode/episode.dart';

/// Interface del repositorio de episodios
/// Define el contrato para acceso a episodios desde cualquier fuente de datos
abstract class IEpisodeRepository {
  /// Obtiene un episodio por su número
  /// 
  /// [episodeNumber] - Número del episodio (1-30 para nivel A1)
  /// 
  /// Returns: Episode si existe, null si no se encuentra
  /// Throws: Exception si hay error al cargar
  Future<Episode?> getEpisodeByNumber(int episodeNumber);
  
  /// Obtiene un episodio por su ID
  /// 
  /// [episodeId] - ID del episodio (ej: "ep_001")
  /// 
  /// Returns: Episode si existe, null si no se encuentra
  /// Throws: Exception si hay error al cargar
  Future<Episode?> getEpisodeById(String episodeId);
  
  /// Obtiene todos los episodios disponibles
  /// 
  /// Returns: Lista de todos los episodios
  /// Throws: Exception si hay error al cargar
  Future<List<Episode>> getAllEpisodes();
  
  /// Obtiene episodios de un nivel específico
  /// 
  /// [level] - Nivel del episodio ("A1", "A2", etc.)
  /// 
  /// Returns: Lista de episodios del nivel especificado
  Future<List<Episode>> getEpisodesByLevel(String level);
  
  /// Verifica si un episodio está disponible localmente
  /// 
  /// [episodeNumber] - Número del episodio a verificar
  /// 
  /// Returns: true si el episodio existe, false si no
  Future<bool> isEpisodeAvailable(int episodeNumber);
  
  /// Obtiene el número total de episodios disponibles
  /// 
  /// Returns: Cantidad total de episodios
  Future<int> getTotalEpisodesCount();
}
