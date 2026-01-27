import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/data/services/template_variable_service.dart';

/// Provider for template variable service
/// Manages dynamic text variables like {player_name}, {boss_name}, etc.
final templateVariableServiceProvider = Provider<TemplateVariableService>((ref) {
  return TemplateVariableService();
});

/// Provider for player name
/// Allows listening and updating the player's name
final playerNameProvider = StateProvider<String>((ref) {
  final service = ref.watch(templateVariableServiceProvider);
  return service.getVariable('player_name');
});
