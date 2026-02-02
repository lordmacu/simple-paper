import 'package:freezed_annotation/freezed_annotation.dart';
import 'reflection_prompt.dart';

part 'content_wrappers.freezed.dart';
part 'content_wrappers.g.dart';

/// Contenedores de contenido que envuelven las secciones del episodio
/// Provee intro, transición y conclusión con textos motivacionales
/// Modelos wrapper para agrupar contenido de episodios, vocabulario, etc.
@freezed
class ContentWrappers with _$ContentWrappers {
  /// Crea contenedores de contenido para un episodio.
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

  /// Crea ContentWrappers desde JSON.
  factory ContentWrappers.fromJson(Map<String, dynamic> json) =>
      _$ContentWrappersFromJson(json);
}

/// Texto bilingüe (inglés y español)
@freezed
class BilingualText with _$BilingualText {
  /// Crea un texto bilingüe con versiones en inglés y español.
  const factory BilingualText({
    /// Texto en inglés
    required String en,
    
    /// Texto en español
    required String es,
  }) = _BilingualText;

  /// Crea BilingualText desde JSON.
  factory BilingualText.fromJson(Map<String, dynamic> json) =>
      _$BilingualTextFromJson(json);
}
