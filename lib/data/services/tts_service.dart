import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;
  String _language = 'en-US';
  double _speechRate = 0.35;
  double _pitch = 1.0;
  List<Map<String, String>> _voices = [];

  Future<void> speak(
    String text, {
    bool toLowerCase = true,
    double? pitch,
    double? rate,
    String? voiceGender,
    String? voiceIdHint,
  }) async {
    final value = toLowerCase ? text.toLowerCase() : text;
    if (value.trim().isEmpty) return;
    await _ensureConfig();
    if (pitch != null && pitch > 0) {
      _pitch = pitch.clamp(0.5, 2.0);
      await _tts.setPitch(_pitch);
    }
    if (rate != null && rate > 0) {
      _speechRate = rate.clamp(0.2, 0.8);
      await _tts.setSpeechRate(_speechRate);
    }
    if (voiceGender != null) {
      await _setVoiceByGender(voiceGender);
    }
    if (voiceIdHint != null && voiceIdHint.trim().isNotEmpty) {
      await _setVoiceByHint(voiceIdHint);
    }
    await _tts.stop();
    await _tts.speak(value);
  }

  Future<void> stop() async {
    await _tts.stop();
  }

  Future<void> _ensureConfig() async {
    if (_initialized) return;
    if (Platform.isAndroid) {
      try {
        await _tts.setEngine('com.google.android.tts');
      } catch (_) {}
    }
    await _tts.setLanguage(_language);
    await _tts.setSpeechRate(_speechRate);
    await _tts.setPitch(_pitch);
    await _loadVoices();
    _initialized = true;
  }

  Future<void> _loadVoices() async {
    try {
      final list = await _tts.getVoices;
      if (list is List) {
        _voices = list
            .whereType<Map>()
            .map((v) => v.map((k, v) => MapEntry(k.toString(), v.toString())))
            .where((v) => (v['locale'] ?? '').startsWith('en'))
            .toList();
        // ignore: avoid_print
        print('TTS available voices: ${_voices.length}');
        for (final v in _voices) {
          // ignore: avoid_print
          print('TTS voice: $v');
        }
      }
    } catch (_) {
      _voices = [];
    }
  }

  Future<void> _setVoiceByGender(String gender) async {
    if (_voices.isEmpty) {
      await _loadVoices();
    }
    if (_voices.isEmpty) return;
    final match = _pickVoiceByGender(gender);
    if (match == null) return;
    // ignore: avoid_print
    print('TTS selected voice ($gender): $match');
    await _tts.setVoice(match);
  }

  Future<void> _setVoiceByHint(String hint) async {
    if (_voices.isEmpty) {
      await _loadVoices();
    }
    if (_voices.isEmpty) return;
    final normalized = hint.toLowerCase().replaceAll(RegExp(r'[^a-z0-9_]'), '');
    final pool = _voices
            .where((v) => (v['locale'] ?? '').startsWith('en-US'))
            .toList()
            .isNotEmpty
        ? _voices
            .where((v) => (v['locale'] ?? '').startsWith('en-US'))
            .toList()
        : _voices;

    if (RegExp(r'(^|_)female(_|$)').hasMatch(normalized)) {
      final female = _firstByNameContains(pool, _femaleVoiceTokens) ??
          _pickVoiceByGender('female');
      if (female != null) {
        // ignore: avoid_print
        print('TTS selected voice (hint=$hint): $female');
        await _tts.setVoice(female);
        return;
      }
    }
    if (RegExp(r'(^|_)male(_|$)').hasMatch(normalized)) {
      final male = _firstByNameContains(pool, _maleVoiceTokens) ??
          _pickVoiceByGender('male');
      if (male != null) {
        // ignore: avoid_print
        print('TTS selected voice (hint=$hint): $male');
        await _tts.setVoice(male);
        return;
      }
    }
    final h = normalized.replaceAll('_', '');
    final match = _voices.firstWhere(
      (v) {
        final name = (v['name'] ?? '')
            .toLowerCase()
            .replaceAll(RegExp(r'[^a-z0-9]'), '');
        final locale = (v['locale'] ?? '')
            .toLowerCase()
            .replaceAll(RegExp(r'[^a-z0-9]'), '');
        return name.contains(h) || locale.contains(h);
      },
      orElse: () => _voices.first,
    );
    // ignore: avoid_print
    print('TTS selected voice (hint=$hint): $match');
    await _tts.setVoice(match);
  }

  Map<String, String>? _pickVoiceByGender(String gender) {
    final g = gender.toLowerCase();
    final enUs = _voices
        .where((v) => (v['locale'] ?? '').startsWith('en-US'))
        .toList();
    final pool = enUs.isNotEmpty ? enUs : _voices;
    if (pool.isEmpty) return null;

    if (g.contains('male')) {
      return _firstByNameContains(pool, _maleVoiceTokens) ?? pool.first;
    }
    if (g.contains('female')) {
      final direct = _firstByNameContains(pool, _femaleVoiceTokens);
      if (direct != null) return direct;
      final filtered = pool.where((v) {
        final name = (v['name'] ?? '').toLowerCase();
        return !_maleVoiceTokens.any((t) => name.contains(t));
      }).toList();
      return filtered.isNotEmpty ? filtered.first : pool.first;
    }
    return pool.first;
  }

  Map<String, String>? _firstByNameContains(
    List<Map<String, String>> voices,
    List<String> tokens,
  ) {
    for (final token in tokens) {
      final match = voices.firstWhere(
        (v) => (v['name'] ?? '').toLowerCase().contains(token),
        orElse: () => const {},
      );
      if (match.isNotEmpty) return match;
    }
    return null;
  }

  static const List<String> _maleVoiceTokens = [
    'iom',
    'iob',
    'iog',
    'msm',
  ];

  static const List<String> _femaleVoiceTokens = [
    'sfg',
    'iol',
  ];

  Future<void> dispose() async {
    await _tts.stop();
  }
}
