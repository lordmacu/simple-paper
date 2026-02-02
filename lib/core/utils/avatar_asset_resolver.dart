import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

/// Resuelve rutas de assets de avatares.
///
/// Busca y cachea assets de avatares del bundle de la app.
class AvatarAssetResolver {
  static List<String> _assets = [];
  static bool _loaded = false;
  static final Map<String, String> _cache = {};

  /// Obtiene un avatar cacheado por clave.
  static String? getCached(String key) => _cache[key];

  /// Carga los assets de avatares si no están cargados.
  static Future<void> _ensureLoaded() async {
    if (_loaded) {
      return;
    }
    try {
      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      final assets = manifest.listAssets();
      _assets = assets
          .where((key) => key.startsWith('assets/avatars/'))
          .toList()
        ..sort();
    } on Exception catch (_) {
      try {
        final manifestJson = await rootBundle.loadString('AssetManifest.json');
        final Map<String, dynamic> manifest = jsonDecode(manifestJson);
        _assets = manifest.keys
            .where((key) => key.startsWith('assets/avatars/'))
            .toList()
          ..sort();
      } on Exception catch (_) {
        _assets = [];
      }
    }
    _loaded = true;
  }

  /// Resuelve la ruta del asset de avatar.
  ///
  /// Busca un avatar que coincida con [avatarUrl] o [fallbackName].
  static Future<String> resolve({
    required String avatarUrl,
    String? fallbackName,
    String? cacheKey,
  }) async {
    final key = cacheKey ?? '';
    if (key.isNotEmpty && _cache.containsKey(key)) {
      return _cache[key]!;
    }
    await _ensureLoaded();
    if (_assets.isEmpty) {
      return '';
    }

    final baseName = _normalizeBaseName(
      avatarUrl.isNotEmpty ? avatarUrl : (fallbackName ?? ''),
    );
    if (baseName.isEmpty) {
      return '';
    }

    final candidates = _assets.where((path) {
      final file = path.split('/').last.toLowerCase();
      return file == '$baseName.png' || file.startsWith('${baseName}_');
    }).toList();
    if (candidates.isEmpty) {
      return '';
    }

    final selected = candidates[Random().nextInt(candidates.length)];
    if (key.isNotEmpty) {
      _cache[key] = selected;
    }
    return selected;
  }

  static String _normalizeBaseName(String value) {
    if (value.isEmpty) {
      return '';
    }
    var path = value.trim().toLowerCase();
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    if (path.startsWith('avatars/')) {
      path = path.substring('avatars/'.length);
    }
    if (path.endsWith('.png')) {
      path = path.substring(0, path.length - 4);
    }
    return path.replaceAll(RegExp(r'[^a-z0-9_]'), '');
  }
}
