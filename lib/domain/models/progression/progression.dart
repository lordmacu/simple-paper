import 'package:freezed_annotation/freezed_annotation.dart';
import 'achievement.dart';
import 'unlock.dart';

part 'progression.freezed.dart';
part 'progression.g.dart';

/// Sistema de progresión del episodio (XP, logros, desbloqueos)
@freezed
class Progression with _$Progression {
  /// Crea un sistema de progresión.
  ///
  /// Parámetros:
  /// - [xpEarnedBase]: XP base ganado al completar el episodio
  /// - [xpBonusConditions]: Condiciones de bonificación de XP
  /// - [unlocks]: Desbloqueos del episodio (personajes, ubicaciones)
  /// - [achievements]: Logros que se pueden obtener
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

  /// Crea Progression desde JSON.
  factory Progression.fromJson(Map<String, dynamic> json) =>
      _$ProgressionFromJson(json);
}

/// Condición para obtener XP bonus
@freezed
class XpBonusCondition with _$XpBonusCondition {
  /// Crea una condición de XP bonus.
  ///
  /// Parámetros:
  /// - [condition]: Condición a cumplir ('complete_all_games', 'perfect_choices', etc.)
  /// - [bonusXp]: XP bonus otorgado
  const factory XpBonusCondition({
    /// Condición a cumplir ('complete_all_games', 'perfect_choices', etc.)
    required String condition,
    
    /// XP bonus otorgado
    @JsonKey(name: 'bonus_xp') @Default(0) int bonusXp,
  }) = _XpBonusCondition;

  /// Crea XpBonusCondition desde JSON.
  factory XpBonusCondition.fromJson(Map<String, dynamic> json) =>
      _$XpBonusConditionFromJson(json);
}
