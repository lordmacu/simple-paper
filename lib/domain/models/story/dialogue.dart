import 'package:freezed_annotation/freezed_annotation.dart';
import 'choice.dart';

part 'dialogue.freezed.dart';
part 'dialogue.g.dart';

/// Representa una línea de diálogo en una escena
/// Puede ser de un personaje específico o interactiva (para el jugador)
@freezed
class Dialogue with _$Dialogue {
  const factory Dialogue({
    /// ID único de la línea de diálogo
    @JsonKey(name: 'line_id') required int lineId,
    
    /// ID del personaje que habla (null si es interactivo)
    @JsonKey(name: 'character_id') String? characterId,
    
    /// Nombre a mostrar del personaje
    @JsonKey(name: 'character_display_name') String? characterDisplayName,
    
    /// Texto del diálogo en inglés (null si es interactivo)
    String? text,
    
    /// Traducción al español (null si es interactivo)
    @JsonKey(name: 'translation_es') String? translationEs,
    
    /// Emoción del personaje al hablar
    String? emotion,
    
    /// Notas sobre el contexto o intención del diálogo
    String? notes,
    
    /// Notas en español
    @JsonKey(name: 'notes_es') String? notesEs,
    
    /// Palabras de vocabulario destacadas en este diálogo
    @JsonKey(name: 'highlighted_vocab') @Default([]) List<String> highlightedVocab,
    
    /// Variables de template usadas (ej: player_name, boss_name)
    @JsonKey(name: 'template_vars') @Default([]) List<String> templateVars,
    
    /// Si es true, este diálogo es una interacción del jugador
    @JsonKey(name: 'is_interactive') @Default(false) bool isInteractive,
    
    /// Tipo de interacción ('choice', 'input', etc.)
    @JsonKey(name: 'interaction_type') String? interactionType,
    
    /// Opciones de elección si es interactivo
    @Default([]) List<Choice> choices,
  }) = _Dialogue;

  factory Dialogue.fromJson(Map<String, dynamic> json) =>
      _$DialogueFromJson(json);
}
