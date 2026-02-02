import 'package:freezed_annotation/freezed_annotation.dart';

part 'unlocked_character.freezed.dart';
part 'unlocked_character.g.dart';

/// Modelo que representa un personaje desbloqueado por el usuario
/// Incluye información de cuándo se desbloqueó y nombre personalizado
@freezed
class UnlockedCharacter with _$UnlockedCharacter {
  /// Crea un personaje desbloqueado.
  const factory UnlockedCharacter({
    /// ID del personaje
    required String characterId,
    
    /// Nombre por defecto del personaje
    required String defaultName,
    
    /// Fecha/hora en que se desbloqueó (timestamp en milisegundos)
    required int unlockedAt, 
    /// Número de episodio donde se desbloqueó
    required int episodeNumber, 
    /// Nombre personalizado por el usuario (si existe)
    String? customName,
  }) = _UnlockedCharacter;

  /// Crea un UnlockedCharacter desde JSON.
  factory UnlockedCharacter.fromJson(Map<String, dynamic> json) =>
      _$UnlockedCharacterFromJson(json);
}
