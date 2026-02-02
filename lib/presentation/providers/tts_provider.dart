import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/data/services/tts_service.dart';

/// Provider del servicio de Text-to-Speech.
final ttsServiceProvider = Provider<TtsService>((ref) {
  final service = TtsService();
  ref.onDispose(service.dispose);
  return service;
});
