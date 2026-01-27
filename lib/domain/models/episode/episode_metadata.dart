import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_metadata.freezed.dart';
part 'episode_metadata.g.dart';

/// Metadata for an episode
@freezed
class EpisodeMetadata with _$EpisodeMetadata {
  /// Factory constructor
  const factory EpisodeMetadata({
    /// Episode number (1-30)
    @JsonKey(name: 'episode_number') required int episodeNumber,
    
    /// Unique episode ID
    @JsonKey(name: 'episode_id') required String episodeId,
    
    /// Episode title in English
    required String title,
    
    /// Episode title in Spanish
    @JsonKey(name: 'title_es') required String titleEs,
    
    /// Episode description in English
    required String description,
    
    /// Episode description in Spanish
    @JsonKey(name: 'description_es') required String descriptionEs,
    
    /// Internal CEFR level (A1, A2, B1, etc.)
    @JsonKey(name: 'internal_level') required String internalLevel,
    
    /// Estimated time in minutes
    @JsonKey(name: 'estimated_time_minutes') required int estimatedTimeMinutes,
    
    /// Requirements to unlock this episode
    @JsonKey(name: 'unlock_requirements') String? unlockRequirements,
    
    /// Tags for categorization
    required List<String> tags,
    
    /// Previous episode ID
    @JsonKey(name: 'previous_episode') String? previousEpisode,
    
    /// Next episode ID
    @JsonKey(name: 'next_episode') String? nextEpisode,
  }) = _EpisodeMetadata;

  /// Create from JSON
  factory EpisodeMetadata.fromJson(Map<String, dynamic> json) =>
      _$EpisodeMetadataFromJson(json);
}
