import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_episode_preview.freezed.dart';
part 'next_episode_preview.g.dart';

/// Preview del siguiente episodio
/// Genera expectativa y motivación para continuar
@freezed
class NextEpisodePreview with _$NextEpisodePreview {
  const factory NextEpisodePreview({
    /// Texto del preview en inglés
    @JsonKey(name: 'preview_text_en') required String previewTextEn,
    
    /// Texto del preview en español
    @JsonKey(name: 'preview_text_es') required String previewTextEs,
    
    /// URL de imagen teaser
    @JsonKey(name: 'teaser_image') String? teaserImage,
  }) = _NextEpisodePreview;

  factory NextEpisodePreview.fromJson(Map<String, dynamic> json) =>
      _$NextEpisodePreviewFromJson(json);
}
