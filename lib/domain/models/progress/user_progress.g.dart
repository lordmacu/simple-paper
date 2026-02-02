// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProgressImpl _$$UserProgressImplFromJson(Map<String, dynamic> json) =>
    _$UserProgressImpl(
      completedEpisodes:
          (json['completedEpisodes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              int.parse(k),
              EpisodeProgress.fromJson(e as Map<String, dynamic>),
            ),
          ) ??
          const {},
      lastUnlockedEpisode: (json['lastUnlockedEpisode'] as num?)?.toInt() ?? 1,
      userLevel: (json['userLevel'] as num?)?.toInt() ?? 1,
      totalXp: (json['totalXp'] as num?)?.toInt() ?? 0,
      achievements:
          (json['achievements'] as List<dynamic>?)
              ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reviewWords:
          (json['review_words'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      lastAccessDate: json['lastAccessDate'] == null
          ? null
          : DateTime.parse(json['lastAccessDate'] as String),
    );

Map<String, dynamic> _$$UserProgressImplToJson(_$UserProgressImpl instance) =>
    <String, dynamic>{
      'completedEpisodes': instance.completedEpisodes.map(
        (k, e) => MapEntry(k.toString(), e),
      ),
      'lastUnlockedEpisode': instance.lastUnlockedEpisode,
      'userLevel': instance.userLevel,
      'totalXp': instance.totalXp,
      'achievements': instance.achievements,
      'review_words': instance.reviewWords,
      'currentStreak': instance.currentStreak,
      'lastAccessDate': instance.lastAccessDate?.toIso8601String(),
    };

_$EpisodeProgressImpl _$$EpisodeProgressImplFromJson(
  Map<String, dynamic> json,
) => _$EpisodeProgressImpl(
  episodeNumber: (json['episodeNumber'] as num).toInt(),
  isCompleted: json['isCompleted'] as bool? ?? false,
  starsEarned: (json['starsEarned'] as num?)?.toInt() ?? 0,
  xpEarned: (json['xpEarned'] as num?)?.toInt() ?? 0,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  attempts: (json['attempts'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$$EpisodeProgressImplToJson(
  _$EpisodeProgressImpl instance,
) => <String, dynamic>{
  'episodeNumber': instance.episodeNumber,
  'isCompleted': instance.isCompleted,
  'starsEarned': instance.starsEarned,
  'xpEarned': instance.xpEarned,
  'completedAt': instance.completedAt?.toIso8601String(),
  'attempts': instance.attempts,
};
