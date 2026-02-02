import 'package:freezed_annotation/freezed_annotation.dart';
import 'dialogue.dart';

part 'scene.freezed.dart';
part 'scene.g.dart';

/// Representa una escena en el episodio
/// Cada escena tiene un lugar, tiempo y una serie de diálogos
@freezed
class Scene with _$Scene {
  /// Crea una escena.
  ///
  /// Parámetros:
  /// - [sceneId]: ID único de la escena
  /// - [sceneNumber]: Número de la escena en el episodio
  /// - [location]: Ubicación donde ocurre la escena en inglés
  /// - [locationEs]: Ubicación en español
  /// - [time]: Momento del día en inglés
  /// - [timeEs]: Momento del día en español
  /// - [description]: Descripción de la escena en inglés
  /// - [descriptionEs]: Descripción en español
  /// - [sceneName]: Nombre corto de la escena en inglés
  /// - [sceneNameEs]: Nombre corto en español
  /// - [dialogue]: Lista de diálogos en la escena
  const factory Scene({
    /// ID único de la escena
    @JsonKey(name: 'scene_id') required String sceneId,
    
    /// Número de la escena en el episodio
    @JsonKey(name: 'scene_number') required int sceneNumber,

    /// Ubicación donde ocurre la escena en inglés
    required String location,
    
    /// Ubicación en español
    @JsonKey(name: 'location_es') required String locationEs,
    
    /// Momento del día en inglés
    required String time,
    
    /// Momento del día en español
    @JsonKey(name: 'time_es') required String timeEs,
    
    /// Descripción de la escena en inglés
    required String description,
    
    /// Descripción en español
    @JsonKey(name: 'description_es') required String descriptionEs,
    
    /// Nombre corto de la escena en inglés
    @JsonKey(name: 'scene_name') String? sceneName,

    /// Nombre corto en español
    @JsonKey(name: 'scene_name_es') String? sceneNameEs,
    
    /// Lista de diálogos en la escena
    @Default([]) List<Dialogue> dialogue,
  }) = _Scene;

  /// Crea Scene desde JSON.
  factory Scene.fromJson(Map<String, dynamic> json) =>
      _$SceneFromJson(json);
}
