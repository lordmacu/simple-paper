import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/character/unlocked_character.dart';
import '../../domain/repositories/i_character_repository.dart';

/// Implementación del repositorio de personajes usando SharedPreferences
class CharacterRepositoryImpl implements ICharacterRepository {
  static const String _unlockedCharactersKey = 'unlocked_characters';
  final SharedPreferences _prefs;

  CharacterRepositoryImpl(this._prefs);

  @override
  Future<List<UnlockedCharacter>> getUnlockedCharacters() async {
    try {
      final String? jsonString = _prefs.getString(_unlockedCharactersKey);
      
      if (jsonString == null || jsonString.isEmpty) {
        return [];
      }

      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((json) => UnlockedCharacter.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error loading unlocked characters: $e');
      return [];
    }
  }

  @override
  Future<void> unlockCharacter(UnlockedCharacter character) async {
    try {
      final characters = await getUnlockedCharacters();
      
      // Verificar si ya está desbloqueado
      final existingIndex = characters.indexWhere(
        (c) => c.characterId == character.characterId,
      );
      
      if (existingIndex >= 0) {
        // Ya existe, actualizar
        characters[existingIndex] = character;
      } else {
        // Agregar nuevo
        characters.add(character);
      }
      
      await _saveCharacters(characters);
    } catch (e) {
      print('Error unlocking character: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateCharacterName(String characterId, String customName) async {
    try {
      final characters = await getUnlockedCharacters();
      
      final index = characters.indexWhere((c) => c.characterId == characterId);
      
      if (index >= 0) {
        // Actualizar con nombre personalizado
        characters[index] = characters[index].copyWith(customName: customName);
        await _saveCharacters(characters);
      }
    } catch (e) {
      print('Error updating character name: $e');
      rethrow;
    }
  }

  @override
  Future<bool> isCharacterUnlocked(String characterId) async {
    try {
      final characters = await getUnlockedCharacters();
      return characters.any((c) => c.characterId == characterId);
    } catch (e) {
      print('Error checking if character is unlocked: $e');
      return false;
    }
  }

  @override
  Future<UnlockedCharacter?> getUnlockedCharacter(String characterId) async {
    try {
      final characters = await getUnlockedCharacters();
      final index = characters.indexWhere((c) => c.characterId == characterId);
      return index >= 0 ? characters[index] : null;
    } catch (e) {
      print('Error getting unlocked character: $e');
      return null;
    }
  }

  @override
  Future<void> clearAllUnlockedCharacters() async {
    try {
      await _prefs.remove(_unlockedCharactersKey);
    } catch (e) {
      print('Error clearing unlocked characters: $e');
      rethrow;
    }
  }

  /// Guarda la lista de personajes en SharedPreferences
  Future<void> _saveCharacters(List<UnlockedCharacter> characters) async {
    try {
      final jsonList = characters.map((c) => c.toJson()).toList();
      final jsonString = jsonEncode(jsonList);
      await _prefs.setString(_unlockedCharactersKey, jsonString);
    } catch (e) {
      print('Error saving characters: $e');
      rethrow;
    }
  }
}
