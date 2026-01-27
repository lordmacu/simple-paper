import 'package:freezed_annotation/freezed_annotation.dart';

/// Clase abstracta base para todos los tipos de juegos
/// Cada juego específico (matching, fill_blank, multiple_choice) extiende de esta clase
abstract class Game {
  /// ID único del juego
  String get gameId;
  
  /// Tipo de juego ('matching', 'fill_blank', 'multiple_choice')
  String get gameType;
  
  /// Título del juego en inglés
  String get title;
  
  /// Título en español
  String get titleEs;
  
  /// Instrucciones en inglés
  String get instructions;
  
  /// Instrucciones en español
  String get instructionsEs;
  
  /// Si el juego es opcional (no obligatorio para progresar)
  bool get optional;
  
  /// Si se desbloquea después de completar el episodio
  bool get unlockedAfterEpisode;
  
  /// Límite de tiempo en segundos (null = sin límite)
  int? get timeLimitSeconds;
  
  /// Recompensa en XP al completar el juego
  int get xpReward;
  
  /// Convierte el juego a JSON
  Map<String, dynamic> toJson();
  
  /// Valida si una respuesta es correcta
  /// Debe ser implementado por cada tipo de juego específico
  bool validateAnswer(dynamic answer);
  
  /// Calcula la puntuación basada en respuestas y tiempo
  /// Debe ser implementado por cada tipo de juego específico
  int calculateScore(List<dynamic> answers, {int? timeSpent});
}
