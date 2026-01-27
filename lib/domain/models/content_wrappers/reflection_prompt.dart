import 'package:freezed_annotation/freezed_annotation.dart';

part 'reflection_prompt.freezed.dart';
part 'reflection_prompt.g.dart';

/// Prompt de reflexión al final del episodio
/// Permite al usuario practicar escribiendo con el vocabulario aprendido
@freezed
class ReflectionPrompt with _$ReflectionPrompt {
  const factory ReflectionPrompt({
    /// Pregunta del prompt en inglés
    @JsonKey(name: 'question_en') required String questionEn,
    
    /// Pregunta en español
    @JsonKey(name: 'question_es') required String questionEs,
    
    /// Tipo de input ('free_text', 'structured', etc.)
    required String type,
    
    /// Si el prompt es opcional
    @Default(true) bool optional,
    
    /// Longitud máxima de la respuesta
    @JsonKey(name: 'max_length') @Default(100) int maxLength,
    
    /// Palabras de vocabulario a practicar
    @JsonKey(name: 'vocab_practice') @Default([]) List<String> vocabPractice,
  }) = _ReflectionPrompt;

  factory ReflectionPrompt.fromJson(Map<String, dynamic> json) =>
      _$ReflectionPromptFromJson(json);
}
