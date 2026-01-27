// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EpisodeMetadata _$EpisodeMetadataFromJson(Map<String, dynamic> json) {
  return _EpisodeMetadata.fromJson(json);
}

/// @nodoc
mixin _$EpisodeMetadata {
  /// Episode number (1-30)
  @JsonKey(name: 'episode_number')
  int get episodeNumber => throw _privateConstructorUsedError;

  /// Unique episode ID
  @JsonKey(name: 'episode_id')
  String get episodeId => throw _privateConstructorUsedError;

  /// Episode title in English
  String get title => throw _privateConstructorUsedError;

  /// Episode title in Spanish
  @JsonKey(name: 'title_es')
  String get titleEs => throw _privateConstructorUsedError;

  /// Episode description in English
  String get description => throw _privateConstructorUsedError;

  /// Episode description in Spanish
  @JsonKey(name: 'description_es')
  String get descriptionEs => throw _privateConstructorUsedError;

  /// Internal CEFR level (A1, A2, B1, etc.)
  @JsonKey(name: 'internal_level')
  String get internalLevel => throw _privateConstructorUsedError;

  /// Estimated time in minutes
  @JsonKey(name: 'estimated_time_minutes')
  int get estimatedTimeMinutes => throw _privateConstructorUsedError;

  /// Requirements to unlock this episode
  @JsonKey(name: 'unlock_requirements')
  String? get unlockRequirements => throw _privateConstructorUsedError;

  /// Tags for categorization
  List<String> get tags => throw _privateConstructorUsedError;

  /// Previous episode ID
  @JsonKey(name: 'previous_episode')
  String? get previousEpisode => throw _privateConstructorUsedError;

  /// Next episode ID
  @JsonKey(name: 'next_episode')
  String? get nextEpisode => throw _privateConstructorUsedError;

  /// Serializes this EpisodeMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EpisodeMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodeMetadataCopyWith<EpisodeMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeMetadataCopyWith<$Res> {
  factory $EpisodeMetadataCopyWith(
    EpisodeMetadata value,
    $Res Function(EpisodeMetadata) then,
  ) = _$EpisodeMetadataCopyWithImpl<$Res, EpisodeMetadata>;
  @useResult
  $Res call({
    @JsonKey(name: 'episode_number') int episodeNumber,
    @JsonKey(name: 'episode_id') String episodeId,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String description,
    @JsonKey(name: 'description_es') String descriptionEs,
    @JsonKey(name: 'internal_level') String internalLevel,
    @JsonKey(name: 'estimated_time_minutes') int estimatedTimeMinutes,
    @JsonKey(name: 'unlock_requirements') String? unlockRequirements,
    List<String> tags,
    @JsonKey(name: 'previous_episode') String? previousEpisode,
    @JsonKey(name: 'next_episode') String? nextEpisode,
  });
}

/// @nodoc
class _$EpisodeMetadataCopyWithImpl<$Res, $Val extends EpisodeMetadata>
    implements $EpisodeMetadataCopyWith<$Res> {
  _$EpisodeMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EpisodeMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodeNumber = null,
    Object? episodeId = null,
    Object? title = null,
    Object? titleEs = null,
    Object? description = null,
    Object? descriptionEs = null,
    Object? internalLevel = null,
    Object? estimatedTimeMinutes = null,
    Object? unlockRequirements = freezed,
    Object? tags = null,
    Object? previousEpisode = freezed,
    Object? nextEpisode = freezed,
  }) {
    return _then(
      _value.copyWith(
            episodeNumber: null == episodeNumber
                ? _value.episodeNumber
                : episodeNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            episodeId: null == episodeId
                ? _value.episodeId
                : episodeId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            titleEs: null == titleEs
                ? _value.titleEs
                : titleEs // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionEs: null == descriptionEs
                ? _value.descriptionEs
                : descriptionEs // ignore: cast_nullable_to_non_nullable
                      as String,
            internalLevel: null == internalLevel
                ? _value.internalLevel
                : internalLevel // ignore: cast_nullable_to_non_nullable
                      as String,
            estimatedTimeMinutes: null == estimatedTimeMinutes
                ? _value.estimatedTimeMinutes
                : estimatedTimeMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            unlockRequirements: freezed == unlockRequirements
                ? _value.unlockRequirements
                : unlockRequirements // ignore: cast_nullable_to_non_nullable
                      as String?,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            previousEpisode: freezed == previousEpisode
                ? _value.previousEpisode
                : previousEpisode // ignore: cast_nullable_to_non_nullable
                      as String?,
            nextEpisode: freezed == nextEpisode
                ? _value.nextEpisode
                : nextEpisode // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EpisodeMetadataImplCopyWith<$Res>
    implements $EpisodeMetadataCopyWith<$Res> {
  factory _$$EpisodeMetadataImplCopyWith(
    _$EpisodeMetadataImpl value,
    $Res Function(_$EpisodeMetadataImpl) then,
  ) = __$$EpisodeMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'episode_number') int episodeNumber,
    @JsonKey(name: 'episode_id') String episodeId,
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String description,
    @JsonKey(name: 'description_es') String descriptionEs,
    @JsonKey(name: 'internal_level') String internalLevel,
    @JsonKey(name: 'estimated_time_minutes') int estimatedTimeMinutes,
    @JsonKey(name: 'unlock_requirements') String? unlockRequirements,
    List<String> tags,
    @JsonKey(name: 'previous_episode') String? previousEpisode,
    @JsonKey(name: 'next_episode') String? nextEpisode,
  });
}

/// @nodoc
class __$$EpisodeMetadataImplCopyWithImpl<$Res>
    extends _$EpisodeMetadataCopyWithImpl<$Res, _$EpisodeMetadataImpl>
    implements _$$EpisodeMetadataImplCopyWith<$Res> {
  __$$EpisodeMetadataImplCopyWithImpl(
    _$EpisodeMetadataImpl _value,
    $Res Function(_$EpisodeMetadataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EpisodeMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodeNumber = null,
    Object? episodeId = null,
    Object? title = null,
    Object? titleEs = null,
    Object? description = null,
    Object? descriptionEs = null,
    Object? internalLevel = null,
    Object? estimatedTimeMinutes = null,
    Object? unlockRequirements = freezed,
    Object? tags = null,
    Object? previousEpisode = freezed,
    Object? nextEpisode = freezed,
  }) {
    return _then(
      _$EpisodeMetadataImpl(
        episodeNumber: null == episodeNumber
            ? _value.episodeNumber
            : episodeNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        episodeId: null == episodeId
            ? _value.episodeId
            : episodeId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        titleEs: null == titleEs
            ? _value.titleEs
            : titleEs // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionEs: null == descriptionEs
            ? _value.descriptionEs
            : descriptionEs // ignore: cast_nullable_to_non_nullable
                  as String,
        internalLevel: null == internalLevel
            ? _value.internalLevel
            : internalLevel // ignore: cast_nullable_to_non_nullable
                  as String,
        estimatedTimeMinutes: null == estimatedTimeMinutes
            ? _value.estimatedTimeMinutes
            : estimatedTimeMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        unlockRequirements: freezed == unlockRequirements
            ? _value.unlockRequirements
            : unlockRequirements // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        previousEpisode: freezed == previousEpisode
            ? _value.previousEpisode
            : previousEpisode // ignore: cast_nullable_to_non_nullable
                  as String?,
        nextEpisode: freezed == nextEpisode
            ? _value.nextEpisode
            : nextEpisode // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeMetadataImpl implements _EpisodeMetadata {
  const _$EpisodeMetadataImpl({
    @JsonKey(name: 'episode_number') required this.episodeNumber,
    @JsonKey(name: 'episode_id') required this.episodeId,
    required this.title,
    @JsonKey(name: 'title_es') required this.titleEs,
    required this.description,
    @JsonKey(name: 'description_es') required this.descriptionEs,
    @JsonKey(name: 'internal_level') required this.internalLevel,
    @JsonKey(name: 'estimated_time_minutes') required this.estimatedTimeMinutes,
    @JsonKey(name: 'unlock_requirements') this.unlockRequirements,
    required final List<String> tags,
    @JsonKey(name: 'previous_episode') this.previousEpisode,
    @JsonKey(name: 'next_episode') this.nextEpisode,
  }) : _tags = tags;

  factory _$EpisodeMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeMetadataImplFromJson(json);

  /// Episode number (1-30)
  @override
  @JsonKey(name: 'episode_number')
  final int episodeNumber;

  /// Unique episode ID
  @override
  @JsonKey(name: 'episode_id')
  final String episodeId;

  /// Episode title in English
  @override
  final String title;

  /// Episode title in Spanish
  @override
  @JsonKey(name: 'title_es')
  final String titleEs;

  /// Episode description in English
  @override
  final String description;

  /// Episode description in Spanish
  @override
  @JsonKey(name: 'description_es')
  final String descriptionEs;

  /// Internal CEFR level (A1, A2, B1, etc.)
  @override
  @JsonKey(name: 'internal_level')
  final String internalLevel;

  /// Estimated time in minutes
  @override
  @JsonKey(name: 'estimated_time_minutes')
  final int estimatedTimeMinutes;

  /// Requirements to unlock this episode
  @override
  @JsonKey(name: 'unlock_requirements')
  final String? unlockRequirements;

  /// Tags for categorization
  final List<String> _tags;

  /// Tags for categorization
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// Previous episode ID
  @override
  @JsonKey(name: 'previous_episode')
  final String? previousEpisode;

  /// Next episode ID
  @override
  @JsonKey(name: 'next_episode')
  final String? nextEpisode;

  @override
  String toString() {
    return 'EpisodeMetadata(episodeNumber: $episodeNumber, episodeId: $episodeId, title: $title, titleEs: $titleEs, description: $description, descriptionEs: $descriptionEs, internalLevel: $internalLevel, estimatedTimeMinutes: $estimatedTimeMinutes, unlockRequirements: $unlockRequirements, tags: $tags, previousEpisode: $previousEpisode, nextEpisode: $nextEpisode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeMetadataImpl &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleEs, titleEs) || other.titleEs == titleEs) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionEs, descriptionEs) ||
                other.descriptionEs == descriptionEs) &&
            (identical(other.internalLevel, internalLevel) ||
                other.internalLevel == internalLevel) &&
            (identical(other.estimatedTimeMinutes, estimatedTimeMinutes) ||
                other.estimatedTimeMinutes == estimatedTimeMinutes) &&
            (identical(other.unlockRequirements, unlockRequirements) ||
                other.unlockRequirements == unlockRequirements) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.previousEpisode, previousEpisode) ||
                other.previousEpisode == previousEpisode) &&
            (identical(other.nextEpisode, nextEpisode) ||
                other.nextEpisode == nextEpisode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    episodeNumber,
    episodeId,
    title,
    titleEs,
    description,
    descriptionEs,
    internalLevel,
    estimatedTimeMinutes,
    unlockRequirements,
    const DeepCollectionEquality().hash(_tags),
    previousEpisode,
    nextEpisode,
  );

  /// Create a copy of EpisodeMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeMetadataImplCopyWith<_$EpisodeMetadataImpl> get copyWith =>
      __$$EpisodeMetadataImplCopyWithImpl<_$EpisodeMetadataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeMetadataImplToJson(this);
  }
}

abstract class _EpisodeMetadata implements EpisodeMetadata {
  const factory _EpisodeMetadata({
    @JsonKey(name: 'episode_number') required final int episodeNumber,
    @JsonKey(name: 'episode_id') required final String episodeId,
    required final String title,
    @JsonKey(name: 'title_es') required final String titleEs,
    required final String description,
    @JsonKey(name: 'description_es') required final String descriptionEs,
    @JsonKey(name: 'internal_level') required final String internalLevel,
    @JsonKey(name: 'estimated_time_minutes')
    required final int estimatedTimeMinutes,
    @JsonKey(name: 'unlock_requirements') final String? unlockRequirements,
    required final List<String> tags,
    @JsonKey(name: 'previous_episode') final String? previousEpisode,
    @JsonKey(name: 'next_episode') final String? nextEpisode,
  }) = _$EpisodeMetadataImpl;

  factory _EpisodeMetadata.fromJson(Map<String, dynamic> json) =
      _$EpisodeMetadataImpl.fromJson;

  /// Episode number (1-30)
  @override
  @JsonKey(name: 'episode_number')
  int get episodeNumber;

  /// Unique episode ID
  @override
  @JsonKey(name: 'episode_id')
  String get episodeId;

  /// Episode title in English
  @override
  String get title;

  /// Episode title in Spanish
  @override
  @JsonKey(name: 'title_es')
  String get titleEs;

  /// Episode description in English
  @override
  String get description;

  /// Episode description in Spanish
  @override
  @JsonKey(name: 'description_es')
  String get descriptionEs;

  /// Internal CEFR level (A1, A2, B1, etc.)
  @override
  @JsonKey(name: 'internal_level')
  String get internalLevel;

  /// Estimated time in minutes
  @override
  @JsonKey(name: 'estimated_time_minutes')
  int get estimatedTimeMinutes;

  /// Requirements to unlock this episode
  @override
  @JsonKey(name: 'unlock_requirements')
  String? get unlockRequirements;

  /// Tags for categorization
  @override
  List<String> get tags;

  /// Previous episode ID
  @override
  @JsonKey(name: 'previous_episode')
  String? get previousEpisode;

  /// Next episode ID
  @override
  @JsonKey(name: 'next_episode')
  String? get nextEpisode;

  /// Create a copy of EpisodeMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeMetadataImplCopyWith<_$EpisodeMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
