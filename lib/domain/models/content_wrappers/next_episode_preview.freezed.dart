// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'next_episode_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NextEpisodePreview _$NextEpisodePreviewFromJson(Map<String, dynamic> json) {
  return _NextEpisodePreview.fromJson(json);
}

/// @nodoc
mixin _$NextEpisodePreview {
  /// Texto del preview en inglés
  @JsonKey(name: 'preview_text_en')
  String get previewTextEn => throw _privateConstructorUsedError;

  /// Texto del preview en español
  @JsonKey(name: 'preview_text_es')
  String get previewTextEs => throw _privateConstructorUsedError;

  /// URL de imagen teaser
  @JsonKey(name: 'teaser_image')
  String? get teaserImage => throw _privateConstructorUsedError;

  /// Serializes this NextEpisodePreview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NextEpisodePreview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NextEpisodePreviewCopyWith<NextEpisodePreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextEpisodePreviewCopyWith<$Res> {
  factory $NextEpisodePreviewCopyWith(
    NextEpisodePreview value,
    $Res Function(NextEpisodePreview) then,
  ) = _$NextEpisodePreviewCopyWithImpl<$Res, NextEpisodePreview>;
  @useResult
  $Res call({
    @JsonKey(name: 'preview_text_en') String previewTextEn,
    @JsonKey(name: 'preview_text_es') String previewTextEs,
    @JsonKey(name: 'teaser_image') String? teaserImage,
  });
}

/// @nodoc
class _$NextEpisodePreviewCopyWithImpl<$Res, $Val extends NextEpisodePreview>
    implements $NextEpisodePreviewCopyWith<$Res> {
  _$NextEpisodePreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NextEpisodePreview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewTextEn = null,
    Object? previewTextEs = null,
    Object? teaserImage = freezed,
  }) {
    return _then(
      _value.copyWith(
            previewTextEn: null == previewTextEn
                ? _value.previewTextEn
                : previewTextEn // ignore: cast_nullable_to_non_nullable
                      as String,
            previewTextEs: null == previewTextEs
                ? _value.previewTextEs
                : previewTextEs // ignore: cast_nullable_to_non_nullable
                      as String,
            teaserImage: freezed == teaserImage
                ? _value.teaserImage
                : teaserImage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NextEpisodePreviewImplCopyWith<$Res>
    implements $NextEpisodePreviewCopyWith<$Res> {
  factory _$$NextEpisodePreviewImplCopyWith(
    _$NextEpisodePreviewImpl value,
    $Res Function(_$NextEpisodePreviewImpl) then,
  ) = __$$NextEpisodePreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'preview_text_en') String previewTextEn,
    @JsonKey(name: 'preview_text_es') String previewTextEs,
    @JsonKey(name: 'teaser_image') String? teaserImage,
  });
}

/// @nodoc
class __$$NextEpisodePreviewImplCopyWithImpl<$Res>
    extends _$NextEpisodePreviewCopyWithImpl<$Res, _$NextEpisodePreviewImpl>
    implements _$$NextEpisodePreviewImplCopyWith<$Res> {
  __$$NextEpisodePreviewImplCopyWithImpl(
    _$NextEpisodePreviewImpl _value,
    $Res Function(_$NextEpisodePreviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NextEpisodePreview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewTextEn = null,
    Object? previewTextEs = null,
    Object? teaserImage = freezed,
  }) {
    return _then(
      _$NextEpisodePreviewImpl(
        previewTextEn: null == previewTextEn
            ? _value.previewTextEn
            : previewTextEn // ignore: cast_nullable_to_non_nullable
                  as String,
        previewTextEs: null == previewTextEs
            ? _value.previewTextEs
            : previewTextEs // ignore: cast_nullable_to_non_nullable
                  as String,
        teaserImage: freezed == teaserImage
            ? _value.teaserImage
            : teaserImage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NextEpisodePreviewImpl implements _NextEpisodePreview {
  const _$NextEpisodePreviewImpl({
    @JsonKey(name: 'preview_text_en') required this.previewTextEn,
    @JsonKey(name: 'preview_text_es') required this.previewTextEs,
    @JsonKey(name: 'teaser_image') this.teaserImage,
  });

  factory _$NextEpisodePreviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$NextEpisodePreviewImplFromJson(json);

  /// Texto del preview en inglés
  @override
  @JsonKey(name: 'preview_text_en')
  final String previewTextEn;

  /// Texto del preview en español
  @override
  @JsonKey(name: 'preview_text_es')
  final String previewTextEs;

  /// URL de imagen teaser
  @override
  @JsonKey(name: 'teaser_image')
  final String? teaserImage;

  @override
  String toString() {
    return 'NextEpisodePreview(previewTextEn: $previewTextEn, previewTextEs: $previewTextEs, teaserImage: $teaserImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextEpisodePreviewImpl &&
            (identical(other.previewTextEn, previewTextEn) ||
                other.previewTextEn == previewTextEn) &&
            (identical(other.previewTextEs, previewTextEs) ||
                other.previewTextEs == previewTextEs) &&
            (identical(other.teaserImage, teaserImage) ||
                other.teaserImage == teaserImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, previewTextEn, previewTextEs, teaserImage);

  /// Create a copy of NextEpisodePreview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NextEpisodePreviewImplCopyWith<_$NextEpisodePreviewImpl> get copyWith =>
      __$$NextEpisodePreviewImplCopyWithImpl<_$NextEpisodePreviewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NextEpisodePreviewImplToJson(this);
  }
}

abstract class _NextEpisodePreview implements NextEpisodePreview {
  const factory _NextEpisodePreview({
    @JsonKey(name: 'preview_text_en') required final String previewTextEn,
    @JsonKey(name: 'preview_text_es') required final String previewTextEs,
    @JsonKey(name: 'teaser_image') final String? teaserImage,
  }) = _$NextEpisodePreviewImpl;

  factory _NextEpisodePreview.fromJson(Map<String, dynamic> json) =
      _$NextEpisodePreviewImpl.fromJson;

  /// Texto del preview en inglés
  @override
  @JsonKey(name: 'preview_text_en')
  String get previewTextEn;

  /// Texto del preview en español
  @override
  @JsonKey(name: 'preview_text_es')
  String get previewTextEs;

  /// URL de imagen teaser
  @override
  @JsonKey(name: 'teaser_image')
  String? get teaserImage;

  /// Create a copy of NextEpisodePreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NextEpisodePreviewImplCopyWith<_$NextEpisodePreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
