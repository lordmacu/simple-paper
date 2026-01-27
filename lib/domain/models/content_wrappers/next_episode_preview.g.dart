// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_episode_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NextEpisodePreviewImpl _$$NextEpisodePreviewImplFromJson(
  Map<String, dynamic> json,
) => _$NextEpisodePreviewImpl(
  previewTextEn: json['preview_text_en'] as String,
  previewTextEs: json['preview_text_es'] as String,
  teaserImage: json['teaser_image'] as String?,
);

Map<String, dynamic> _$$NextEpisodePreviewImplToJson(
  _$NextEpisodePreviewImpl instance,
) => <String, dynamic>{
  'preview_text_en': instance.previewTextEn,
  'preview_text_es': instance.previewTextEs,
  'teaser_image': instance.teaserImage,
};
