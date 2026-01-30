import 'dart:convert';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter/services.dart' show rootBundle, AssetManifest;
import '../sources/content_db.dart';

class ContentImportResult {
  final int episodesImported;
  final int episodeFailures;
  final int interviewsImported;
  final int interviewFailures;

  const ContentImportResult({
    required this.episodesImported,
    required this.episodeFailures,
    required this.interviewsImported,
    required this.interviewFailures,
  });
}

class ContentImportService {
  ContentImportService({ContentDb? db}) : _db = db ?? ContentDb();

  final ContentDb _db;
  static const Map<String, String> _genderByName = {
    'MICHAEL': 'male',
    'BOSS': 'male',
    'JIM': 'male',
    'PAM': 'female',
    'DWIGHT': 'male',
    'STANLEY': 'male',
    'ANGELA': 'female',
    'KEVIN': 'male',
    'RYAN': 'male',
    'ANDY': 'male',
    'OSCAR': 'male',
    'MEREDITH': 'female',
    'PHYLLIS': 'female',
    'TOBY': 'male',
    'CREED': 'male',
  };

  Future<ContentImportResult> importAll() async {
    debugPrint('CONTENT_IMPORT start');
    await _db.clearContentTables();
    await _db.clearLanguageTables();
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final assets = manifest.listAssets();

    debugPrint('CONTENT_IMPORT assets_total=${assets.length}');
    for (final asset in assets) {
      debugPrint('CONTENT_IMPORT asset $asset');
    }

    final episodeAssets = assets
        .where((key) => key.startsWith('assets/episodes/') && key.endsWith('.json'))
        .toList()
      ..sort();
    final interviewAssets = assets
        .where(
          (key) =>
              key.startsWith('assets/characters/') &&
              key.endsWith('_interview.json'),
        )
        .toList()
      ..sort();

    debugPrint(
      'CONTENT_IMPORT characters found=${interviewAssets.length}',
    );
    for (final asset in interviewAssets) {
      debugPrint('CONTENT_IMPORT interview_asset $asset');
    }

    final episodeEntries = <EpisodeDbEntry>[];
    var episodeFailures = 0;

    for (final path in episodeAssets) {
      try {
        final jsonString = await rootBundle.loadString(path);
        final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
        final meta =
            (decoded['episode_metadata'] as Map<String, dynamic>?) ?? {};
        final episodeNumber = _episodeNumberFromMeta(meta, path);
        final level = _levelFromMeta(meta);
        final episodeId = _episodeIdFromMeta(meta, episodeNumber, level);

        episodeEntries.add(
          EpisodeDbEntry(
            episodeId: episodeId,
            episodeNumber: episodeNumber,
            level: level,
            json: jsonString,
          ),
        );
      } catch (_) {
        episodeFailures++;
      }
    }

    final interviewEntries = <InterviewDbEntry>[];
    var interviewFailures = 0;

    for (final path in interviewAssets) {
      final parsed = _parseInterviewPath(path);
      if (parsed == null) {
        interviewFailures++;
        continue;
      }
      final episodeNumber = parsed.episodeNumber;
      final characterId = parsed.characterId;
      final interviewId = parsed.interviewId;

      try {
        final rawJson = await rootBundle.loadString(path);
        final jsonString = _ensureCharacterGender(rawJson);
        interviewEntries.add(
          InterviewDbEntry(
            episodeNumber: episodeNumber,
            characterId: characterId,
            interviewId: interviewId,
            json: jsonString,
          ),
        );
      } catch (_) {
        interviewFailures++;
      }
    }

    await _db.upsertEpisodes(episodeEntries);
    await _db.upsertInterviews(interviewEntries);

    await _importLanguageLists();

    final result = ContentImportResult(
      episodesImported: episodeEntries.length,
      episodeFailures: episodeFailures,
      interviewsImported: interviewEntries.length,
      interviewFailures: interviewFailures,
    );
    debugPrint(
      'CONTENT_IMPORT done episodes=${result.episodesImported} '
      'interviews=${result.interviewsImported} '
      'episodeFailures=${result.episodeFailures} '
      'interviewFailures=${result.interviewFailures}',
    );
    return result;
  }

  Future<void> _importLanguageLists() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/language/a1_language_lists.json');
      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;

      final irregular =
          (decoded['irregular_verbs'] as List<dynamic>? ?? const [])
              .whereType<Map<String, dynamic>>()
              .toList();
      final countries =
          (decoded['countries_nationalities_languages'] as List<dynamic>? ??
                  const [])
              .whereType<Map<String, dynamic>>()
              .toList();
      final cities = (decoded['cities'] as List<dynamic>? ?? const [])
          .whereType<String>()
          .toList();
      final comparatives =
          (decoded['comparative_adjectives'] as List<dynamic>? ?? const [])
              .whereType<Map<String, dynamic>>()
              .toList();

      await _db.insertIrregularVerbs(irregular);
      await _db.insertCountries(countries);
      await _db.insertCities(cities);
      await _db.insertComparatives(comparatives);
    } catch (e) {
      debugPrint('CONTENT_IMPORT language_lists_fail error=$e');
    }
  }

  int _episodeNumberFromMeta(Map<String, dynamic> meta, String path) {
    final number = meta['episode_number'];
    if (number is int) return number;
    final match = RegExp(r'episode_a1_(\d{2})\.json$').firstMatch(path);
    if (match != null) {
      final parsed = int.tryParse(match.group(1) ?? '');
      if (parsed != null) return parsed;
    }
    return 0;
  }

  String _levelFromMeta(Map<String, dynamic> meta) {
    final level = meta['internal_level'] ?? meta['level'];
    if (level is String && level.isNotEmpty) {
      return level.toUpperCase();
    }
    return 'A1';
  }

  String _episodeIdFromMeta(
    Map<String, dynamic> meta,
    int episodeNumber,
    String level,
  ) {
    final id = meta['episode_id'];
    if (id is String && id.isNotEmpty) {
      return id;
    }
    final suffix = episodeNumber.toString().padLeft(3, '0');
    final levelKey = level.toLowerCase();
    return 'ep_${levelKey}_$suffix';
  }

  String _ensureCharacterGender(String jsonString) {
    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is! Map<String, dynamic>) return jsonString;
      final interview = decoded['character_interview'];
      if (interview is! Map<String, dynamic>) return jsonString;
      if (interview['character_gender'] is String &&
          (interview['character_gender'] as String).isNotEmpty) {
        return jsonString;
      }
      final name = (interview['character_name'] ?? '').toString().trim();
      if (name.isEmpty) return jsonString;
      final gender = _genderByName[name.toUpperCase()];
      if (gender == null) return jsonString;
      interview['character_gender'] = gender;
      return jsonEncode(decoded);
    } catch (_) {
      return jsonString;
    }
  }

  _InterviewPathInfo? _parseInterviewPath(String path) {
    final interviewId = _basenameWithoutExtension(path);
    final episodeMatch = RegExp(r'episode_a1_(\d{2})').firstMatch(path);
    final episodeNumber = int.tryParse(episodeMatch?.group(1) ?? '');
    if (episodeNumber == null) return null;

    final base = interviewId;
    final charFromEpisodePrefix =
        RegExp(r'episode_a1_\d{2}_([a-z0-9_]+?)_interview')
            .firstMatch(base);
    if (charFromEpisodePrefix != null) {
      final characterId = charFromEpisodePrefix.group(1) ?? '';
      if (characterId.isNotEmpty) {
        return _InterviewPathInfo(
          episodeNumber: episodeNumber,
          characterId: characterId,
          interviewId: interviewId,
        );
      }
    }

    final charFromSimple =
        RegExp(r'([a-z0-9_]+?)_interview').firstMatch(base);
    if (charFromSimple != null) {
      final characterId = charFromSimple.group(1) ?? '';
      if (characterId.isNotEmpty) {
        return _InterviewPathInfo(
          episodeNumber: episodeNumber,
          characterId: characterId,
          interviewId: interviewId,
        );
      }
    }

    return null;
  }
}

class _InterviewPathInfo {
  final int episodeNumber;
  final String characterId;
  final String interviewId;

  const _InterviewPathInfo({
    required this.episodeNumber,
    required this.characterId,
    required this.interviewId,
  });
}

String _basenameWithoutExtension(String path) {
  final file = path.split('/').last;
  final dot = file.lastIndexOf('.');
  return dot == -1 ? file : file.substring(0, dot);
}
