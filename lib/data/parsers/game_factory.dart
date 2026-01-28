import '../../domain/models/game/matching_game.dart';
import '../../domain/models/game/fill_blank_game.dart';
import '../../domain/models/game/multiple_choice_game.dart';
import '../../domain/models/game/audio_choice_game.dart';
import '../../domain/models/game/order_sentence_game.dart';
import '../../domain/models/game/typing_game.dart';
import '../../domain/models/game/spot_word_game.dart';
import '../../domain/models/game/game.dart';

/// Factory para crear instancias de juegos según su tipo
/// Implementa el patrón Factory para polimorfismo de juegos
class GameFactory {
  /// Crea un juego a partir de JSON
  /// 
  /// [json] - JSON del juego
  /// 
  /// Returns: Instancia del tipo de juego correcto (MatchingGame, FillBlankGame, MultipleChoiceGame)
  /// Throws: UnsupportedGameTypeException si el tipo de juego no es reconocido
  static Game createGame(Map<String, dynamic> json) {
    final gameType = json['game_type'] as String?;
    
    if (gameType == null) {
      throw GameParsingException('Missing game_type field in game JSON');
    }
    
    try {
      switch (gameType) {
        case 'matching':
          return MatchingGame.fromJson(json);
          
        case 'fill_blank':
          return FillBlankGame.fromJson(json);
          
        case 'multiple_choice':
          return MultipleChoiceGame.fromJson(json);
        
        case 'audio_choice':
          return AudioChoiceGame.fromJson(json);
        
        case 'order_sentence':
          return OrderSentenceGame.fromJson(json);

        case 'typing':
          return TypingGame.fromJson(json);

        case 'spot_word':
          return SpotWordGame.fromJson(json);
        
          
        default:
          throw UnsupportedGameTypeException(gameType);
      }
    } catch (e) {
      if (e is UnsupportedGameTypeException || e is GameParsingException) {
        rethrow;
      }
      throw GameParsingException(
        'Error parsing game of type "$gameType": ${e.toString()}',
      );
    }
  }
  
  /// Crea una lista de juegos a partir de un array JSON
  /// 
  /// [jsonList] - Lista de JSONs de juegos
  /// 
  /// Returns: Lista de juegos parseados
  static List<Game> createGames(List<dynamic> jsonList) {
    final games = <Game>[];
    
    for (var i = 0; i < jsonList.length; i++) {
      try {
        final gameJson = jsonList[i] as Map<String, dynamic>;
        games.add(createGame(gameJson));
      } catch (e) {
        throw GameParsingException(
          'Error parsing game at index $i: ${e.toString()}',
        );
      }
    }
    
    return games;
  }
  
  /// Valida que un JSON de juego tenga los campos requeridos
  /// 
  /// [json] - JSON a validar
  /// 
  /// Returns: true si es válido
  /// Throws: GameParsingException si falta algún campo requerido
  static bool validateGameJson(Map<String, dynamic> json) {
    final requiredFields = [
      'game_id',
      'game_type',
      'title',
      'title_es',
      'instructions',
      'instructions_es',
    ];
    
    for (final field in requiredFields) {
      if (!json.containsKey(field) || json[field] == null) {
        throw GameParsingException('Missing required field: $field');
      }
    }
    
    return true;
  }
}

/// Excepción cuando se encuentra un tipo de juego no soportado
class UnsupportedGameTypeException implements Exception {
  final String gameType;
  
  UnsupportedGameTypeException(this.gameType);
  
  @override
  String toString() => 'Unsupported game type: $gameType. '
      'Supported types: matching, fill_blank, multiple_choice, audio_choice, order_sentence, typing, spot_word';
}

/// Excepción general de parseo de juegos
class GameParsingException implements Exception {
  final String message;
  
  GameParsingException(this.message);
  
  @override
  String toString() => 'GameParsingException: $message';
}
