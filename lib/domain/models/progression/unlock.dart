import 'package:freezed_annotation/freezed_annotation.dart';

part 'unlock.freezed.dart';
part 'unlock.g.dart';

/// Representa un desbloqueo (personaje, ubicación, etc.)
@freezed
class Unlock with _$Unlock {
  const factory Unlock({
    /// Tipo de desbloqueo ('character', 'location', etc.)
    required String type,
    
    /// IDs de personajes desbloqueados (si type='character')
    @JsonKey(name: 'character_ids') List<String>? characterIds,
    
    /// IDs de ubicaciones desbloqueadas (si type='location')
    @JsonKey(name: 'location_ids') List<String>? locationIds,
  }) = _Unlock;

  factory Unlock.fromJson(Map<String, dynamic> json) =>
      _$UnlockFromJson(json);
}
