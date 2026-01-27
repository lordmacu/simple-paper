// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_wrappers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContentWrappers _$ContentWrappersFromJson(Map<String, dynamic> json) {
  return _ContentWrappers.fromJson(json);
}

/// @nodoc
mixin _$ContentWrappers {
  /// Texto de introducción del episodio
  @JsonKey(name: 'intro_text')
  BilingualText get introText => throw _privateConstructorUsedError;

  /// Texto de transición (entre vocabulary story y main story)
  BilingualText get transition => throw _privateConstructorUsedError;

  /// Texto de conclusión del episodio
  BilingualText get conclusion => throw _privateConstructorUsedError;

  /// Prompt de reflexión (opcional)
  @JsonKey(name: 'reflection_prompt')
  ReflectionPrompt? get reflectionPrompt => throw _privateConstructorUsedError;

  /// Serializes this ContentWrappers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentWrappers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentWrappersCopyWith<ContentWrappers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentWrappersCopyWith<$Res> {
  factory $ContentWrappersCopyWith(
    ContentWrappers value,
    $Res Function(ContentWrappers) then,
  ) = _$ContentWrappersCopyWithImpl<$Res, ContentWrappers>;
  @useResult
  $Res call({
    @JsonKey(name: 'intro_text') BilingualText introText,
    BilingualText transition,
    BilingualText conclusion,
    @JsonKey(name: 'reflection_prompt') ReflectionPrompt? reflectionPrompt,
  });

  $BilingualTextCopyWith<$Res> get introText;
  $BilingualTextCopyWith<$Res> get transition;
  $BilingualTextCopyWith<$Res> get conclusion;
  $ReflectionPromptCopyWith<$Res>? get reflectionPrompt;
}

/// @nodoc
class _$ContentWrappersCopyWithImpl<$Res, $Val extends ContentWrappers>
    implements $ContentWrappersCopyWith<$Res> {
  _$ContentWrappersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentWrappers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? introText = null,
    Object? transition = null,
    Object? conclusion = null,
    Object? reflectionPrompt = freezed,
  }) {
    return _then(
      _value.copyWith(
            introText: null == introText
                ? _value.introText
                : introText // ignore: cast_nullable_to_non_nullable
                      as BilingualText,
            transition: null == transition
                ? _value.transition
                : transition // ignore: cast_nullable_to_non_nullable
                      as BilingualText,
            conclusion: null == conclusion
                ? _value.conclusion
                : conclusion // ignore: cast_nullable_to_non_nullable
                      as BilingualText,
            reflectionPrompt: freezed == reflectionPrompt
                ? _value.reflectionPrompt
                : reflectionPrompt // ignore: cast_nullable_to_non_nullable
                      as ReflectionPrompt?,
          )
          as $Val,
    );
  }

  /// Create a copy of ContentWrappers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BilingualTextCopyWith<$Res> get introText {
    return $BilingualTextCopyWith<$Res>(_value.introText, (value) {
      return _then(_value.copyWith(introText: value) as $Val);
    });
  }

  /// Create a copy of ContentWrappers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BilingualTextCopyWith<$Res> get transition {
    return $BilingualTextCopyWith<$Res>(_value.transition, (value) {
      return _then(_value.copyWith(transition: value) as $Val);
    });
  }

  /// Create a copy of ContentWrappers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BilingualTextCopyWith<$Res> get conclusion {
    return $BilingualTextCopyWith<$Res>(_value.conclusion, (value) {
      return _then(_value.copyWith(conclusion: value) as $Val);
    });
  }

  /// Create a copy of ContentWrappers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReflectionPromptCopyWith<$Res>? get reflectionPrompt {
    if (_value.reflectionPrompt == null) {
      return null;
    }

    return $ReflectionPromptCopyWith<$Res>(_value.reflectionPrompt!, (value) {
      return _then(_value.copyWith(reflectionPrompt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentWrappersImplCopyWith<$Res>
    implements $ContentWrappersCopyWith<$Res> {
  factory _$$ContentWrappersImplCopyWith(
    _$ContentWrappersImpl value,
    $Res Function(_$ContentWrappersImpl) then,
  ) = __$$ContentWrappersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'intro_text') BilingualText introText,
    BilingualText transition,
    BilingualText conclusion,
    @JsonKey(name: 'reflection_prompt') ReflectionPrompt? reflectionPrompt,
  });

  @override
  $BilingualTextCopyWith<$Res> get introText;
  @override
  $BilingualTextCopyWith<$Res> get transition;
  @override
  $BilingualTextCopyWith<$Res> get conclusion;
  @override
  $ReflectionPromptCopyWith<$Res>? get reflectionPrompt;
}

/// @nodoc
class __$$ContentWrappersImplCopyWithImpl<$Res>
    extends _$ContentWrappersCopyWithImpl<$Res, _$ContentWrappersImpl>
    implements _$$ContentWrappersImplCopyWith<$Res> {
  __$$ContentWrappersImplCopyWithImpl(
    _$ContentWrappersImpl _value,
    $Res Function(_$ContentWrappersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContentWrappers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? introText = null,
    Object? transition = null,
    Object? conclusion = null,
    Object? reflectionPrompt = freezed,
  }) {
    return _then(
      _$ContentWrappersImpl(
        introText: null == introText
            ? _value.introText
            : introText // ignore: cast_nullable_to_non_nullable
                  as BilingualText,
        transition: null == transition
            ? _value.transition
            : transition // ignore: cast_nullable_to_non_nullable
                  as BilingualText,
        conclusion: null == conclusion
            ? _value.conclusion
            : conclusion // ignore: cast_nullable_to_non_nullable
                  as BilingualText,
        reflectionPrompt: freezed == reflectionPrompt
            ? _value.reflectionPrompt
            : reflectionPrompt // ignore: cast_nullable_to_non_nullable
                  as ReflectionPrompt?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentWrappersImpl implements _ContentWrappers {
  const _$ContentWrappersImpl({
    @JsonKey(name: 'intro_text') required this.introText,
    required this.transition,
    required this.conclusion,
    @JsonKey(name: 'reflection_prompt') this.reflectionPrompt,
  });

  factory _$ContentWrappersImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentWrappersImplFromJson(json);

  /// Texto de introducción del episodio
  @override
  @JsonKey(name: 'intro_text')
  final BilingualText introText;

  /// Texto de transición (entre vocabulary story y main story)
  @override
  final BilingualText transition;

  /// Texto de conclusión del episodio
  @override
  final BilingualText conclusion;

  /// Prompt de reflexión (opcional)
  @override
  @JsonKey(name: 'reflection_prompt')
  final ReflectionPrompt? reflectionPrompt;

  @override
  String toString() {
    return 'ContentWrappers(introText: $introText, transition: $transition, conclusion: $conclusion, reflectionPrompt: $reflectionPrompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentWrappersImpl &&
            (identical(other.introText, introText) ||
                other.introText == introText) &&
            (identical(other.transition, transition) ||
                other.transition == transition) &&
            (identical(other.conclusion, conclusion) ||
                other.conclusion == conclusion) &&
            (identical(other.reflectionPrompt, reflectionPrompt) ||
                other.reflectionPrompt == reflectionPrompt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    introText,
    transition,
    conclusion,
    reflectionPrompt,
  );

  /// Create a copy of ContentWrappers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentWrappersImplCopyWith<_$ContentWrappersImpl> get copyWith =>
      __$$ContentWrappersImplCopyWithImpl<_$ContentWrappersImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentWrappersImplToJson(this);
  }
}

abstract class _ContentWrappers implements ContentWrappers {
  const factory _ContentWrappers({
    @JsonKey(name: 'intro_text') required final BilingualText introText,
    required final BilingualText transition,
    required final BilingualText conclusion,
    @JsonKey(name: 'reflection_prompt')
    final ReflectionPrompt? reflectionPrompt,
  }) = _$ContentWrappersImpl;

  factory _ContentWrappers.fromJson(Map<String, dynamic> json) =
      _$ContentWrappersImpl.fromJson;

  /// Texto de introducción del episodio
  @override
  @JsonKey(name: 'intro_text')
  BilingualText get introText;

  /// Texto de transición (entre vocabulary story y main story)
  @override
  BilingualText get transition;

  /// Texto de conclusión del episodio
  @override
  BilingualText get conclusion;

  /// Prompt de reflexión (opcional)
  @override
  @JsonKey(name: 'reflection_prompt')
  ReflectionPrompt? get reflectionPrompt;

  /// Create a copy of ContentWrappers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentWrappersImplCopyWith<_$ContentWrappersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BilingualText _$BilingualTextFromJson(Map<String, dynamic> json) {
  return _BilingualText.fromJson(json);
}

/// @nodoc
mixin _$BilingualText {
  /// Texto en inglés
  String get en => throw _privateConstructorUsedError;

  /// Texto en español
  String get es => throw _privateConstructorUsedError;

  /// Serializes this BilingualText to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BilingualText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BilingualTextCopyWith<BilingualText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BilingualTextCopyWith<$Res> {
  factory $BilingualTextCopyWith(
    BilingualText value,
    $Res Function(BilingualText) then,
  ) = _$BilingualTextCopyWithImpl<$Res, BilingualText>;
  @useResult
  $Res call({String en, String es});
}

/// @nodoc
class _$BilingualTextCopyWithImpl<$Res, $Val extends BilingualText>
    implements $BilingualTextCopyWith<$Res> {
  _$BilingualTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BilingualText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? en = null, Object? es = null}) {
    return _then(
      _value.copyWith(
            en: null == en
                ? _value.en
                : en // ignore: cast_nullable_to_non_nullable
                      as String,
            es: null == es
                ? _value.es
                : es // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BilingualTextImplCopyWith<$Res>
    implements $BilingualTextCopyWith<$Res> {
  factory _$$BilingualTextImplCopyWith(
    _$BilingualTextImpl value,
    $Res Function(_$BilingualTextImpl) then,
  ) = __$$BilingualTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String en, String es});
}

/// @nodoc
class __$$BilingualTextImplCopyWithImpl<$Res>
    extends _$BilingualTextCopyWithImpl<$Res, _$BilingualTextImpl>
    implements _$$BilingualTextImplCopyWith<$Res> {
  __$$BilingualTextImplCopyWithImpl(
    _$BilingualTextImpl _value,
    $Res Function(_$BilingualTextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BilingualText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? en = null, Object? es = null}) {
    return _then(
      _$BilingualTextImpl(
        en: null == en
            ? _value.en
            : en // ignore: cast_nullable_to_non_nullable
                  as String,
        es: null == es
            ? _value.es
            : es // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BilingualTextImpl implements _BilingualText {
  const _$BilingualTextImpl({required this.en, required this.es});

  factory _$BilingualTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$BilingualTextImplFromJson(json);

  /// Texto en inglés
  @override
  final String en;

  /// Texto en español
  @override
  final String es;

  @override
  String toString() {
    return 'BilingualText(en: $en, es: $es)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BilingualTextImpl &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.es, es) || other.es == es));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, en, es);

  /// Create a copy of BilingualText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BilingualTextImplCopyWith<_$BilingualTextImpl> get copyWith =>
      __$$BilingualTextImplCopyWithImpl<_$BilingualTextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BilingualTextImplToJson(this);
  }
}

abstract class _BilingualText implements BilingualText {
  const factory _BilingualText({
    required final String en,
    required final String es,
  }) = _$BilingualTextImpl;

  factory _BilingualText.fromJson(Map<String, dynamic> json) =
      _$BilingualTextImpl.fromJson;

  /// Texto en inglés
  @override
  String get en;

  /// Texto en español
  @override
  String get es;

  /// Create a copy of BilingualText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BilingualTextImplCopyWith<_$BilingualTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
