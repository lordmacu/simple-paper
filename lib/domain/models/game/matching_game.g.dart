// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchingGameImpl _$$MatchingGameImplFromJson(Map<String, dynamic> json) =>
    _$MatchingGameImpl(
      gameId: json['game_id'] as String,
      gameType: json['game_type'] as String,
      title: json['title'] as String,
      titleEs: json['title_es'] as String,
      instructions: json['instructions'] as String,
      instructionsEs: json['instructions_es'] as String,
      optional: json['optional'] as bool? ?? true,
      unlockedAfterEpisode: json['unlocked_after_episode'] as bool? ?? true,
      timeLimitSeconds: (json['time_limit_seconds'] as num?)?.toInt(),
      xpReward: (json['xp_reward'] as num?)?.toInt() ?? 0,
      content: MatchingGameContent.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
      settings: json['settings'] == null
          ? null
          : MatchingGameSettings.fromJson(
              json['settings'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$MatchingGameImplToJson(_$MatchingGameImpl instance) =>
    <String, dynamic>{
      'game_id': instance.gameId,
      'game_type': instance.gameType,
      'title': instance.title,
      'title_es': instance.titleEs,
      'instructions': instance.instructions,
      'instructions_es': instance.instructionsEs,
      'optional': instance.optional,
      'unlocked_after_episode': instance.unlockedAfterEpisode,
      'time_limit_seconds': instance.timeLimitSeconds,
      'xp_reward': instance.xpReward,
      'content': instance.content,
      'settings': instance.settings,
    };

_$MatchingGameContentImpl _$$MatchingGameContentImplFromJson(
  Map<String, dynamic> json,
) => _$MatchingGameContentImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => MatchingItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$MatchingGameContentImplToJson(
  _$MatchingGameContentImpl instance,
) => <String, dynamic>{'items': instance.items};

_$MatchingItemImpl _$$MatchingItemImplFromJson(Map<String, dynamic> json) =>
    _$MatchingItemImpl(
      id: (json['id'] as num).toInt(),
      left: json['left'] as String,
      right: json['right'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$MatchingItemImplToJson(_$MatchingItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'left': instance.left,
      'right': instance.right,
      'image_url': instance.imageUrl,
    };

_$MatchingGameSettingsImpl _$$MatchingGameSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$MatchingGameSettingsImpl(
  shuffle: json['shuffle'] as bool? ?? true,
  showImages: json['show_images'] as bool? ?? true,
);

Map<String, dynamic> _$$MatchingGameSettingsImplToJson(
  _$MatchingGameSettingsImpl instance,
) => <String, dynamic>{
  'shuffle': instance.shuffle,
  'show_images': instance.showImages,
};
