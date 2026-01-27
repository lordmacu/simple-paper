// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CitySpecificContentImpl _$$CitySpecificContentImplFromJson(
  Map<String, dynamic> json,
) => _$CitySpecificContentImpl(
  officeName: json['office_name'] as String,
  defaultCompanyName: json['default_company_name'] as String,
  officeType: json['office_type'] as String,
  officeTypeEs: json['office_type_es'] as String,
);

Map<String, dynamic> _$$CitySpecificContentImplToJson(
  _$CitySpecificContentImpl instance,
) => <String, dynamic>{
  'office_name': instance.officeName,
  'default_company_name': instance.defaultCompanyName,
  'office_type': instance.officeType,
  'office_type_es': instance.officeTypeEs,
};

_$CitySettingsImpl _$$CitySettingsImplFromJson(Map<String, dynamic> json) =>
    _$CitySettingsImpl(
      defaultCity: json['default_city'] as String,
      userSelectedCity: json['user_selected_city'] as String?,
      localizable: json['localizable'] as bool? ?? true,
      citySpecificContent: CitySpecificContent.fromJson(
        json['city_specific_content'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$CitySettingsImplToJson(_$CitySettingsImpl instance) =>
    <String, dynamic>{
      'default_city': instance.defaultCity,
      'user_selected_city': instance.userSelectedCity,
      'localizable': instance.localizable,
      'city_specific_content': instance.citySpecificContent,
    };
