import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

class AvatarAssetResolver {
  static List<String> _assets = [];
  static bool _loaded = false;
  static final Map<String, String> _cache = {};

  static String? getCached(String key) => _cache[key];

  static Future<void> _ensureLoaded() async {
    if (_loaded) return;
    try {
      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      final assets = await manifest.listAssets();
      _assets = assets
          .where((key) => key.startsWith('assets/avatars/'))
          .toList()
        ..sort();
    } catch (_) {
      try {
        final manifestJson = await rootBundle.loadString('AssetManifest.json');
        final Map<String, dynamic> manifest = jsonDecode(manifestJson);
        _assets = manifest.keys
            .where((key) => key.startsWith('assets/avatars/'))
            .toList()
          ..sort();
      } catch (_) {
        _assets = [];
      }
    }
    _loaded = true;
  }

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
    if (_assets.isEmpty) return '';

    final baseName = _normalizeBaseName(
      avatarUrl.isNotEmpty ? avatarUrl : (fallbackName ?? ''),
    );
    if (baseName.isEmpty) return '';

    final candidates = _assets.where((path) {
      final file = path.split('/').last.toLowerCase();
      return file == '$baseName.png' || file.startsWith('${baseName}_');
    }).toList();
    if (candidates.isEmpty) return '';

    final selected = candidates[Random().nextInt(candidates.length)];
    if (key.isNotEmpty) {
      _cache[key] = selected;
    }
    return selected;
  }

  static String _normalizeBaseName(String value) {
    if (value.isEmpty) return '';
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
