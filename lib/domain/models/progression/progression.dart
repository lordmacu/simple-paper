import 'package:freezed_annotation/freezed_annotation.dart';
import 'achievement.dart';
import 'unlock.dart';

part 'progression.freezed.dart';
part 'progression.g.dart';

/// Sistema de progresión del episodio (XP, logros, desbloqueos)
@freezed
class Progression with _$Progression {
  const factory Progression({
    /// XP base ganado al completar el episodio
    @JsonKey(name: 'xp_earned_base') @Default(0) int xpEarnedBase,
    
    /// Condiciones de bonificación de XP
    @JsonKey(name: 'xp_bonus_conditions') @Default([]) List<XpBonusCondition> xpBonusConditions,
    
    /// Desbloqueos del episodio (personajes, ubicaciones)
    @Default([]) List<Unlock> unlocks,
    
    /// Logros que se pueden obtener
    @Default([]) List<Achievement> achievements,
  }) = _Progression;

  factory Progression.fromJson(Map<String, dynamic> json) =>
      _$ProgressionFromJson(json);
}

/// Condición para obtener XP bonus
@freezed
class XpBonusCondition with _$XpBonusCondition {
  const factory XpBonusCondition({
    /// Condición a cumplir ('complete_all_games', 'perfect_choices', etc.)
    required String condition,
    
    /// XP bonus otorgado
    @JsonKey(name: 'bonus_xp') @Default(0) int bonusXp,
  }) = _XpBonusCondition;

  factory XpBonusCondition.fromJson(Map<String, dynamic> json) =>
      _$XpBonusConditionFromJson(json);
}
