import '../models/character/unlocked_character.dart';

/// Repository interface para manejar personajes desbloqueados
abstract class ICharacterRepository {
  /// Obtiene todos los personajes desbloqueados
  Future<List<UnlockedCharacter>> getUnlockedCharacters();
  
  /// Guarda un personaje como desbloqueado
  Future<void> unlockCharacter(UnlockedCharacter character);
  
  /// Actualiza el nombre personalizado de un personaje
  Future<void> updateCharacterName(String characterId, String customName);
  
  /// Verifica si un personaje está desbloqueado
  Future<bool> isCharacterUnlocked(String characterId);
  
  /// Obtiene un personaje desbloqueado específico
  Future<UnlockedCharacter?> getUnlockedCharacter(String characterId);
  
  /// Elimina todos los personajes desbloqueados (reset)
  Future<void> clearAllUnlockedCharacters();
}
