import 'dart:convert';
import '../../domain/models/episode/episode.dart';
import 'game_factory.dart';

/// Parser principal de episodios JSON
/// Convierte archivos JSON de episodios a objetos Episode
class EpisodeJsonParser {
  /// Parsea un episodio desde un String JSON
  /// 
  /// [jsonString] - String con el JSON del episodio
  /// 
  /// Returns: Episode parseado
  /// Throws: EpisodeParsingException si hay error en el parseo
  Episode parseFromString(String jsonString) {
    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return parseFromJson(json);
    } catch (e) {
      throw EpisodeParsingException(
        'Error decoding JSON string: ${e.toString()}',
      );
    }
  }
  
  /// Parsea un episodio desde un Map JSON
  /// 
  /// [json] - Map con los datos del episodio
  /// 
  /// Returns: Episode parseado
  /// Throws: EpisodeParsingException si hay error en el parseo
  Episode parseFromJson(Map<String, dynamic> json) {
    try {
      // Validar campos principales
      _validateEpisodeJson(json);
      
      // Parsear usando el método generado por json_serializable
      return Episode.fromJson(json);
    } on GameParsingException catch (e) {
      throw EpisodeParsingException(
        'Error parsing games: ${e.toString()}',
      );
    } catch (e) {
      throw EpisodeParsingException(
        'Error parsing episode: ${e.toString()}',
      );
    }
  }
  
  /// Valida que el JSON del episodio tenga la estructura mínima requerida
  /// 
  /// [json] - JSON a validar
  /// 
  /// Throws: EpisodeParsingException si falta algún campo crítico
  void _validateEpisodeJson(Map<String, dynamic> json) {
    final requiredSections = [
      'episode_metadata',
      'city_settings',
      'characters',
      'vocabulary_focus',
      'scenes',
      'games',
      'progression',
      'content_wrappers',
    ];
    
    for (final section in requiredSections) {
      if (!json.containsKey(section)) {
        throw EpisodeParsingException('Missing required section: $section');
      }
    }
    
    // Validar metadata crítico
    final metadata = json['episode_metadata'] as Map<String, dynamic>?;
    if (metadata == null) {
      throw EpisodeParsingException('episode_metadata is null');
    }
    
    if (!metadata.containsKey('episode_number')) {
      throw EpisodeParsingException('Missing episode_number in episode_metadata');
    }
    
    if (!metadata.containsKey('episode_id')) {
      throw EpisodeParsingException('Missing episode_id in episode_metadata');
    }
  }
  
  /// Parsea múltiples episodios desde una lista JSON
  /// 
  /// [jsonList] - Lista de JSONs de episodios
  /// 
  /// Returns: Lista de episodios parseados
  List<Episode> parseMultiple(List<dynamic> jsonList) {
    final episodes = <Episode>[];
    
    for (var i = 0; i < jsonList.length; i++) {
      try {
        final episodeJson = jsonList[i] as Map<String, dynamic>;
        episodes.add(parseFromJson(episodeJson));
      } catch (e) {
        throw EpisodeParsingException(
          'Error parsing episode at index $i: ${e.toString()}',
        );
      }
    }
    
    return episodes;
  }
}

/// Excepción de parseo de episodios
class EpisodeParsingException implements Exception {
  final String message;
  
  EpisodeParsingException(this.message);
  
  @override
  String toString() => 'EpisodeParsingException: $message';
}
