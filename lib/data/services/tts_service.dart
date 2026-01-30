import 'dart:ui' show VoidCallback;

import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;
  String _language = 'en-US';
  // Valores base para Android (0.0-1.0 donde 0.5 es normal)
  double _speechRate = 0.35;
  double _pitch = 1.0;
  List<Map<String, String>> _voices = [];
  VoidCallback? _onComplete;

  bool get _isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  // En web, los valores se interpretan diferente:
  // - rate: 0.1-10 donde 1.0 es normal
  // - pitch: 0-2 donde 1.0 es normal
  double get _effectiveSpeechRate {
    if (kIsWeb) {
      // Web: usar 1.0 como velocidad normal (ignorar el valor de Android)
      return 1.0;
    }
    return _speechRate;
  }

  double get _effectivePitch {
    if (kIsWeb) {
      return 1.0;
    }
    return _pitch;
  }

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

    // En web, siempre forzar rate y pitch antes de hablar
    if (kIsWeb) {
      // ignore: avoid_print
      print('TTS Web: setting rate=1.0, pitch=1.0, text="$value"');
      await _tts.setSpeechRate(1.0);
      await _tts.setPitch(1.0);

      // Seleccionar voz natural en web según género
      if (_voices.isNotEmpty) {
        final selectedVoice = _selectWebVoice(voiceGender, voiceIdHint);
        // ignore: avoid_print
        print('TTS Web: selecting voice: $selectedVoice (gender=$voiceGender)');
        await _tts.setVoice(selectedVoice);
      } else {
        // ignore: avoid_print
        print('TTS Web: no voices loaded, using default');
      }
      // ignore: avoid_print
      print('TTS Web: rate and pitch set');
    } else {
      if (pitch != null && pitch > 0) {
        _pitch = pitch.clamp(0.5, 2.0);
        await _tts.setPitch(_pitch);
      }
      if (rate != null && rate > 0) {
        _speechRate = rate.clamp(0.2, 0.8);
        await _tts.setSpeechRate(_speechRate);
      }
    }

    if (voiceGender != null && !kIsWeb) {
      await _setVoiceByGender(voiceGender);
    }
    if (voiceIdHint != null && voiceIdHint.trim().isNotEmpty && !kIsWeb) {
      await _setVoiceByHint(voiceIdHint);
    }
    await _tts.stop();
    // ignore: avoid_print
    print('TTS: calling speak("$value") kIsWeb=$kIsWeb');
    await _tts.speak(value);
    // ignore: avoid_print
    print('TTS: speak called');
  }

  Future<void> setDefaultRate(double rate) async {
    _speechRate = rate.clamp(0.2, 0.8);
    if (_initialized) {
      await _tts.setSpeechRate(_effectiveSpeechRate);
    }
  }

  double get defaultRate => _speechRate;

  Future<void> stop() async {
    _onComplete = null;
    await _tts.stop();
  }

  void setCompletionHandler(VoidCallback? handler) {
    _onComplete = handler;
  }

  Future<void> _ensureConfig() async {
    if (_initialized) return;
    // ignore: avoid_print
    print('TTS: initializing... kIsWeb=$kIsWeb');
    if (_isAndroid) {
      try {
        await _tts.setEngine('com.google.android.tts');
      } catch (_) {}
    }
    await _tts.setLanguage(_language);
    // ignore: avoid_print
    print('TTS: language set to $_language');
    // ignore: avoid_print
    print('TTS: setting speechRate=$_effectiveSpeechRate pitch=$_effectivePitch');
    await _tts.setSpeechRate(_effectiveSpeechRate);
    await _tts.setPitch(_effectivePitch);
    await _loadVoices();
    _tts.setCompletionHandler(() {
      _onComplete?.call();
    });
    _initialized = true;
    // ignore: avoid_print
    print('TTS: initialized');
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
        if (kIsWeb) {
          // En web mostrar todas las voces disponibles
          for (final v in _voices) {
            // ignore: avoid_print
            print('TTS Web voice: $v');
          }
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

  /// Selecciona una voz natural para web según género
  Map<String, String> _selectWebVoice(String? gender, String? voiceIdHint) {
    // Voces de Google son las más naturales
    const googleFemale = ['google us english', 'google uk english female'];
    const googleMale = ['google uk english male'];
    // Voces de sistema como fallback
    const systemFemale = ['samantha', 'karen', 'victoria', 'allison', 'ava', 'susan', 'zoe', 'flo', 'shelley', 'sandy'];
    const systemMale = ['daniel', 'alex', 'tom', 'fred', 'ralph', 'reed', 'rocko'];
    const noveltyVoices = ['albert', 'bad news', 'bahh', 'bells', 'boing', 'bubbles', 'cellos', 'good news', 'hysterical', 'jester', 'organ', 'superstar', 'trinoids', 'whisper', 'zarvox', 'wobble', 'junior', 'kathy', 'grandma', 'grandpa', 'eddy'];

    // Detectar género del hint o parámetro
    final hint = (voiceIdHint ?? '').toLowerCase();
    final isMale = (gender?.toLowerCase().contains('male') == true && !gender!.toLowerCase().contains('female')) ||
        hint.contains('male') && !hint.contains('female');
    final isFemale = gender?.toLowerCase().contains('female') == true ||
        hint.contains('female');

    List<String> preferredVoices;
    if (isMale) {
      preferredVoices = [...googleMale, ...systemMale];
    } else if (isFemale) {
      preferredVoices = [...googleFemale, ...systemFemale];
    } else {
      // Por defecto usar femenina (Google US English)
      preferredVoices = [...googleFemale, ...googleMale, ...systemFemale, ...systemMale];
    }

    // Buscar en todas las voces (no solo en-US para incluir Google UK)
    for (final voiceName in preferredVoices) {
      final match = _voices.where(
        (v) => (v['name'] ?? '').toLowerCase().contains(voiceName),
      ).firstOrNull;
      if (match != null) {
        return match;
      }
    }

    // Fallback: cualquier voz que no sea novelty
    final nonNovelty = _voices.where((v) {
      final name = (v['name'] ?? '').toLowerCase();
      return !noveltyVoices.any((n) => name.contains(n));
    }).firstOrNull;

    return nonNovelty ?? _voices.first;
  }

  Future<void> dispose() async {
    await _tts.stop();
  }
}
