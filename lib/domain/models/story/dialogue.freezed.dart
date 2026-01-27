// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialogue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Dialogue _$DialogueFromJson(Map<String, dynamic> json) {
  return _Dialogue.fromJson(json);
}

/// @nodoc
mixin _$Dialogue {
  /// ID único de la línea de diálogo
  @JsonKey(name: 'line_id')
  int get lineId => throw _privateConstructorUsedError;

  /// ID del personaje que habla (null si es interactivo)
  @JsonKey(name: 'character_id')
  String? get characterId => throw _privateConstructorUsedError;

  /// Nombre a mostrar del personaje
  @JsonKey(name: 'character_display_name')
  String? get characterDisplayName => throw _privateConstructorUsedError;

  /// Texto del diálogo en inglés (null si es interactivo)
  String? get text => throw _privateConstructorUsedError;

  /// Traducción al español (null si es interactivo)
  @JsonKey(name: 'translation_es')
  String? get translationEs => throw _privateConstructorUsedError;

  /// Emoción del personaje al hablar
  String? get emotion => throw _privateConstructorUsedError;

  /// Notas sobre el contexto o intención del diálogo
  String? get notes => throw _privateConstructorUsedError;

  /// Notas en español
  @JsonKey(name: 'notes_es')
  String? get notesEs => throw _privateConstructorUsedError;

  /// Palabras de vocabulario destacadas en este diálogo
  @JsonKey(name: 'highlighted_vocab')
  List<String> get highlightedVocab => throw _privateConstructorUsedError;

  /// Variables de template usadas (ej: player_name, boss_name)
  @JsonKey(name: 'template_vars')
  List<String> get templateVars => throw _privateConstructorUsedError;

  /// Si es true, este diálogo es una interacción del jugador
  @JsonKey(name: 'is_interactive')
  bool get isInteractive => throw _privateConstructorUsedError;

  /// Tipo de interacción ('choice', 'input', etc.)
  @JsonKey(name: 'interaction_type')
  String? get interactionType => throw _privateConstructorUsedError;

  /// Opciones de elección si es interactivo
  List<Choice> get choices => throw _privateConstructorUsedError;

  /// Serializes this Dialogue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dialogue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DialogueCopyWith<Dialogue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogueCopyWith<$Res> {
  factory $DialogueCopyWith(Dialogue value, $Res Function(Dialogue) then) =
      _$DialogueCopyWithImpl<$Res, Dialogue>;
  @useResult
  $Res call({
    @JsonKey(name: 'line_id') int lineId,
    @JsonKey(name: 'character_id') String? characterId,
    @JsonKey(name: 'character_display_name') String? characterDisplayName,
    String? text,
    @JsonKey(name: 'translation_es') String? translationEs,
    String? emotion,
    String? notes,
    @JsonKey(name: 'notes_es') String? notesEs,
    @JsonKey(name: 'highlighted_vocab') List<String> highlightedVocab,
    @JsonKey(name: 'template_vars') List<String> templateVars,
    @JsonKey(name: 'is_interactive') bool isInteractive,
    @JsonKey(name: 'interaction_type') String? interactionType,
    List<Choice> choices,
  });
}

/// @nodoc
class _$DialogueCopyWithImpl<$Res, $Val extends Dialogue>
    implements $DialogueCopyWith<$Res> {
  _$DialogueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Dialogue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineId = null,
    Object? characterId = freezed,
    Object? characterDisplayName = freezed,
    Object? text = freezed,
    Object? translationEs = freezed,
    Object? emotion = freezed,
    Object? notes = freezed,
    Object? notesEs = freezed,
    Object? highlightedVocab = null,
    Object? templateVars = null,
    Object? isInteractive = null,
    Object? interactionType = freezed,
    Object? choices = null,
  }) {
    return _then(
      _value.copyWith(
            lineId: null == lineId
                ? _value.lineId
                : lineId // ignore: cast_nullable_to_non_nullable
                      as int,
            characterId: freezed == characterId
                ? _value.characterId
                : characterId // ignore: cast_nullable_to_non_nullable
                      as String?,
            characterDisplayName: freezed == characterDisplayName
                ? _value.characterDisplayName
                : characterDisplayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            translationEs: freezed == translationEs
                ? _value.translationEs
                : translationEs // ignore: cast_nullable_to_non_nullable
                      as String?,
            emotion: freezed == emotion
                ? _value.emotion
                : emotion // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            notesEs: freezed == notesEs
                ? _value.notesEs
                : notesEs // ignore: cast_nullable_to_non_nullable
                      as String?,
            highlightedVocab: null == highlightedVocab
                ? _value.highlightedVocab
                : highlightedVocab // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            templateVars: null == templateVars
                ? _value.templateVars
                : templateVars // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isInteractive: null == isInteractive
                ? _value.isInteractive
                : isInteractive // ignore: cast_nullable_to_non_nullable
                      as bool,
            interactionType: freezed == interactionType
                ? _value.interactionType
                : interactionType // ignore: cast_nullable_to_non_nullable
                      as String?,
            choices: null == choices
                ? _value.choices
                : choices // ignore: cast_nullable_to_non_nullable
                      as List<Choice>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DialogueImplCopyWith<$Res>
    implements $DialogueCopyWith<$Res> {
  factory _$$DialogueImplCopyWith(
    _$DialogueImpl value,
    $Res Function(_$DialogueImpl) then,
  ) = __$$DialogueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'line_id') int lineId,
    @JsonKey(name: 'character_id') String? characterId,
    @JsonKey(name: 'character_display_name') String? characterDisplayName,
    String? text,
    @JsonKey(name: 'translation_es') String? translationEs,
    String? emotion,
    String? notes,
    @JsonKey(name: 'notes_es') String? notesEs,
    @JsonKey(name: 'highlighted_vocab') List<String> highlightedVocab,
    @JsonKey(name: 'template_vars') List<String> templateVars,
    @JsonKey(name: 'is_interactive') bool isInteractive,
    @JsonKey(name: 'interaction_type') String? interactionType,
    List<Choice> choices,
  });
}

/// @nodoc
class __$$DialogueImplCopyWithImpl<$Res>
    extends _$DialogueCopyWithImpl<$Res, _$DialogueImpl>
    implements _$$DialogueImplCopyWith<$Res> {
  __$$DialogueImplCopyWithImpl(
    _$DialogueImpl _value,
    $Res Function(_$DialogueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Dialogue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineId = null,
    Object? characterId = freezed,
    Object? characterDisplayName = freezed,
    Object? text = freezed,
    Object? translationEs = freezed,
    Object? emotion = freezed,
    Object? notes = freezed,
    Object? notesEs = freezed,
    Object? highlightedVocab = null,
    Object? templateVars = null,
    Object? isInteractive = null,
    Object? interactionType = freezed,
    Object? choices = null,
  }) {
    return _then(
      _$DialogueImpl(
        lineId: null == lineId
            ? _value.lineId
            : lineId // ignore: cast_nullable_to_non_nullable
                  as int,
        characterId: freezed == characterId
            ? _value.characterId
            : characterId // ignore: cast_nullable_to_non_nullable
                  as String?,
        characterDisplayName: freezed == characterDisplayName
            ? _value.characterDisplayName
            : characterDisplayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        translationEs: freezed == translationEs
            ? _value.translationEs
            : translationEs // ignore: cast_nullable_to_non_nullable
                  as String?,
        emotion: freezed == emotion
            ? _value.emotion
            : emotion // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        notesEs: freezed == notesEs
            ? _value.notesEs
            : notesEs // ignore: cast_nullable_to_non_nullable
                  as String?,
        highlightedVocab: null == highlightedVocab
            ? _value._highlightedVocab
            : highlightedVocab // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        templateVars: null == templateVars
            ? _value._templateVars
            : templateVars // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isInteractive: null == isInteractive
            ? _value.isInteractive
            : isInteractive // ignore: cast_nullable_to_non_nullable
                  as bool,
        interactionType: freezed == interactionType
            ? _value.interactionType
            : interactionType // ignore: cast_nullable_to_non_nullable
                  as String?,
        choices: null == choices
            ? _value._choices
            : choices // ignore: cast_nullable_to_non_nullable
                  as List<Choice>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DialogueImpl implements _Dialogue {
  const _$DialogueImpl({
    @JsonKey(name: 'line_id') required this.lineId,
    @JsonKey(name: 'character_id') this.characterId,
    @JsonKey(name: 'character_display_name') this.characterDisplayName,
    this.text,
    @JsonKey(name: 'translation_es') this.translationEs,
    this.emotion,
    this.notes,
    @JsonKey(name: 'notes_es') this.notesEs,
    @JsonKey(name: 'highlighted_vocab')
    final List<String> highlightedVocab = const [],
    @JsonKey(name: 'template_vars') final List<String> templateVars = const [],
    @JsonKey(name: 'is_interactive') this.isInteractive = false,
    @JsonKey(name: 'interaction_type') this.interactionType,
    final List<Choice> choices = const [],
  }) : _highlightedVocab = highlightedVocab,
       _templateVars = templateVars,
       _choices = choices;

  factory _$DialogueImpl.fromJson(Map<String, dynamic> json) =>
      _$$DialogueImplFromJson(json);

  /// ID único de la línea de diálogo
  @override
  @JsonKey(name: 'line_id')
  final int lineId;

  /// ID del personaje que habla (null si es interactivo)
  @override
  @JsonKey(name: 'character_id')
  final String? characterId;

  /// Nombre a mostrar del personaje
  @override
  @JsonKey(name: 'character_display_name')
  final String? characterDisplayName;

  /// Texto del diálogo en inglés (null si es interactivo)
  @override
  final String? text;

  /// Traducción al español (null si es interactivo)
  @override
  @JsonKey(name: 'translation_es')
  final String? translationEs;

  /// Emoción del personaje al hablar
  @override
  final String? emotion;

  /// Notas sobre el contexto o intención del diálogo
  @override
  final String? notes;

  /// Notas en español
  @override
  @JsonKey(name: 'notes_es')
  final String? notesEs;

  /// Palabras de vocabulario destacadas en este diálogo
  final List<String> _highlightedVocab;

  /// Palabras de vocabulario destacadas en este diálogo
  @override
  @JsonKey(name: 'highlighted_vocab')
  List<String> get highlightedVocab {
    if (_highlightedVocab is EqualUnmodifiableListView)
      return _highlightedVocab;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightedVocab);
  }

  /// Variables de template usadas (ej: player_name, boss_name)
  final List<String> _templateVars;

  /// Variables de template usadas (ej: player_name, boss_name)
  @override
  @JsonKey(name: 'template_vars')
  List<String> get templateVars {
    if (_templateVars is EqualUnmodifiableListView) return _templateVars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templateVars);
  }

  /// Si es true, este diálogo es una interacción del jugador
  @override
  @JsonKey(name: 'is_interactive')
  final bool isInteractive;

  /// Tipo de interacción ('choice', 'input', etc.)
  @override
  @JsonKey(name: 'interaction_type')
  final String? interactionType;

  /// Opciones de elección si es interactivo
  final List<Choice> _choices;

  /// Opciones de elección si es interactivo
  @override
  @JsonKey()
  List<Choice> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'Dialogue(lineId: $lineId, characterId: $characterId, characterDisplayName: $characterDisplayName, text: $text, translationEs: $translationEs, emotion: $emotion, notes: $notes, notesEs: $notesEs, highlightedVocab: $highlightedVocab, templateVars: $templateVars, isInteractive: $isInteractive, interactionType: $interactionType, choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DialogueImpl &&
            (identical(other.lineId, lineId) || other.lineId == lineId) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.characterDisplayName, characterDisplayName) ||
                other.characterDisplayName == characterDisplayName) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.translationEs, translationEs) ||
                other.translationEs == translationEs) &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.notesEs, notesEs) || other.notesEs == notesEs) &&
            const DeepCollectionEquality().equals(
              other._highlightedVocab,
              _highlightedVocab,
            ) &&
            const DeepCollectionEquality().equals(
              other._templateVars,
              _templateVars,
            ) &&
            (identical(other.isInteractive, isInteractive) ||
                other.isInteractive == isInteractive) &&
            (identical(other.interactionType, interactionType) ||
                other.interactionType == interactionType) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lineId,
    characterId,
    characterDisplayName,
    text,
    translationEs,
    emotion,
    notes,
    notesEs,
    const DeepCollectionEquality().hash(_highlightedVocab),
    const DeepCollectionEquality().hash(_templateVars),
    isInteractive,
    interactionType,
    const DeepCollectionEquality().hash(_choices),
  );

  /// Create a copy of Dialogue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DialogueImplCopyWith<_$DialogueImpl> get copyWith =>
      __$$DialogueImplCopyWithImpl<_$DialogueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DialogueImplToJson(this);
  }
}

abstract class _Dialogue implements Dialogue {
  const factory _Dialogue({
    @JsonKey(name: 'line_id') required final int lineId,
    @JsonKey(name: 'character_id') final String? characterId,
    @JsonKey(name: 'character_display_name') final String? characterDisplayName,
    final String? text,
    @JsonKey(name: 'translation_es') final String? translationEs,
    final String? emotion,
    final String? notes,
    @JsonKey(name: 'notes_es') final String? notesEs,
    @JsonKey(name: 'highlighted_vocab') final List<String> highlightedVocab,
    @JsonKey(name: 'template_vars') final List<String> templateVars,
    @JsonKey(name: 'is_interactive') final bool isInteractive,
    @JsonKey(name: 'interaction_type') final String? interactionType,
    final List<Choice> choices,
  }) = _$DialogueImpl;

  factory _Dialogue.fromJson(Map<String, dynamic> json) =
      _$DialogueImpl.fromJson;

  /// ID único de la línea de diálogo
  @override
  @JsonKey(name: 'line_id')
  int get lineId;

  /// ID del personaje que habla (null si es interactivo)
  @override
  @JsonKey(name: 'character_id')
  String? get characterId;

  /// Nombre a mostrar del personaje
  @override
  @JsonKey(name: 'character_display_name')
  String? get characterDisplayName;

  /// Texto del diálogo en inglés (null si es interactivo)
  @override
  String? get text;

  /// Traducción al español (null si es interactivo)
  @override
  @JsonKey(name: 'translation_es')
  String? get translationEs;

  /// Emoción del personaje al hablar
  @override
  String? get emotion;

  /// Notas sobre el contexto o intención del diálogo
  @override
  String? get notes;

  /// Notas en español
  @override
  @JsonKey(name: 'notes_es')
  String? get notesEs;

  /// Palabras de vocabulario destacadas en este diálogo
  @override
  @JsonKey(name: 'highlighted_vocab')
  List<String> get highlightedVocab;

  /// Variables de template usadas (ej: player_name, boss_name)
  @override
  @JsonKey(name: 'template_vars')
  List<String> get templateVars;

  /// Si es true, este diálogo es una interacción del jugador
  @override
  @JsonKey(name: 'is_interactive')
  bool get isInteractive;

  /// Tipo de interacción ('choice', 'input', etc.)
  @override
  @JsonKey(name: 'interaction_type')
  String? get interactionType;

  /// Opciones de elección si es interactivo
  @override
  List<Choice> get choices;

  /// Create a copy of Dialogue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DialogueImplCopyWith<_$DialogueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
