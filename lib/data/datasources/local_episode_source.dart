import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/models/episode/episode.dart';
import '../parsers/episode_json_parser.dart';

/// Fuente de datos local para episodios
/// Lee archivos JSON desde los assets de la aplicación
class LocalEpisodeSource {
  final EpisodeJsonParser _parser;

  /// Path base de los assets de episodios
  static const String _baseAssetsPath = 'assets/episodes';

  LocalEpisodeSource({EpisodeJsonParser? parser})
    : _parser = parser ?? EpisodeJsonParser();

  /// Carga un episodio por su número
  ///
  /// [episodeNumber] - Número del episodio (1-30 para nivel A1)
  ///
  /// Returns: Episode si existe
  /// Throws: EpisodeLoadException si hay error al cargar
  Future<Episode> loadEpisodeByNumber(int episodeNumber) async {
    try {
      // Formato: episode_a1_01.json, episode_a1_02.json, etc.
      final fileName =
          'episode_a1_${episodeNumber.toString().padLeft(2, '0')}.json';
      final filePath = '$_baseAssetsPath/$fileName';

      final jsonString = await rootBundle.loadString(filePath);
      return _parser.parseFromString(jsonString);
    } on FlutterError catch (e) {
      throw EpisodeLoadException(
        'Episode $episodeNumber not found in assets: ${e.message}',
      );
    } catch (e) {
      throw EpisodeLoadException(
        'Error loading episode $episodeNumber: ${e.toString()}',
      );
    }
  }

  /// Carga un episodio por su ID
  ///
  /// [episodeId] - ID del episodio (ej: "ep_001")
  ///
  /// Returns: Episode si existe
  /// Throws: EpisodeLoadException si hay error al cargar
  Future<Episode> loadEpisodeById(String episodeId) async {
    // Extraer número del ID (ep_001 -> 1)
    final episodeNumber = _extractEpisodeNumberFromId(episodeId);
    return loadEpisodeByNumber(episodeNumber);
  }

  /// Carga todos los episodios disponibles
  ///
  /// [level] - Nivel de los episodios a cargar (default: "a1")
  /// [count] - Número de episodios a cargar (default: 30 para A1)
  ///
  /// Returns: Lista de episodios cargados
  Future<List<Episode>> loadAllEpisodes({
    String level = 'a1',
    int count = 30,
  }) async {
    final episodes = <Episode>[];
    final errors = <String>[];

    for (var i = 1; i <= count; i++) {
      try {
        final episode = await loadEpisodeByNumber(i);
        episodes.add(episode);
      } catch (e) {
        errors.add('Episode $i: ${e.toString()}');
      }
    }

    if (episodes.isEmpty && errors.isNotEmpty) {
      throw EpisodeLoadException(
        'Failed to load any episodes. Errors:\n${errors.join('\n')}',
      );
    }

    return episodes;
  }

  /// Verifica si un episodio está disponible localmente
  ///
  /// [episodeNumber] - Número del episodio a verificar
  ///
  /// Returns: true si existe, false si no
  Future<bool> isEpisodeAvailable(int episodeNumber) async {
    try {
      await loadEpisodeByNumber(episodeNumber);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Obtiene el conteo total de episodios disponibles
  ///
  /// Returns: Número de episodios disponibles
  Future<int> getTotalEpisodesCount() async {
    var count = 0;

    // Intentar cargar hasta encontrar el primero que falle
    for (var i = 1; i <= 100; i++) {
      final available = await isEpisodeAvailable(i);
      if (!available) break;
      count = i;
    }

    return count;
  }

  /// Carga episodios de un rango específico
  ///
  /// [startEpisode] - Episodio inicial (inclusive)
  /// [endEpisode] - Episodio final (inclusive)
  ///
  /// Returns: Lista de episodios en el rango
  Future<List<Episode>> loadEpisodeRange(
    int startEpisode,
    int endEpisode,
  ) async {
    final episodes = <Episode>[];

    for (var i = startEpisode; i <= endEpisode; i++) {
      try {
        final episode = await loadEpisodeByNumber(i);
        episodes.add(episode);
      } catch (e) {
        // Continuar con los siguientes episodios aunque uno falle
        continue;
      }
    }

    return episodes;
  }

  /// Pre-carga episodios en memoria (útil para mejorar performance)
  ///
  /// [episodeNumbers] - Lista de números de episodios a pre-cargar
  ///
  /// Returns: Map de episodeNumber -> Episode
  Future<Map<int, Episode>> preloadEpisodes(List<int> episodeNumbers) async {
    final episodesMap = <int, Episode>{};

    for (final number in episodeNumbers) {
      try {
        final episode = await loadEpisodeByNumber(number);
        episodesMap[number] = episode;
      } catch (e) {
        // Continuar con los siguientes
        continue;
      }
    }

    return episodesMap;
  }

  /// Extrae el número de episodio del ID
  ///
  /// [episodeId] - ID del episodio (ej: "ep_001")
  ///
  /// Returns: Número del episodio
  int _extractEpisodeNumberFromId(String episodeId) {
    // ep_001 -> 001 -> 1
    final match = RegExp(r'ep_(\d+)').firstMatch(episodeId);
    if (match == null) {
      throw EpisodeLoadException('Invalid episode ID format: $episodeId');
    }

    return int.parse(match.group(1)!);
  }
}

/// Excepción de carga de episodios
class EpisodeLoadException implements Exception {
  final String message;

  EpisodeLoadException(this.message);

  @override
  String toString() => 'EpisodeLoadException: $message';
}
