import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/data/services/template_variable_service.dart';

/// Provider for template variable service
/// Manages dynamic text variables like {player_name}, {boss_name}, etc.
final templateVariableServiceProvider = Provider<TemplateVariableService>((ref) {
  return TemplateVariableService();
});

/// Provider de versión que se incrementa cuando cambian las variables.
/// Los widgets que necesitan reaccionar a cambios deben hacer `ref.watch(templateVersionProvider)`.
final templateVersionProvider = StateProvider<int>((ref) => 0);

/// Función helper para invalidar/refrescar el template en todos los widgets
void invalidateTemplateVersion(WidgetRef ref) {
  ref.read(templateVersionProvider.notifier).state++;
}

/// Provider for player name
/// Allows listening and updating the player's name
final playerNameProvider = StateProvider<String>((ref) {
  final service = ref.watch(templateVariableServiceProvider);
  return service.getVariable('player_name');
});

/// Provider para ciudad
final cityProvider = StateProvider<String>((ref) {
  final service = ref.watch(templateVariableServiceProvider);
  return service.getVariable('city');
});

/// Provider para nombre de compañía
final companyNameProvider = StateProvider<String>((ref) {
  final service = ref.watch(templateVariableServiceProvider);
  return service.getVariable('company_name');
});

/// Provider para tipo de oficina
final officeTypeProvider = StateProvider<String>((ref) {
  final service = ref.watch(templateVariableServiceProvider);
  return service.getVariable('office_type');
});
