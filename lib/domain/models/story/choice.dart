import 'package:freezed_annotation/freezed_annotation.dart';

part 'choice.freezed.dart';
part 'choice.g.dart';

/// Representa una opción de elección en un diálogo interactivo
@freezed
class Choice with _$Choice {
  const factory Choice({
    /// ID único de la opción (ej: "a", "b", "c")
    @JsonKey(name: 'choice_id') required String choiceId,
    
    /// Texto de la opción en inglés
    required String text,
    
    /// Traducción al español
    @JsonKey(name: 'translation_es') required String translationEs,
    
    /// Puntos otorgados al elegir esta opción
    @Default(0) int points,
    
    /// Impacto en la personalidad del jugador
    @JsonKey(name: 'personality_impact') String? personalityImpact,
    
    /// Palabras de vocabulario usadas en esta opción
    @JsonKey(name: 'vocab_used') @Default([]) List<String> vocabUsed,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) =>
      _$ChoiceFromJson(json);
}
