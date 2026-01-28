import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/personalization_repository.dart';
import '../../data/services/template_variable_service.dart';
import 'progress_providers.dart' as progress;
import 'template_variable_provider.dart';
import 'character_providers.dart' as characters;

/// Repositorio de personalización (usa SharedPreferences)
final personalizationRepositoryProvider =
    Provider<PersonalizationRepository>((ref) {
  final prefsAsync = ref.watch(progress.sharedPreferencesProvider);
  return prefsAsync.when(
    data: (prefs) => PersonalizationRepository(prefs),
    loading: () => throw Exception('SharedPreferences not ready'),
    error: (err, stack) => throw Exception('Error loading SharedPreferences: $err'),
  );
});

/// Inicializa TemplateVariableService con valores guardados (se ejecuta y olvida). 
final personalizationInitProvider = FutureProvider<void>((ref) async {
  final repo = ref.watch(personalizationRepositoryProvider);
  final saved = await repo.loadVariables();
  if (saved.isNotEmpty) {
    ref.read(templateVariableServiceProvider).updateAll(saved);
    // Sincroniza provider del nombre
    final name = ref.read(templateVariableServiceProvider).getVariable('player_name');
    ref.read(playerNameProvider.notifier).state = name;
  }
});

/// Acción para actualizar el nombre del jugador y persistirlo
final setPlayerNameProvider =
    Provider<Future<void> Function(String)>((ref) {
  return (String name) async {
    final repo = ref.read(personalizationRepositoryProvider);
    ref.read(templateVariableServiceProvider).updateVariable('player_name', name);
    ref.read(playerNameProvider.notifier).state = name;
    await repo.setVariable('player_name', name);
  };
});

/// Acción para actualizar la ciudad y persistirla
final setCityProvider = Provider<Future<void> Function(String)>((ref) {
  return (String city) async {
    final repo = ref.read(personalizationRepositoryProvider);
    ref.read(templateVariableServiceProvider).updateVariable('city', city);
    await repo.setVariable('city', city);
  };
});

/// Actualiza nombre de compañía
final setCompanyNameProvider = Provider<Future<void> Function(String)>((ref) {
  return (String name) async {
    final repo = ref.read(personalizationRepositoryProvider);
    ref.read(templateVariableServiceProvider).updateVariable('company_name', name);
    await repo.setVariable('company_name', name);
  };
});

/// Actualiza tipo de oficina
final setOfficeTypeProvider = Provider<Future<void> Function(String)>((ref) {
  return (String type) async {
    final repo = ref.read(personalizationRepositoryProvider);
    ref.read(templateVariableServiceProvider).updateVariable('office_type', type);
    await repo.setVariable('office_type', type);
  };
});

/// Renombrar personaje desbloqueado y actualizar template vars
final renameCharacterProvider =
    Provider<Future<void> Function({required String characterId, required String defaultName, required String newName})>((ref) {
  return ({
    required String characterId,
    required String defaultName,
    required String newName,
  }) async {
    final charRepo = ref.read(characters.characterRepositoryProvider);
    await charRepo.updateCharacterName(characterId, newName);

    // Actualizar template variable si existe clave conocida
    final key = _templateKeyForCharacter(characterId);
    if (key != null) {
      ref.read(templateVariableServiceProvider).updateVariable(key, newName);
      final repo = ref.read(personalizationRepositoryProvider);
      await repo.setVariable(key, newName);
    }
  };
});

String? _templateKeyForCharacter(String characterId) {
  switch (characterId) {
    case 'char_boss':
      return 'boss_name';
    case 'char_jim':
      return 'jim_name';
    case 'char_pam':
      return 'pam_name';
    case 'char_dwight':
      return 'dwight_name';
    default:
      return null;
  }
}
