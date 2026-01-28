import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String name,
    required String description,
    @Default(false) bool unlocked,
    DateTime? unlockedAt,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(_fixAchievementJson(json));
}

Map<String, dynamic> _fixAchievementJson(Map<String, dynamic> json) {
  final fixed = Map<String, dynamic>.from(json);
  // Accept both 'id' and 'achievement_id'
  fixed['id'] ??= json['achievement_id'] ?? '';
  // Fallbacks from Spanish fields
  fixed['name'] ??= json['name_es'] ?? '';
  fixed['description'] ??= json['description_es'] ?? '';
  return fixed;
}
