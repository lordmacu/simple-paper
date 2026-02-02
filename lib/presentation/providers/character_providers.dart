import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/character_repository_impl.dart';
import '../../domain/repositories/i_character_repository.dart';
import '../../domain/models/character/unlocked_character.dart';

/// Provider para SharedPreferences (si no existe ya)
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden');
});

/// Provider para el repositorio de personajes
final characterRepositoryProvider = Provider<ICharacterRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return CharacterRepositoryImpl(prefs);
});

/// Provider para obtener la lista de personajes desbloqueados
final unlockedCharactersProvider = FutureProvider<List<UnlockedCharacter>>((ref) async {
  final repository = ref.watch(characterRepositoryProvider);
  return repository.getUnlockedCharacters();
});

/// Provider para verificar si un personaje específico está desbloqueado
final isCharacterUnlockedProvider = FutureProvider.family<bool, String>((ref, characterId) async {
  final repository = ref.watch(characterRepositoryProvider);
  return repository.isCharacterUnlocked(characterId);
});
