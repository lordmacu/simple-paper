import 'package:freezed_annotation/freezed_annotation.dart';
import 'reflection_prompt.dart';

part 'content_wrappers.freezed.dart';
part 'content_wrappers.g.dart';

/// Contenedores de contenido que envuelven las secciones del episodio
/// Provee intro, transición y conclusión con textos motivacionales
@freezed
class ContentWrappers with _$ContentWrappers {
  const factory ContentWrappers({
    /// Texto de introducción del episodio
    @JsonKey(name: 'intro_text') required BilingualText introText,
    
    /// Texto de transición (entre vocabulary story y main story)
    required BilingualText transition,
    
    /// Texto de conclusión del episodio
    required BilingualText conclusion,
    
    /// Prompt de reflexión (opcional)
    @JsonKey(name: 'reflection_prompt') ReflectionPrompt? reflectionPrompt,
  }) = _ContentWrappers;

  factory ContentWrappers.fromJson(Map<String, dynamic> json) =>
      _$ContentWrappersFromJson(json);
}

/// Texto bilingüe (inglés y español)
@freezed
class BilingualText with _$BilingualText {
  const factory BilingualText({
    /// Texto en inglés
    required String en,
    
    /// Texto en español
    required String es,
  }) = _BilingualText;

  factory BilingualText.fromJson(Map<String, dynamic> json) =>
      _$BilingualTextFromJson(json);
}
