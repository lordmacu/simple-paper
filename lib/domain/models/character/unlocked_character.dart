import 'package:freezed_annotation/freezed_annotation.dart';

part 'unlocked_character.freezed.dart';
part 'unlocked_character.g.dart';

/// Modelo que representa un personaje desbloqueado por el usuario
/// Incluye información de cuándo se desbloqueó y nombre personalizado
@freezed
class UnlockedCharacter with _$UnlockedCharacter {
  const factory UnlockedCharacter({
    /// ID del personaje
    required String characterId,
    
    /// Nombre por defecto del personaje
    required String defaultName,
    
    /// Nombre personalizado por el usuario (si existe)
    String? customName,
    
    /// Fecha/hora en que se desbloqueó (timestamp en milisegundos)
    required int unlockedAt,
    
    /// Número de episodio donde se desbloqueó
    required int episodeNumber,
  }) = _UnlockedCharacter;

  factory UnlockedCharacter.fromJson(Map<String, dynamic> json) =>
      _$UnlockedCharacterFromJson(json);
}
