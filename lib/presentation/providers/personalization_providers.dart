import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/personalization_repository.dart';
import '../../data/services/template_variable_service.dart';
import 'progress_providers.dart' as progress;
import 'template_variable_provider.dart';
import 'character_providers.dart' as characters;
import 'tts_provider.dart';

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

/// Indica si el nombre del jugador ya está guardado
final hasPlayerNameProvider = FutureProvider<bool>((ref) async {
  final repo = ref.watch(personalizationRepositoryProvider);
  final saved = await repo.loadVariables();
  final name = saved['player_name'];
  return name != null && name.trim().isNotEmpty;
});

/// Inicializa TemplateVariableService con valores guardados (se ejecuta y olvida). 
final personalizationInitProvider = FutureProvider<void>((ref) async {
  final repo = ref.watch(personalizationRepositoryProvider);
  final saved = await repo.loadVariables();
  if (saved.isNotEmpty) {
    ref.read(templateVariableServiceProvider).updateAll(saved);
    // Sincroniza providers de personalización
    final service = ref.read(templateVariableServiceProvider);
    ref.read(playerNameProvider.notifier).state =
        service.getVariable('player_name');
    ref.read(cityProvider.notifier).state = service.getVariable('city');
    ref.read(companyNameProvider.notifier).state =
        service.getVariable('company_name');
    ref.read(officeTypeProvider.notifier).state =
        service.getVariable('office_type');
    final rateValue = saved['tts_rate'];
    if (rateValue != null) {
      final parsed = double.tryParse(rateValue);
      if (parsed != null) {
        await ref.read(ttsServiceProvider).setDefaultRate(parsed);
      }
    }
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
    // Invalidar versión para forzar reconstrucción de widgets
    ref.read(templateVersionProvider.notifier).state++;
  };
});

/// Acción para actualizar la ciudad y persistirla
final setCityProvider = Provider<Future<void> Function(String)>((ref) {
  return (String city) async {
    final repo = ref.read(personalizationRepositoryProvider);
    ref.read(templateVariableServiceProvider).updateVariable('city', city);
    ref.read(cityProvider.notifier).state = city;
    await repo.setVariable('city', city);
    // Invalidar versión para forzar reconstrucción de widgets
    final newVersion = ref.read(templateVersionProvider.notifier).state + 1;
    ref.read(templateVersionProvider.notifier).state = newVersion;
    debugPrint('TEMPLATE_DEBUG setCityProvider city=$city newVersion=$newVersion');
  };
});

/// Actualiza nombre de compañía
final setCompanyNameProvider = Provider<Future<void> Function(String)>((ref) {
  return (String name) async {
    final repo = ref.read(personalizationRepositoryProvider);
    ref.read(templateVariableServiceProvider).updateVariable('company_name', name);
    ref.read(companyNameProvider.notifier).state = name;
    await repo.setVariable('company_name', name);
    // Invalidar versión para forzar reconstrucción de widgets
    final newVersion = ref.read(templateVersionProvider.notifier).state + 1;
    ref.read(templateVersionProvider.notifier).state = newVersion;
    debugPrint('TEMPLATE_DEBUG setCompanyNameProvider name=$name newVersion=$newVersion');
  };
});

/// Actualiza tipo de oficina
final setOfficeTypeProvider = Provider<Future<void> Function(String)>((ref) {
  return (String type) async {
    final repo = ref.read(personalizationRepositoryProvider);
    ref.read(templateVariableServiceProvider).updateVariable('office_type', type);
    ref.read(officeTypeProvider.notifier).state = type;
    await repo.setVariable('office_type', type);
    // Invalidar versión para forzar reconstrucción de widgets
    final newVersion = ref.read(templateVersionProvider.notifier).state + 1;
    ref.read(templateVersionProvider.notifier).state = newVersion;
    debugPrint('TEMPLATE_DEBUG setOfficeTypeProvider type=$type newVersion=$newVersion');
  };
});

/// Actualiza velocidad del TTS
final setTtsRateProvider = Provider<Future<void> Function(double)>((ref) {
  return (double rate) async {
    final repo = ref.read(personalizationRepositoryProvider);
    await repo.setVariable('tts_rate', rate.toStringAsFixed(2));
    await ref.read(ttsServiceProvider).setDefaultRate(rate);
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
      // Invalidar versión para forzar reconstrucción de widgets
      ref.read(templateVersionProvider.notifier).state++;
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
