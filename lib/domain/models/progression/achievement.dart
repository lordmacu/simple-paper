import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

/// Representa un logro que se puede desbloquear en un episodio
@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    /// ID único del logro
    @JsonKey(name: 'achievement_id') required String achievementId,
    
    /// Nombre del logro en inglés
    required String name,
    
    /// Nombre en español
    @JsonKey(name: 'name_es') required String nameEs,
    
    /// Descripción del logro en inglés
    required String description,
    
    /// Descripción en español
    @JsonKey(name: 'description_es') required String descriptionEs,
    
    /// URL del icono del logro
    required String icon,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}
