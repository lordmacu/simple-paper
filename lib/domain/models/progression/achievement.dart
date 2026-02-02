import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

/// Logro desbloqueable en la app
@freezed
class Achievement with _$Achievement {
  /// Crea un logro.
  ///
  /// Parámetros:
  /// - [id]: Identificador único del logro
  /// - [name]: Nombre del logro
  /// - [description]: Descripción del logro
  /// - [unlocked]: Si el logro está desbloqueado
  /// - [unlockedAt]: Fecha de desbloqueo
  const factory Achievement({
    /// Identificador único del logro
    required String id,
    
    /// Nombre del logro
    required String name,
    
    /// Descripción del logro
    required String description,
    
    /// Si el logro está desbloqueado
    @Default(false) bool unlocked,
    
    /// Fecha de desbloqueo
    DateTime? unlockedAt,
  }) = _Achievement;

  /// Crea Achievement desde JSON.
  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(_fixAchievementJson(json));
}

/// Corrige campos de JSON para compatibilidad
Map<String, dynamic> _fixAchievementJson(Map<String, dynamic> json) {
  final fixed = Map<String, dynamic>.from(json);
  // Accept both 'id' and 'achievement_id'
  fixed['id'] ??= json['achievement_id'] ?? '';
  // Fallbacks from Spanish fields
  fixed['name'] ??= json['name_es'] ?? '';
  fixed['description'] ??= json['description_es'] ?? '';
  return fixed;
}
