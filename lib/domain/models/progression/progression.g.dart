// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progression.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressionImpl _$$ProgressionImplFromJson(Map<String, dynamic> json) =>
    _$ProgressionImpl(
      xpEarnedBase: (json['xp_earned_base'] as num?)?.toInt() ?? 0,
      xpBonusConditions:
          (json['xp_bonus_conditions'] as List<dynamic>?)
              ?.map((e) => XpBonusCondition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unlocks:
          (json['unlocks'] as List<dynamic>?)
              ?.map((e) => Unlock.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      achievements:
          (json['achievements'] as List<dynamic>?)
              ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProgressionImplToJson(_$ProgressionImpl instance) =>
    <String, dynamic>{
      'xp_earned_base': instance.xpEarnedBase,
      'xp_bonus_conditions': instance.xpBonusConditions,
      'unlocks': instance.unlocks,
      'achievements': instance.achievements,
    };

_$XpBonusConditionImpl _$$XpBonusConditionImplFromJson(
  Map<String, dynamic> json,
) => _$XpBonusConditionImpl(
  condition: json['condition'] as String,
  bonusXp: (json['bonus_xp'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$XpBonusConditionImplToJson(
  _$XpBonusConditionImpl instance,
) => <String, dynamic>{
  'condition': instance.condition,
  'bonus_xp': instance.bonusXp,
};
