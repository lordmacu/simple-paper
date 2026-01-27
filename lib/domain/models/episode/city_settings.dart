import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_settings.freezed.dart';
part 'city_settings.g.dart';

/// City-specific content
@freezed
class CitySpecificContent with _$CitySpecificContent {
  /// Factory constructor
  const factory CitySpecificContent({
    /// Office name template
    @JsonKey(name: 'office_name') required String officeName,
    
    /// Default company name
    @JsonKey(name: 'default_company_name') required String defaultCompanyName,
    
    /// Office type
    @JsonKey(name: 'office_type') required String officeType,
    
    /// Office type in Spanish
    @JsonKey(name: 'office_type_es') required String officeTypeEs,
  }) = _CitySpecificContent;

  /// Create from JSON
  factory CitySpecificContent.fromJson(Map<String, dynamic> json) =>
      _$CitySpecificContentFromJson(json);
}

/// City settings for an episode
@freezed
class CitySettings with _$CitySettings {
  /// Factory constructor
  const factory CitySettings({
    /// Default city
    @JsonKey(name: 'default_city') required String defaultCity,
    
    /// User-selected city
    @JsonKey(name: 'user_selected_city') String? userSelectedCity,
    
    /// Can the city be localized?
    @Default(true) bool localizable,
    
    /// City-specific content
    @JsonKey(name: 'city_specific_content')
        required CitySpecificContent citySpecificContent,
  }) = _CitySettings;

  /// Create from JSON
  factory CitySettings.fromJson(Map<String, dynamic> json) =>
      _$CitySettingsFromJson(json);
}
