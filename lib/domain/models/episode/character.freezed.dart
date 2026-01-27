// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return _Character.fromJson(json);
}

/// @nodoc
mixin _$Character {
  /// Unique character ID
  @JsonKey(name: 'character_id')
  String get characterId => throw _privateConstructorUsedError;

  /// Default name
  @JsonKey(name: 'default_name')
  String get defaultName => throw _privateConstructorUsedError;

  /// Role in the office
  String get role => throw _privateConstructorUsedError;

  /// Role in Spanish
  @JsonKey(name: 'role_es')
  String get roleEs => throw _privateConstructorUsedError;

  /// Personality description
  String get personality => throw _privateConstructorUsedError;

  /// Personality in Spanish
  @JsonKey(name: 'personality_es')
  String get personalityEs => throw _privateConstructorUsedError;

  /// Is this the first appearance?
  @JsonKey(name: 'first_appearance')
  bool get firstAppearance => throw _privateConstructorUsedError;

  /// Can the user customize the name?
  @JsonKey(name: 'customizable_name')
  bool get customizableName => throw _privateConstructorUsedError;

  /// User's custom name for this character
  @JsonKey(name: 'user_custom_name')
  String? get userCustomName => throw _privateConstructorUsedError;

  /// Avatar URL
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Introduction text in English
  @JsonKey(name: 'intro_text')
  String? get introText => throw _privateConstructorUsedError;

  /// Introduction text in Spanish
  @JsonKey(name: 'intro_text_es')
  String? get introTextEs => throw _privateConstructorUsedError;

  /// Serializes this Character to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterCopyWith<Character> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) then) =
      _$CharacterCopyWithImpl<$Res, Character>;
  @useResult
  $Res call({
    @JsonKey(name: 'character_id') String characterId,
    @JsonKey(name: 'default_name') String defaultName,
    String role,
    @JsonKey(name: 'role_es') String roleEs,
    String personality,
    @JsonKey(name: 'personality_es') String personalityEs,
    @JsonKey(name: 'first_appearance') bool firstAppearance,
    @JsonKey(name: 'customizable_name') bool customizableName,
    @JsonKey(name: 'user_custom_name') String? userCustomName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'intro_text') String? introText,
    @JsonKey(name: 'intro_text_es') String? introTextEs,
  });
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res, $Val extends Character>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? defaultName = null,
    Object? role = null,
    Object? roleEs = null,
    Object? personality = null,
    Object? personalityEs = null,
    Object? firstAppearance = null,
    Object? customizableName = null,
    Object? userCustomName = freezed,
    Object? avatarUrl = freezed,
    Object? introText = freezed,
    Object? introTextEs = freezed,
  }) {
    return _then(
      _value.copyWith(
            characterId: null == characterId
                ? _value.characterId
                : characterId // ignore: cast_nullable_to_non_nullable
                      as String,
            defaultName: null == defaultName
                ? _value.defaultName
                : defaultName // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            roleEs: null == roleEs
                ? _value.roleEs
                : roleEs // ignore: cast_nullable_to_non_nullable
                      as String,
            personality: null == personality
                ? _value.personality
                : personality // ignore: cast_nullable_to_non_nullable
                      as String,
            personalityEs: null == personalityEs
                ? _value.personalityEs
                : personalityEs // ignore: cast_nullable_to_non_nullable
                      as String,
            firstAppearance: null == firstAppearance
                ? _value.firstAppearance
                : firstAppearance // ignore: cast_nullable_to_non_nullable
                      as bool,
            customizableName: null == customizableName
                ? _value.customizableName
                : customizableName // ignore: cast_nullable_to_non_nullable
                      as bool,
            userCustomName: freezed == userCustomName
                ? _value.userCustomName
                : userCustomName // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            introText: freezed == introText
                ? _value.introText
                : introText // ignore: cast_nullable_to_non_nullable
                      as String?,
            introTextEs: freezed == introTextEs
                ? _value.introTextEs
                : introTextEs // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CharacterImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$CharacterImplCopyWith(
    _$CharacterImpl value,
    $Res Function(_$CharacterImpl) then,
  ) = __$$CharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'character_id') String characterId,
    @JsonKey(name: 'default_name') String defaultName,
    String role,
    @JsonKey(name: 'role_es') String roleEs,
    String personality,
    @JsonKey(name: 'personality_es') String personalityEs,
    @JsonKey(name: 'first_appearance') bool firstAppearance,
    @JsonKey(name: 'customizable_name') bool customizableName,
    @JsonKey(name: 'user_custom_name') String? userCustomName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'intro_text') String? introText,
    @JsonKey(name: 'intro_text_es') String? introTextEs,
  });
}

/// @nodoc
class __$$CharacterImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$CharacterImpl>
    implements _$$CharacterImplCopyWith<$Res> {
  __$$CharacterImplCopyWithImpl(
    _$CharacterImpl _value,
    $Res Function(_$CharacterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? defaultName = null,
    Object? role = null,
    Object? roleEs = null,
    Object? personality = null,
    Object? personalityEs = null,
    Object? firstAppearance = null,
    Object? customizableName = null,
    Object? userCustomName = freezed,
    Object? avatarUrl = freezed,
    Object? introText = freezed,
    Object? introTextEs = freezed,
  }) {
    return _then(
      _$CharacterImpl(
        characterId: null == characterId
            ? _value.characterId
            : characterId // ignore: cast_nullable_to_non_nullable
                  as String,
        defaultName: null == defaultName
            ? _value.defaultName
            : defaultName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        roleEs: null == roleEs
            ? _value.roleEs
            : roleEs // ignore: cast_nullable_to_non_nullable
                  as String,
        personality: null == personality
            ? _value.personality
            : personality // ignore: cast_nullable_to_non_nullable
                  as String,
        personalityEs: null == personalityEs
            ? _value.personalityEs
            : personalityEs // ignore: cast_nullable_to_non_nullable
                  as String,
        firstAppearance: null == firstAppearance
            ? _value.firstAppearance
            : firstAppearance // ignore: cast_nullable_to_non_nullable
                  as bool,
        customizableName: null == customizableName
            ? _value.customizableName
            : customizableName // ignore: cast_nullable_to_non_nullable
                  as bool,
        userCustomName: freezed == userCustomName
            ? _value.userCustomName
            : userCustomName // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        introText: freezed == introText
            ? _value.introText
            : introText // ignore: cast_nullable_to_non_nullable
                  as String?,
        introTextEs: freezed == introTextEs
            ? _value.introTextEs
            : introTextEs // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterImpl implements _Character {
  const _$CharacterImpl({
    @JsonKey(name: 'character_id') required this.characterId,
    @JsonKey(name: 'default_name') required this.defaultName,
    required this.role,
    @JsonKey(name: 'role_es') required this.roleEs,
    required this.personality,
    @JsonKey(name: 'personality_es') required this.personalityEs,
    @JsonKey(name: 'first_appearance') this.firstAppearance = false,
    @JsonKey(name: 'customizable_name') this.customizableName = false,
    @JsonKey(name: 'user_custom_name') this.userCustomName,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    @JsonKey(name: 'intro_text') this.introText,
    @JsonKey(name: 'intro_text_es') this.introTextEs,
  });

  factory _$CharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterImplFromJson(json);

  /// Unique character ID
  @override
  @JsonKey(name: 'character_id')
  final String characterId;

  /// Default name
  @override
  @JsonKey(name: 'default_name')
  final String defaultName;

  /// Role in the office
  @override
  final String role;

  /// Role in Spanish
  @override
  @JsonKey(name: 'role_es')
  final String roleEs;

  /// Personality description
  @override
  final String personality;

  /// Personality in Spanish
  @override
  @JsonKey(name: 'personality_es')
  final String personalityEs;

  /// Is this the first appearance?
  @override
  @JsonKey(name: 'first_appearance')
  final bool firstAppearance;

  /// Can the user customize the name?
  @override
  @JsonKey(name: 'customizable_name')
  final bool customizableName;

  /// User's custom name for this character
  @override
  @JsonKey(name: 'user_custom_name')
  final String? userCustomName;

  /// Avatar URL
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  /// Introduction text in English
  @override
  @JsonKey(name: 'intro_text')
  final String? introText;

  /// Introduction text in Spanish
  @override
  @JsonKey(name: 'intro_text_es')
  final String? introTextEs;

  @override
  String toString() {
    return 'Character(characterId: $characterId, defaultName: $defaultName, role: $role, roleEs: $roleEs, personality: $personality, personalityEs: $personalityEs, firstAppearance: $firstAppearance, customizableName: $customizableName, userCustomName: $userCustomName, avatarUrl: $avatarUrl, introText: $introText, introTextEs: $introTextEs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterImpl &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.defaultName, defaultName) ||
                other.defaultName == defaultName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.roleEs, roleEs) || other.roleEs == roleEs) &&
            (identical(other.personality, personality) ||
                other.personality == personality) &&
            (identical(other.personalityEs, personalityEs) ||
                other.personalityEs == personalityEs) &&
            (identical(other.firstAppearance, firstAppearance) ||
                other.firstAppearance == firstAppearance) &&
            (identical(other.customizableName, customizableName) ||
                other.customizableName == customizableName) &&
            (identical(other.userCustomName, userCustomName) ||
                other.userCustomName == userCustomName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.introText, introText) ||
                other.introText == introText) &&
            (identical(other.introTextEs, introTextEs) ||
                other.introTextEs == introTextEs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    characterId,
    defaultName,
    role,
    roleEs,
    personality,
    personalityEs,
    firstAppearance,
    customizableName,
    userCustomName,
    avatarUrl,
    introText,
    introTextEs,
  );

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      __$$CharacterImplCopyWithImpl<_$CharacterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterImplToJson(this);
  }
}

abstract class _Character implements Character {
  const factory _Character({
    @JsonKey(name: 'character_id') required final String characterId,
    @JsonKey(name: 'default_name') required final String defaultName,
    required final String role,
    @JsonKey(name: 'role_es') required final String roleEs,
    required final String personality,
    @JsonKey(name: 'personality_es') required final String personalityEs,
    @JsonKey(name: 'first_appearance') final bool firstAppearance,
    @JsonKey(name: 'customizable_name') final bool customizableName,
    @JsonKey(name: 'user_custom_name') final String? userCustomName,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    @JsonKey(name: 'intro_text') final String? introText,
    @JsonKey(name: 'intro_text_es') final String? introTextEs,
  }) = _$CharacterImpl;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$CharacterImpl.fromJson;

  /// Unique character ID
  @override
  @JsonKey(name: 'character_id')
  String get characterId;

  /// Default name
  @override
  @JsonKey(name: 'default_name')
  String get defaultName;

  /// Role in the office
  @override
  String get role;

  /// Role in Spanish
  @override
  @JsonKey(name: 'role_es')
  String get roleEs;

  /// Personality description
  @override
  String get personality;

  /// Personality in Spanish
  @override
  @JsonKey(name: 'personality_es')
  String get personalityEs;

  /// Is this the first appearance?
  @override
  @JsonKey(name: 'first_appearance')
  bool get firstAppearance;

  /// Can the user customize the name?
  @override
  @JsonKey(name: 'customizable_name')
  bool get customizableName;

  /// User's custom name for this character
  @override
  @JsonKey(name: 'user_custom_name')
  String? get userCustomName;

  /// Avatar URL
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;

  /// Introduction text in English
  @override
  @JsonKey(name: 'intro_text')
  String? get introText;

  /// Introduction text in Spanish
  @override
  @JsonKey(name: 'intro_text_es')
  String? get introTextEs;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
