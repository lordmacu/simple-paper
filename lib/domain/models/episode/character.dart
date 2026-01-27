import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

/// Character model
@freezed
class Character with _$Character {
  /// Factory constructor
  const factory Character({
    /// Unique character ID
    @JsonKey(name: 'character_id') required String characterId,
    
    /// Default name
    @JsonKey(name: 'default_name') required String defaultName,
    
    /// Role in the office
    required String role,
    
    /// Role in Spanish
    @JsonKey(name: 'role_es') required String roleEs,
    
    /// Personality description
    required String personality,
    
    /// Personality in Spanish
    @JsonKey(name: 'personality_es') required String personalityEs,
    
    /// Is this the first appearance?
    @JsonKey(name: 'first_appearance') @Default(false) bool firstAppearance,
    
    /// Can the user customize the name?
    @JsonKey(name: 'customizable_name') @Default(false) bool customizableName,
    
    /// User's custom name for this character
    @JsonKey(name: 'user_custom_name') String? userCustomName,
    
    /// Avatar URL
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    
    /// Introduction text in English
    @JsonKey(name: 'intro_text') String? introText,
    
    /// Introduction text in Spanish
    @JsonKey(name: 'intro_text_es') String? introTextEs,
  }) = _Character;

  /// Create from JSON
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
