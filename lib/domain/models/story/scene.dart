import 'package:freezed_annotation/freezed_annotation.dart';
import 'dialogue.dart';

part 'scene.freezed.dart';
part 'scene.g.dart';

/// Representa una escena en el episodio
/// Cada escena tiene un lugar, tiempo y una serie de diálogos
@freezed
class Scene with _$Scene {
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
    
    /// Lista de diálogos en la escena
    @Default([]) List<Dialogue> dialogue,
  }) = _Scene;

  factory Scene.fromJson(Map<String, dynamic> json) =>
      _$SceneFromJson(json);
}
