// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VocabularyStory _$VocabularyStoryFromJson(Map<String, dynamic> json) {
  return _VocabularyStory.fromJson(json);
}

/// @nodoc
mixin _$VocabularyStory {
  /// Story title in English
  String get title => throw _privateConstructorUsedError;

  /// Story title in Spanish
  @JsonKey(name: 'title_es')
  String get titleEs => throw _privateConstructorUsedError;

  /// Story description in English
  String get description => throw _privateConstructorUsedError;

  /// Story description in Spanish
  @JsonKey(name: 'description_es')
  String get descriptionEs => throw _privateConstructorUsedError;

  /// Segments (slides) of the story
  List<VocabularySegment> get segments => throw _privateConstructorUsedError;

  /// Serializes this VocabularyStory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyStory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyStoryCopyWith<VocabularyStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyStoryCopyWith<$Res> {
  factory $VocabularyStoryCopyWith(
    VocabularyStory value,
    $Res Function(VocabularyStory) then,
  ) = _$VocabularyStoryCopyWithImpl<$Res, VocabularyStory>;
  @useResult
  $Res call({
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String description,
    @JsonKey(name: 'description_es') String descriptionEs,
    List<VocabularySegment> segments,
  });
}

/// @nodoc
class _$VocabularyStoryCopyWithImpl<$Res, $Val extends VocabularyStory>
    implements $VocabularyStoryCopyWith<$Res> {
  _$VocabularyStoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyStory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? titleEs = null,
    Object? description = null,
    Object? descriptionEs = null,
    Object? segments = null,
  }) {
    return _then(
      _value.copyWith(
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
            segments: null == segments
                ? _value.segments
                : segments // ignore: cast_nullable_to_non_nullable
                      as List<VocabularySegment>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VocabularyStoryImplCopyWith<$Res>
    implements $VocabularyStoryCopyWith<$Res> {
  factory _$$VocabularyStoryImplCopyWith(
    _$VocabularyStoryImpl value,
    $Res Function(_$VocabularyStoryImpl) then,
  ) = __$$VocabularyStoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    @JsonKey(name: 'title_es') String titleEs,
    String description,
    @JsonKey(name: 'description_es') String descriptionEs,
    List<VocabularySegment> segments,
  });
}

/// @nodoc
class __$$VocabularyStoryImplCopyWithImpl<$Res>
    extends _$VocabularyStoryCopyWithImpl<$Res, _$VocabularyStoryImpl>
    implements _$$VocabularyStoryImplCopyWith<$Res> {
  __$$VocabularyStoryImplCopyWithImpl(
    _$VocabularyStoryImpl _value,
    $Res Function(_$VocabularyStoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VocabularyStory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? titleEs = null,
    Object? description = null,
    Object? descriptionEs = null,
    Object? segments = null,
  }) {
    return _then(
      _$VocabularyStoryImpl(
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
        segments: null == segments
            ? _value._segments
            : segments // ignore: cast_nullable_to_non_nullable
                  as List<VocabularySegment>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyStoryImpl implements _VocabularyStory {
  const _$VocabularyStoryImpl({
    required this.title,
    @JsonKey(name: 'title_es') required this.titleEs,
    required this.description,
    @JsonKey(name: 'description_es') required this.descriptionEs,
    required final List<VocabularySegment> segments,
  }) : _segments = segments;

  factory _$VocabularyStoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyStoryImplFromJson(json);

  /// Story title in English
  @override
  final String title;

  /// Story title in Spanish
  @override
  @JsonKey(name: 'title_es')
  final String titleEs;

  /// Story description in English
  @override
  final String description;

  /// Story description in Spanish
  @override
  @JsonKey(name: 'description_es')
  final String descriptionEs;

  /// Segments (slides) of the story
  final List<VocabularySegment> _segments;

  /// Segments (slides) of the story
  @override
  List<VocabularySegment> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  @override
  String toString() {
    return 'VocabularyStory(title: $title, titleEs: $titleEs, description: $description, descriptionEs: $descriptionEs, segments: $segments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyStoryImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleEs, titleEs) || other.titleEs == titleEs) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionEs, descriptionEs) ||
                other.descriptionEs == descriptionEs) &&
            const DeepCollectionEquality().equals(other._segments, _segments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    titleEs,
    description,
    descriptionEs,
    const DeepCollectionEquality().hash(_segments),
  );

  /// Create a copy of VocabularyStory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyStoryImplCopyWith<_$VocabularyStoryImpl> get copyWith =>
      __$$VocabularyStoryImplCopyWithImpl<_$VocabularyStoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyStoryImplToJson(this);
  }
}

abstract class _VocabularyStory implements VocabularyStory {
  const factory _VocabularyStory({
    required final String title,
    @JsonKey(name: 'title_es') required final String titleEs,
    required final String description,
    @JsonKey(name: 'description_es') required final String descriptionEs,
    required final List<VocabularySegment> segments,
  }) = _$VocabularyStoryImpl;

  factory _VocabularyStory.fromJson(Map<String, dynamic> json) =
      _$VocabularyStoryImpl.fromJson;

  /// Story title in English
  @override
  String get title;

  /// Story title in Spanish
  @override
  @JsonKey(name: 'title_es')
  String get titleEs;

  /// Story description in English
  @override
  String get description;

  /// Story description in Spanish
  @override
  @JsonKey(name: 'description_es')
  String get descriptionEs;

  /// Segments (slides) of the story
  @override
  List<VocabularySegment> get segments;

  /// Create a copy of VocabularyStory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyStoryImplCopyWith<_$VocabularyStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
