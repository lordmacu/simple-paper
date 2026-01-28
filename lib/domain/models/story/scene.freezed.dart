// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scene.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Scene _$SceneFromJson(Map<String, dynamic> json) {
  return _Scene.fromJson(json);
}

/// @nodoc
mixin _$Scene {
  /// ID único de la escena
  @JsonKey(name: 'scene_id')
  String get sceneId => throw _privateConstructorUsedError;

  /// Número de la escena en el episodio
  @JsonKey(name: 'scene_number')
  int get sceneNumber => throw _privateConstructorUsedError;

  /// Nombre corto de la escena en inglés
  @JsonKey(name: 'scene_name')
  String? get sceneName => throw _privateConstructorUsedError;

  /// Nombre corto en español
  @JsonKey(name: 'scene_name_es')
  String? get sceneNameEs => throw _privateConstructorUsedError;

  /// Ubicación donde ocurre la escena en inglés
  String get location => throw _privateConstructorUsedError;

  /// Ubicación en español
  @JsonKey(name: 'location_es')
  String get locationEs => throw _privateConstructorUsedError;

  /// Momento del día en inglés
  String get time => throw _privateConstructorUsedError;

  /// Momento del día en español
  @JsonKey(name: 'time_es')
  String get timeEs => throw _privateConstructorUsedError;

  /// Descripción de la escena en inglés
  String get description => throw _privateConstructorUsedError;

  /// Descripción en español
  @JsonKey(name: 'description_es')
  String get descriptionEs => throw _privateConstructorUsedError;

  /// Lista de diálogos en la escena
  List<Dialogue> get dialogue => throw _privateConstructorUsedError;

  /// Serializes this Scene to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Scene
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SceneCopyWith<Scene> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SceneCopyWith<$Res> {
  factory $SceneCopyWith(Scene value, $Res Function(Scene) then) =
      _$SceneCopyWithImpl<$Res, Scene>;
  @useResult
  $Res call({
    @JsonKey(name: 'scene_id') String sceneId,
    @JsonKey(name: 'scene_number') int sceneNumber,
    @JsonKey(name: 'scene_name') String? sceneName,
    @JsonKey(name: 'scene_name_es') String? sceneNameEs,
    String location,
    @JsonKey(name: 'location_es') String locationEs,
    String time,
    @JsonKey(name: 'time_es') String timeEs,
    String description,
    @JsonKey(name: 'description_es') String descriptionEs,
    List<Dialogue> dialogue,
  });
}

/// @nodoc
class _$SceneCopyWithImpl<$Res, $Val extends Scene>
    implements $SceneCopyWith<$Res> {
  _$SceneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Scene
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sceneId = null,
    Object? sceneNumber = null,
    Object? sceneName = freezed,
    Object? sceneNameEs = freezed,
    Object? location = null,
    Object? locationEs = null,
    Object? time = null,
    Object? timeEs = null,
    Object? description = null,
    Object? descriptionEs = null,
    Object? dialogue = null,
  }) {
    return _then(
      _value.copyWith(
            sceneId: null == sceneId
                ? _value.sceneId
                : sceneId // ignore: cast_nullable_to_non_nullable
                      as String,
            sceneNumber: null == sceneNumber
                ? _value.sceneNumber
                : sceneNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            sceneName: freezed == sceneName
                ? _value.sceneName
                : sceneName // ignore: cast_nullable_to_non_nullable
                      as String?,
            sceneNameEs: freezed == sceneNameEs
                ? _value.sceneNameEs
                : sceneNameEs // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            locationEs: null == locationEs
                ? _value.locationEs
                : locationEs // ignore: cast_nullable_to_non_nullable
                      as String,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            timeEs: null == timeEs
                ? _value.timeEs
                : timeEs // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionEs: null == descriptionEs
                ? _value.descriptionEs
                : descriptionEs // ignore: cast_nullable_to_non_nullable
                      as String,
            dialogue: null == dialogue
                ? _value.dialogue
                : dialogue // ignore: cast_nullable_to_non_nullable
                      as List<Dialogue>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SceneImplCopyWith<$Res> implements $SceneCopyWith<$Res> {
  factory _$$SceneImplCopyWith(
    _$SceneImpl value,
    $Res Function(_$SceneImpl) then,
  ) = __$$SceneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'scene_id') String sceneId,
    @JsonKey(name: 'scene_number') int sceneNumber,
    @JsonKey(name: 'scene_name') String? sceneName,
    @JsonKey(name: 'scene_name_es') String? sceneNameEs,
    String location,
    @JsonKey(name: 'location_es') String locationEs,
    String time,
    @JsonKey(name: 'time_es') String timeEs,
    String description,
    @JsonKey(name: 'description_es') String descriptionEs,
    List<Dialogue> dialogue,
  });
}

/// @nodoc
class __$$SceneImplCopyWithImpl<$Res>
    extends _$SceneCopyWithImpl<$Res, _$SceneImpl>
    implements _$$SceneImplCopyWith<$Res> {
  __$$SceneImplCopyWithImpl(
    _$SceneImpl _value,
    $Res Function(_$SceneImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Scene
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sceneId = null,
    Object? sceneNumber = null,
    Object? sceneName = freezed,
    Object? sceneNameEs = freezed,
    Object? location = null,
    Object? locationEs = null,
    Object? time = null,
    Object? timeEs = null,
    Object? description = null,
    Object? descriptionEs = null,
    Object? dialogue = null,
  }) {
    return _then(
      _$SceneImpl(
        sceneId: null == sceneId
            ? _value.sceneId
            : sceneId // ignore: cast_nullable_to_non_nullable
                  as String,
        sceneNumber: null == sceneNumber
            ? _value.sceneNumber
            : sceneNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        sceneName: freezed == sceneName
            ? _value.sceneName
            : sceneName // ignore: cast_nullable_to_non_nullable
                  as String?,
        sceneNameEs: freezed == sceneNameEs
            ? _value.sceneNameEs
            : sceneNameEs // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        locationEs: null == locationEs
            ? _value.locationEs
            : locationEs // ignore: cast_nullable_to_non_nullable
                  as String,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        timeEs: null == timeEs
            ? _value.timeEs
            : timeEs // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionEs: null == descriptionEs
            ? _value.descriptionEs
            : descriptionEs // ignore: cast_nullable_to_non_nullable
                  as String,
        dialogue: null == dialogue
            ? _value._dialogue
            : dialogue // ignore: cast_nullable_to_non_nullable
                  as List<Dialogue>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SceneImpl implements _Scene {
  const _$SceneImpl({
    @JsonKey(name: 'scene_id') required this.sceneId,
    @JsonKey(name: 'scene_number') required this.sceneNumber,
    @JsonKey(name: 'scene_name') this.sceneName,
    @JsonKey(name: 'scene_name_es') this.sceneNameEs,
    required this.location,
    @JsonKey(name: 'location_es') required this.locationEs,
    required this.time,
    @JsonKey(name: 'time_es') required this.timeEs,
    required this.description,
    @JsonKey(name: 'description_es') required this.descriptionEs,
    final List<Dialogue> dialogue = const [],
  }) : _dialogue = dialogue;

  factory _$SceneImpl.fromJson(Map<String, dynamic> json) =>
      _$$SceneImplFromJson(json);

  /// ID único de la escena
  @override
  @JsonKey(name: 'scene_id')
  final String sceneId;

  /// Número de la escena en el episodio
  @override
  @JsonKey(name: 'scene_number')
  final int sceneNumber;

  /// Nombre corto de la escena en inglés
  @override
  @JsonKey(name: 'scene_name')
  final String? sceneName;

  /// Nombre corto en español
  @override
  @JsonKey(name: 'scene_name_es')
  final String? sceneNameEs;

  /// Ubicación donde ocurre la escena en inglés
  @override
  final String location;

  /// Ubicación en español
  @override
  @JsonKey(name: 'location_es')
  final String locationEs;

  /// Momento del día en inglés
  @override
  final String time;

  /// Momento del día en español
  @override
  @JsonKey(name: 'time_es')
  final String timeEs;

  /// Descripción de la escena en inglés
  @override
  final String description;

  /// Descripción en español
  @override
  @JsonKey(name: 'description_es')
  final String descriptionEs;

  /// Lista de diálogos en la escena
  final List<Dialogue> _dialogue;

  /// Lista de diálogos en la escena
  @override
  @JsonKey()
  List<Dialogue> get dialogue {
    if (_dialogue is EqualUnmodifiableListView) return _dialogue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dialogue);
  }

  @override
  String toString() {
    return 'Scene(sceneId: $sceneId, sceneNumber: $sceneNumber, sceneName: $sceneName, sceneNameEs: $sceneNameEs, location: $location, locationEs: $locationEs, time: $time, timeEs: $timeEs, description: $description, descriptionEs: $descriptionEs, dialogue: $dialogue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SceneImpl &&
            (identical(other.sceneId, sceneId) || other.sceneId == sceneId) &&
            (identical(other.sceneNumber, sceneNumber) ||
                other.sceneNumber == sceneNumber) &&
            (identical(other.sceneName, sceneName) ||
                other.sceneName == sceneName) &&
            (identical(other.sceneNameEs, sceneNameEs) ||
                other.sceneNameEs == sceneNameEs) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationEs, locationEs) ||
                other.locationEs == locationEs) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.timeEs, timeEs) || other.timeEs == timeEs) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionEs, descriptionEs) ||
                other.descriptionEs == descriptionEs) &&
            const DeepCollectionEquality().equals(other._dialogue, _dialogue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sceneId,
    sceneNumber,
    sceneName,
    sceneNameEs,
    location,
    locationEs,
    time,
    timeEs,
    description,
    descriptionEs,
    const DeepCollectionEquality().hash(_dialogue),
  );

  /// Create a copy of Scene
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SceneImplCopyWith<_$SceneImpl> get copyWith =>
      __$$SceneImplCopyWithImpl<_$SceneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SceneImplToJson(this);
  }
}

abstract class _Scene implements Scene {
  const factory _Scene({
    @JsonKey(name: 'scene_id') required final String sceneId,
    @JsonKey(name: 'scene_number') required final int sceneNumber,
    @JsonKey(name: 'scene_name') final String? sceneName,
    @JsonKey(name: 'scene_name_es') final String? sceneNameEs,
    required final String location,
    @JsonKey(name: 'location_es') required final String locationEs,
    required final String time,
    @JsonKey(name: 'time_es') required final String timeEs,
    required final String description,
    @JsonKey(name: 'description_es') required final String descriptionEs,
    final List<Dialogue> dialogue,
  }) = _$SceneImpl;

  factory _Scene.fromJson(Map<String, dynamic> json) = _$SceneImpl.fromJson;

  /// ID único de la escena
  @override
  @JsonKey(name: 'scene_id')
  String get sceneId;

  /// Número de la escena en el episodio
  @override
  @JsonKey(name: 'scene_number')
  int get sceneNumber;

  /// Nombre corto de la escena en inglés
  @override
  @JsonKey(name: 'scene_name')
  String? get sceneName;

  /// Nombre corto en español
  @override
  @JsonKey(name: 'scene_name_es')
  String? get sceneNameEs;

  /// Ubicación donde ocurre la escena en inglés
  @override
  String get location;

  /// Ubicación en español
  @override
  @JsonKey(name: 'location_es')
  String get locationEs;

  /// Momento del día en inglés
  @override
  String get time;

  /// Momento del día en español
  @override
  @JsonKey(name: 'time_es')
  String get timeEs;

  /// Descripción de la escena en inglés
  @override
  String get description;

  /// Descripción en español
  @override
  @JsonKey(name: 'description_es')
  String get descriptionEs;

  /// Lista de diálogos en la escena
  @override
  List<Dialogue> get dialogue;

  /// Create a copy of Scene
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SceneImplCopyWith<_$SceneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
