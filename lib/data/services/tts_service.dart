import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;
  String _language = 'en-US';
  double _speechRate = 0.35;

  Future<void> speak(
    String text, {
    bool toLowerCase = true,
  }) async {
    final value = toLowerCase ? text.toLowerCase() : text;
    if (value.trim().isEmpty) return;
    await _ensureConfig();
    await _tts.stop();
    await _tts.speak(value);
  }

  Future<void> stop() async {
    await _tts.stop();
  }

  Future<void> _ensureConfig() async {
    if (_initialized) return;
    await _tts.setLanguage(_language);
    await _tts.setSpeechRate(_speechRate);
    _initialized = true;
  }

  Future<void> dispose() async {
    await _tts.stop();
  }
}
