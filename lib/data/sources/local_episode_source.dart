import 'package:flutter/services.dart' show rootBundle;
import '../../domain/models/episode/episode.dart';
import '../parsers/episode_json_parser.dart';

/// Data source que carga episodios desde los assets locales de la app.
/// 
/// Lee archivos JSON de la carpeta assets/episodes/ y los convierte
/// a objetos [Episode] usando [EpisodeJsonParser].
class LocalEpisodeSource {
  final EpisodeJsonParser _parser;
  final String _assetsPath;
  
  LocalEpisodeSource({
    EpisodeJsonParser? parser,
    String assetsPath = 'assets/episodes/',
  })  : _parser = parser ?? EpisodeJsonParser(),
        _assetsPath = assetsPath;
  
  /// Carga un episodio por su número (1-30).
  /// 
  /// Ejemplo: loadEpisodeByNumber(1) carga "episode_a1_01.json"
  Future<Episode> loadEpisodeByNumber(int episodeNumber) async {
    final fileName = 'episode_a1_${episodeNumber.toString().padLeft(2, '0')}.json';
    final filePath = '$_assetsPath$fileName';
    
    try {
      final jsonString = await rootBundle.loadString(filePath);
      return _parser.parseFromString(jsonString);
    } catch (e) {
      throw EpisodeLoadException(
        'Failed to load episode $episodeNumber from $filePath: $e',
      );
    }
  }
  
  /// Carga un episodio por su ID (ej: "ep_a1_001").
  Future<Episode> loadEpisodeById(String episodeId) async {
    // Extraer número del ID (ej: "ep_a1_001" -> 1)
    final match = RegExp(r'ep_a1_(\d+)').firstMatch(episodeId);
    if (match == null) {
      throw EpisodeLoadException('Invalid episode ID format: $episodeId');
    }
    
    final episodeNumber = int.parse(match.group(1)!);
    return loadEpisodeByNumber(episodeNumber);
  }
  
  /// Carga todos los episodios disponibles (1-30 para nivel A1).
  /// 
  /// Si un episodio falla al cargar, se registra el error pero continúa
  /// cargando los demás episodios.
  Future<List<Episode>> loadAllEpisodes() async {
    final episodes = <Episode>[];
    
    // Cargar todos los 30 episodios (nivel A1)
    for (int i = 1; i <= 30; i++) {
      try {
        final episode = await loadEpisodeByNumber(i);
        episodes.add(episode);
      } catch (e) {
        // Registrar error pero continuar cargando otros episodios
        print('Warning: Could not load episode $i: $e');
      }
    }
    
    return episodes;
  }
  
  /// Carga episodios filtrados por nivel CEFR.
  /// 
  /// Actualmente solo soporta nivel "A1".
  Future<List<Episode>> loadEpisodesByLevel(String level) async {
    if (level.toUpperCase() != 'A1') {
      throw EpisodeLoadException(
        'Only A1 level is currently supported. Requested: $level',
      );
    }
    
    return loadAllEpisodes();
  }
  
  /// Verifica si un episodio está disponible para cargar.
  Future<bool> isEpisodeAvailable(int episodeNumber) async {
    if (episodeNumber < 1 || episodeNumber > 30) {
      return false;
    }
    
    try {
      await loadEpisodeByNumber(episodeNumber);
      return true;
    } catch (e) {
      return false;
    }
  }
  
  /// Retorna el total de episodios disponibles.
  Future<int> getTotalEpisodesCount() async {
    return 30; // Nivel A1 tiene 30 episodios
  }
}

/// Excepción lanzada cuando falla la carga de un episodio desde assets.
class EpisodeLoadException implements Exception {
  final String message;
  
  EpisodeLoadException(this.message);
  
  @override
  String toString() => 'EpisodeLoadException: $message';
}
