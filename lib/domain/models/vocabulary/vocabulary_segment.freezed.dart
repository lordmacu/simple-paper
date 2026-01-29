// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VocabularyInteractive _$VocabularyInteractiveFromJson(
  Map<String, dynamic> json,
) {
  return _VocabularyInteractive.fromJson(json);
}

/// @nodoc
mixin _$VocabularyInteractive {
  /// Type of interactive element
  String get type => throw _privateConstructorUsedError;

  /// Question in English
  String get question => throw _privateConstructorUsedError;

  /// Question in Spanish
  @JsonKey(name: 'question_es')
  String get questionEs => throw _privateConstructorUsedError;

  /// Input type
  @JsonKey(name: 'input_type')
  String get inputType => throw _privateConstructorUsedError;

  /// Variable name to save the input
  @JsonKey(name: 'save_as')
  String get saveAs => throw _privateConstructorUsedError;

  /// Example value
  String? get example => throw _privateConstructorUsedError;

  /// Serializes this VocabularyInteractive to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyInteractive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyInteractiveCopyWith<VocabularyInteractive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyInteractiveCopyWith<$Res> {
  factory $VocabularyInteractiveCopyWith(
    VocabularyInteractive value,
    $Res Function(VocabularyInteractive) then,
  ) = _$VocabularyInteractiveCopyWithImpl<$Res, VocabularyInteractive>;
  @useResult
  $Res call({
    String type,
    String question,
    @JsonKey(name: 'question_es') String questionEs,
    @JsonKey(name: 'input_type') String inputType,
    @JsonKey(name: 'save_as') String saveAs,
    String? example,
  });
}

/// @nodoc
class _$VocabularyInteractiveCopyWithImpl<
  $Res,
  $Val extends VocabularyInteractive
>
    implements $VocabularyInteractiveCopyWith<$Res> {
  _$VocabularyInteractiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyInteractive
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? question = null,
    Object? questionEs = null,
    Object? inputType = null,
    Object? saveAs = null,
    Object? example = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            questionEs: null == questionEs
                ? _value.questionEs
                : questionEs // ignore: cast_nullable_to_non_nullable
                      as String,
            inputType: null == inputType
                ? _value.inputType
                : inputType // ignore: cast_nullable_to_non_nullable
                      as String,
            saveAs: null == saveAs
                ? _value.saveAs
                : saveAs // ignore: cast_nullable_to_non_nullable
                      as String,
            example: freezed == example
                ? _value.example
                : example // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VocabularyInteractiveImplCopyWith<$Res>
    implements $VocabularyInteractiveCopyWith<$Res> {
  factory _$$VocabularyInteractiveImplCopyWith(
    _$VocabularyInteractiveImpl value,
    $Res Function(_$VocabularyInteractiveImpl) then,
  ) = __$$VocabularyInteractiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    String question,
    @JsonKey(name: 'question_es') String questionEs,
    @JsonKey(name: 'input_type') String inputType,
    @JsonKey(name: 'save_as') String saveAs,
    String? example,
  });
}

/// @nodoc
class __$$VocabularyInteractiveImplCopyWithImpl<$Res>
    extends
        _$VocabularyInteractiveCopyWithImpl<$Res, _$VocabularyInteractiveImpl>
    implements _$$VocabularyInteractiveImplCopyWith<$Res> {
  __$$VocabularyInteractiveImplCopyWithImpl(
    _$VocabularyInteractiveImpl _value,
    $Res Function(_$VocabularyInteractiveImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VocabularyInteractive
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? question = null,
    Object? questionEs = null,
    Object? inputType = null,
    Object? saveAs = null,
    Object? example = freezed,
  }) {
    return _then(
      _$VocabularyInteractiveImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        questionEs: null == questionEs
            ? _value.questionEs
            : questionEs // ignore: cast_nullable_to_non_nullable
                  as String,
        inputType: null == inputType
            ? _value.inputType
            : inputType // ignore: cast_nullable_to_non_nullable
                  as String,
        saveAs: null == saveAs
            ? _value.saveAs
            : saveAs // ignore: cast_nullable_to_non_nullable
                  as String,
        example: freezed == example
            ? _value.example
            : example // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyInteractiveImpl implements _VocabularyInteractive {
  const _$VocabularyInteractiveImpl({
    required this.type,
    required this.question,
    @JsonKey(name: 'question_es') required this.questionEs,
    @JsonKey(name: 'input_type') required this.inputType,
    @JsonKey(name: 'save_as') required this.saveAs,
    this.example,
  });

  factory _$VocabularyInteractiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyInteractiveImplFromJson(json);

  /// Type of interactive element
  @override
  final String type;

  /// Question in English
  @override
  final String question;

  /// Question in Spanish
  @override
  @JsonKey(name: 'question_es')
  final String questionEs;

  /// Input type
  @override
  @JsonKey(name: 'input_type')
  final String inputType;

  /// Variable name to save the input
  @override
  @JsonKey(name: 'save_as')
  final String saveAs;

  /// Example value
  @override
  final String? example;

  @override
  String toString() {
    return 'VocabularyInteractive(type: $type, question: $question, questionEs: $questionEs, inputType: $inputType, saveAs: $saveAs, example: $example)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyInteractiveImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.questionEs, questionEs) ||
                other.questionEs == questionEs) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            (identical(other.saveAs, saveAs) || other.saveAs == saveAs) &&
            (identical(other.example, example) || other.example == example));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    question,
    questionEs,
    inputType,
    saveAs,
    example,
  );

  /// Create a copy of VocabularyInteractive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyInteractiveImplCopyWith<_$VocabularyInteractiveImpl>
  get copyWith =>
      __$$VocabularyInteractiveImplCopyWithImpl<_$VocabularyInteractiveImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyInteractiveImplToJson(this);
  }
}

abstract class _VocabularyInteractive implements VocabularyInteractive {
  const factory _VocabularyInteractive({
    required final String type,
    required final String question,
    @JsonKey(name: 'question_es') required final String questionEs,
    @JsonKey(name: 'input_type') required final String inputType,
    @JsonKey(name: 'save_as') required final String saveAs,
    final String? example,
  }) = _$VocabularyInteractiveImpl;

  factory _VocabularyInteractive.fromJson(Map<String, dynamic> json) =
      _$VocabularyInteractiveImpl.fromJson;

  /// Type of interactive element
  @override
  String get type;

  /// Question in English
  @override
  String get question;

  /// Question in Spanish
  @override
  @JsonKey(name: 'question_es')
  String get questionEs;

  /// Input type
  @override
  @JsonKey(name: 'input_type')
  String get inputType;

  /// Variable name to save the input
  @override
  @JsonKey(name: 'save_as')
  String get saveAs;

  /// Example value
  @override
  String? get example;

  /// Create a copy of VocabularyInteractive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyInteractiveImplCopyWith<_$VocabularyInteractiveImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BilingualText _$BilingualTextFromJson(Map<String, dynamic> json) {
  return _BilingualText.fromJson(json);
}

/// @nodoc
mixin _$BilingualText {
  /// Text in English
  String get en => throw _privateConstructorUsedError;

  /// Text in Spanish
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

  /// Text in English
  @override
  final String en;

  /// Text in Spanish
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

  /// Text in English
  @override
  String get en;

  /// Text in Spanish
  @override
  String get es;

  /// Create a copy of BilingualText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BilingualTextImplCopyWith<_$BilingualTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VocabularySegment _$VocabularySegmentFromJson(Map<String, dynamic> json) {
  return _VocabularySegment.fromJson(json);
}

/// @nodoc
mixin _$VocabularySegment {
  /// Unique segment ID
  @JsonKey(name: 'segment_id')
  String get segmentId => throw _privateConstructorUsedError;

  /// Image URL
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Word being focused on
  @JsonKey(name: 'word_focus')
  String? get wordFocus => throw _privateConstructorUsedError;

  /// Text in both languages
  BilingualText get text => throw _privateConstructorUsedError;

  /// Emphasis style for the word
  @JsonKey(name: 'emphasis_style')
  String? get emphasisStyle => throw _privateConstructorUsedError;

  /// Interactive element
  VocabularyInteractive? get interactive => throw _privateConstructorUsedError;

  /// Serializes this VocabularySegment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularySegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularySegmentCopyWith<VocabularySegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularySegmentCopyWith<$Res> {
  factory $VocabularySegmentCopyWith(
    VocabularySegment value,
    $Res Function(VocabularySegment) then,
  ) = _$VocabularySegmentCopyWithImpl<$Res, VocabularySegment>;
  @useResult
  $Res call({
    @JsonKey(name: 'segment_id') String segmentId,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'word_focus') String? wordFocus,
    BilingualText text,
    @JsonKey(name: 'emphasis_style') String? emphasisStyle,
    VocabularyInteractive? interactive,
  });

  $BilingualTextCopyWith<$Res> get text;
  $VocabularyInteractiveCopyWith<$Res>? get interactive;
}

/// @nodoc
class _$VocabularySegmentCopyWithImpl<$Res, $Val extends VocabularySegment>
    implements $VocabularySegmentCopyWith<$Res> {
  _$VocabularySegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularySegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segmentId = null,
    Object? imageUrl = freezed,
    Object? wordFocus = freezed,
    Object? text = null,
    Object? emphasisStyle = freezed,
    Object? interactive = freezed,
  }) {
    return _then(
      _value.copyWith(
            segmentId: null == segmentId
                ? _value.segmentId
                : segmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            wordFocus: freezed == wordFocus
                ? _value.wordFocus
                : wordFocus // ignore: cast_nullable_to_non_nullable
                      as String?,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as BilingualText,
            emphasisStyle: freezed == emphasisStyle
                ? _value.emphasisStyle
                : emphasisStyle // ignore: cast_nullable_to_non_nullable
                      as String?,
            interactive: freezed == interactive
                ? _value.interactive
                : interactive // ignore: cast_nullable_to_non_nullable
                      as VocabularyInteractive?,
          )
          as $Val,
    );
  }

  /// Create a copy of VocabularySegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BilingualTextCopyWith<$Res> get text {
    return $BilingualTextCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }

  /// Create a copy of VocabularySegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VocabularyInteractiveCopyWith<$Res>? get interactive {
    if (_value.interactive == null) {
      return null;
    }

    return $VocabularyInteractiveCopyWith<$Res>(_value.interactive!, (value) {
      return _then(_value.copyWith(interactive: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VocabularySegmentImplCopyWith<$Res>
    implements $VocabularySegmentCopyWith<$Res> {
  factory _$$VocabularySegmentImplCopyWith(
    _$VocabularySegmentImpl value,
    $Res Function(_$VocabularySegmentImpl) then,
  ) = __$$VocabularySegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'segment_id') String segmentId,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'word_focus') String? wordFocus,
    BilingualText text,
    @JsonKey(name: 'emphasis_style') String? emphasisStyle,
    VocabularyInteractive? interactive,
  });

  @override
  $BilingualTextCopyWith<$Res> get text;
  @override
  $VocabularyInteractiveCopyWith<$Res>? get interactive;
}

/// @nodoc
class __$$VocabularySegmentImplCopyWithImpl<$Res>
    extends _$VocabularySegmentCopyWithImpl<$Res, _$VocabularySegmentImpl>
    implements _$$VocabularySegmentImplCopyWith<$Res> {
  __$$VocabularySegmentImplCopyWithImpl(
    _$VocabularySegmentImpl _value,
    $Res Function(_$VocabularySegmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VocabularySegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segmentId = null,
    Object? imageUrl = freezed,
    Object? wordFocus = freezed,
    Object? text = null,
    Object? emphasisStyle = freezed,
    Object? interactive = freezed,
  }) {
    return _then(
      _$VocabularySegmentImpl(
        segmentId: null == segmentId
            ? _value.segmentId
            : segmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        wordFocus: freezed == wordFocus
            ? _value.wordFocus
            : wordFocus // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as BilingualText,
        emphasisStyle: freezed == emphasisStyle
            ? _value.emphasisStyle
            : emphasisStyle // ignore: cast_nullable_to_non_nullable
                  as String?,
        interactive: freezed == interactive
            ? _value.interactive
            : interactive // ignore: cast_nullable_to_non_nullable
                  as VocabularyInteractive?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularySegmentImpl implements _VocabularySegment {
  const _$VocabularySegmentImpl({
    @JsonKey(name: 'segment_id') required this.segmentId,
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'word_focus') this.wordFocus,
    required this.text,
    @JsonKey(name: 'emphasis_style') this.emphasisStyle,
    this.interactive,
  });

  factory _$VocabularySegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularySegmentImplFromJson(json);

  /// Unique segment ID
  @override
  @JsonKey(name: 'segment_id')
  final String segmentId;

  /// Image URL
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  /// Word being focused on
  @override
  @JsonKey(name: 'word_focus')
  final String? wordFocus;

  /// Text in both languages
  @override
  final BilingualText text;

  /// Emphasis style for the word
  @override
  @JsonKey(name: 'emphasis_style')
  final String? emphasisStyle;

  /// Interactive element
  @override
  final VocabularyInteractive? interactive;

  @override
  String toString() {
    return 'VocabularySegment(segmentId: $segmentId, imageUrl: $imageUrl, wordFocus: $wordFocus, text: $text, emphasisStyle: $emphasisStyle, interactive: $interactive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularySegmentImpl &&
            (identical(other.segmentId, segmentId) ||
                other.segmentId == segmentId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.wordFocus, wordFocus) ||
                other.wordFocus == wordFocus) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.emphasisStyle, emphasisStyle) ||
                other.emphasisStyle == emphasisStyle) &&
            (identical(other.interactive, interactive) ||
                other.interactive == interactive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    segmentId,
    imageUrl,
    wordFocus,
    text,
    emphasisStyle,
    interactive,
  );

  /// Create a copy of VocabularySegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularySegmentImplCopyWith<_$VocabularySegmentImpl> get copyWith =>
      __$$VocabularySegmentImplCopyWithImpl<_$VocabularySegmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularySegmentImplToJson(this);
  }
}

abstract class _VocabularySegment implements VocabularySegment {
  const factory _VocabularySegment({
    @JsonKey(name: 'segment_id') required final String segmentId,
    @JsonKey(name: 'image_url') final String? imageUrl,
    @JsonKey(name: 'word_focus') final String? wordFocus,
    required final BilingualText text,
    @JsonKey(name: 'emphasis_style') final String? emphasisStyle,
    final VocabularyInteractive? interactive,
  }) = _$VocabularySegmentImpl;

  factory _VocabularySegment.fromJson(Map<String, dynamic> json) =
      _$VocabularySegmentImpl.fromJson;

  /// Unique segment ID
  @override
  @JsonKey(name: 'segment_id')
  String get segmentId;

  /// Image URL
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Word being focused on
  @override
  @JsonKey(name: 'word_focus')
  String? get wordFocus;

  /// Text in both languages
  @override
  BilingualText get text;

  /// Emphasis style for the word
  @override
  @JsonKey(name: 'emphasis_style')
  String? get emphasisStyle;

  /// Interactive element
  @override
  VocabularyInteractive? get interactive;

  /// Create a copy of VocabularySegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularySegmentImplCopyWith<_$VocabularySegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
