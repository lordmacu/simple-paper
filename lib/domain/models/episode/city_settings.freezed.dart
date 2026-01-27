// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CitySpecificContent _$CitySpecificContentFromJson(Map<String, dynamic> json) {
  return _CitySpecificContent.fromJson(json);
}

/// @nodoc
mixin _$CitySpecificContent {
  /// Office name template
  @JsonKey(name: 'office_name')
  String get officeName => throw _privateConstructorUsedError;

  /// Default company name
  @JsonKey(name: 'default_company_name')
  String get defaultCompanyName => throw _privateConstructorUsedError;

  /// Office type
  @JsonKey(name: 'office_type')
  String get officeType => throw _privateConstructorUsedError;

  /// Office type in Spanish
  @JsonKey(name: 'office_type_es')
  String get officeTypeEs => throw _privateConstructorUsedError;

  /// Serializes this CitySpecificContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CitySpecificContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CitySpecificContentCopyWith<CitySpecificContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitySpecificContentCopyWith<$Res> {
  factory $CitySpecificContentCopyWith(
    CitySpecificContent value,
    $Res Function(CitySpecificContent) then,
  ) = _$CitySpecificContentCopyWithImpl<$Res, CitySpecificContent>;
  @useResult
  $Res call({
    @JsonKey(name: 'office_name') String officeName,
    @JsonKey(name: 'default_company_name') String defaultCompanyName,
    @JsonKey(name: 'office_type') String officeType,
    @JsonKey(name: 'office_type_es') String officeTypeEs,
  });
}

/// @nodoc
class _$CitySpecificContentCopyWithImpl<$Res, $Val extends CitySpecificContent>
    implements $CitySpecificContentCopyWith<$Res> {
  _$CitySpecificContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CitySpecificContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeName = null,
    Object? defaultCompanyName = null,
    Object? officeType = null,
    Object? officeTypeEs = null,
  }) {
    return _then(
      _value.copyWith(
            officeName: null == officeName
                ? _value.officeName
                : officeName // ignore: cast_nullable_to_non_nullable
                      as String,
            defaultCompanyName: null == defaultCompanyName
                ? _value.defaultCompanyName
                : defaultCompanyName // ignore: cast_nullable_to_non_nullable
                      as String,
            officeType: null == officeType
                ? _value.officeType
                : officeType // ignore: cast_nullable_to_non_nullable
                      as String,
            officeTypeEs: null == officeTypeEs
                ? _value.officeTypeEs
                : officeTypeEs // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CitySpecificContentImplCopyWith<$Res>
    implements $CitySpecificContentCopyWith<$Res> {
  factory _$$CitySpecificContentImplCopyWith(
    _$CitySpecificContentImpl value,
    $Res Function(_$CitySpecificContentImpl) then,
  ) = __$$CitySpecificContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'office_name') String officeName,
    @JsonKey(name: 'default_company_name') String defaultCompanyName,
    @JsonKey(name: 'office_type') String officeType,
    @JsonKey(name: 'office_type_es') String officeTypeEs,
  });
}

/// @nodoc
class __$$CitySpecificContentImplCopyWithImpl<$Res>
    extends _$CitySpecificContentCopyWithImpl<$Res, _$CitySpecificContentImpl>
    implements _$$CitySpecificContentImplCopyWith<$Res> {
  __$$CitySpecificContentImplCopyWithImpl(
    _$CitySpecificContentImpl _value,
    $Res Function(_$CitySpecificContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CitySpecificContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeName = null,
    Object? defaultCompanyName = null,
    Object? officeType = null,
    Object? officeTypeEs = null,
  }) {
    return _then(
      _$CitySpecificContentImpl(
        officeName: null == officeName
            ? _value.officeName
            : officeName // ignore: cast_nullable_to_non_nullable
                  as String,
        defaultCompanyName: null == defaultCompanyName
            ? _value.defaultCompanyName
            : defaultCompanyName // ignore: cast_nullable_to_non_nullable
                  as String,
        officeType: null == officeType
            ? _value.officeType
            : officeType // ignore: cast_nullable_to_non_nullable
                  as String,
        officeTypeEs: null == officeTypeEs
            ? _value.officeTypeEs
            : officeTypeEs // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CitySpecificContentImpl implements _CitySpecificContent {
  const _$CitySpecificContentImpl({
    @JsonKey(name: 'office_name') required this.officeName,
    @JsonKey(name: 'default_company_name') required this.defaultCompanyName,
    @JsonKey(name: 'office_type') required this.officeType,
    @JsonKey(name: 'office_type_es') required this.officeTypeEs,
  });

  factory _$CitySpecificContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitySpecificContentImplFromJson(json);

  /// Office name template
  @override
  @JsonKey(name: 'office_name')
  final String officeName;

  /// Default company name
  @override
  @JsonKey(name: 'default_company_name')
  final String defaultCompanyName;

  /// Office type
  @override
  @JsonKey(name: 'office_type')
  final String officeType;

  /// Office type in Spanish
  @override
  @JsonKey(name: 'office_type_es')
  final String officeTypeEs;

  @override
  String toString() {
    return 'CitySpecificContent(officeName: $officeName, defaultCompanyName: $defaultCompanyName, officeType: $officeType, officeTypeEs: $officeTypeEs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitySpecificContentImpl &&
            (identical(other.officeName, officeName) ||
                other.officeName == officeName) &&
            (identical(other.defaultCompanyName, defaultCompanyName) ||
                other.defaultCompanyName == defaultCompanyName) &&
            (identical(other.officeType, officeType) ||
                other.officeType == officeType) &&
            (identical(other.officeTypeEs, officeTypeEs) ||
                other.officeTypeEs == officeTypeEs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    officeName,
    defaultCompanyName,
    officeType,
    officeTypeEs,
  );

  /// Create a copy of CitySpecificContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CitySpecificContentImplCopyWith<_$CitySpecificContentImpl> get copyWith =>
      __$$CitySpecificContentImplCopyWithImpl<_$CitySpecificContentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CitySpecificContentImplToJson(this);
  }
}

abstract class _CitySpecificContent implements CitySpecificContent {
  const factory _CitySpecificContent({
    @JsonKey(name: 'office_name') required final String officeName,
    @JsonKey(name: 'default_company_name')
    required final String defaultCompanyName,
    @JsonKey(name: 'office_type') required final String officeType,
    @JsonKey(name: 'office_type_es') required final String officeTypeEs,
  }) = _$CitySpecificContentImpl;

  factory _CitySpecificContent.fromJson(Map<String, dynamic> json) =
      _$CitySpecificContentImpl.fromJson;

  /// Office name template
  @override
  @JsonKey(name: 'office_name')
  String get officeName;

  /// Default company name
  @override
  @JsonKey(name: 'default_company_name')
  String get defaultCompanyName;

  /// Office type
  @override
  @JsonKey(name: 'office_type')
  String get officeType;

  /// Office type in Spanish
  @override
  @JsonKey(name: 'office_type_es')
  String get officeTypeEs;

  /// Create a copy of CitySpecificContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CitySpecificContentImplCopyWith<_$CitySpecificContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CitySettings _$CitySettingsFromJson(Map<String, dynamic> json) {
  return _CitySettings.fromJson(json);
}

/// @nodoc
mixin _$CitySettings {
  /// Default city
  @JsonKey(name: 'default_city')
  String get defaultCity => throw _privateConstructorUsedError;

  /// User-selected city
  @JsonKey(name: 'user_selected_city')
  String? get userSelectedCity => throw _privateConstructorUsedError;

  /// Can the city be localized?
  bool get localizable => throw _privateConstructorUsedError;

  /// City-specific content
  @JsonKey(name: 'city_specific_content')
  CitySpecificContent get citySpecificContent =>
      throw _privateConstructorUsedError;

  /// Serializes this CitySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CitySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CitySettingsCopyWith<CitySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitySettingsCopyWith<$Res> {
  factory $CitySettingsCopyWith(
    CitySettings value,
    $Res Function(CitySettings) then,
  ) = _$CitySettingsCopyWithImpl<$Res, CitySettings>;
  @useResult
  $Res call({
    @JsonKey(name: 'default_city') String defaultCity,
    @JsonKey(name: 'user_selected_city') String? userSelectedCity,
    bool localizable,
    @JsonKey(name: 'city_specific_content')
    CitySpecificContent citySpecificContent,
  });

  $CitySpecificContentCopyWith<$Res> get citySpecificContent;
}

/// @nodoc
class _$CitySettingsCopyWithImpl<$Res, $Val extends CitySettings>
    implements $CitySettingsCopyWith<$Res> {
  _$CitySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CitySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultCity = null,
    Object? userSelectedCity = freezed,
    Object? localizable = null,
    Object? citySpecificContent = null,
  }) {
    return _then(
      _value.copyWith(
            defaultCity: null == defaultCity
                ? _value.defaultCity
                : defaultCity // ignore: cast_nullable_to_non_nullable
                      as String,
            userSelectedCity: freezed == userSelectedCity
                ? _value.userSelectedCity
                : userSelectedCity // ignore: cast_nullable_to_non_nullable
                      as String?,
            localizable: null == localizable
                ? _value.localizable
                : localizable // ignore: cast_nullable_to_non_nullable
                      as bool,
            citySpecificContent: null == citySpecificContent
                ? _value.citySpecificContent
                : citySpecificContent // ignore: cast_nullable_to_non_nullable
                      as CitySpecificContent,
          )
          as $Val,
    );
  }

  /// Create a copy of CitySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CitySpecificContentCopyWith<$Res> get citySpecificContent {
    return $CitySpecificContentCopyWith<$Res>(_value.citySpecificContent, (
      value,
    ) {
      return _then(_value.copyWith(citySpecificContent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CitySettingsImplCopyWith<$Res>
    implements $CitySettingsCopyWith<$Res> {
  factory _$$CitySettingsImplCopyWith(
    _$CitySettingsImpl value,
    $Res Function(_$CitySettingsImpl) then,
  ) = __$$CitySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'default_city') String defaultCity,
    @JsonKey(name: 'user_selected_city') String? userSelectedCity,
    bool localizable,
    @JsonKey(name: 'city_specific_content')
    CitySpecificContent citySpecificContent,
  });

  @override
  $CitySpecificContentCopyWith<$Res> get citySpecificContent;
}

/// @nodoc
class __$$CitySettingsImplCopyWithImpl<$Res>
    extends _$CitySettingsCopyWithImpl<$Res, _$CitySettingsImpl>
    implements _$$CitySettingsImplCopyWith<$Res> {
  __$$CitySettingsImplCopyWithImpl(
    _$CitySettingsImpl _value,
    $Res Function(_$CitySettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CitySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultCity = null,
    Object? userSelectedCity = freezed,
    Object? localizable = null,
    Object? citySpecificContent = null,
  }) {
    return _then(
      _$CitySettingsImpl(
        defaultCity: null == defaultCity
            ? _value.defaultCity
            : defaultCity // ignore: cast_nullable_to_non_nullable
                  as String,
        userSelectedCity: freezed == userSelectedCity
            ? _value.userSelectedCity
            : userSelectedCity // ignore: cast_nullable_to_non_nullable
                  as String?,
        localizable: null == localizable
            ? _value.localizable
            : localizable // ignore: cast_nullable_to_non_nullable
                  as bool,
        citySpecificContent: null == citySpecificContent
            ? _value.citySpecificContent
            : citySpecificContent // ignore: cast_nullable_to_non_nullable
                  as CitySpecificContent,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CitySettingsImpl implements _CitySettings {
  const _$CitySettingsImpl({
    @JsonKey(name: 'default_city') required this.defaultCity,
    @JsonKey(name: 'user_selected_city') this.userSelectedCity,
    this.localizable = true,
    @JsonKey(name: 'city_specific_content') required this.citySpecificContent,
  });

  factory _$CitySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitySettingsImplFromJson(json);

  /// Default city
  @override
  @JsonKey(name: 'default_city')
  final String defaultCity;

  /// User-selected city
  @override
  @JsonKey(name: 'user_selected_city')
  final String? userSelectedCity;

  /// Can the city be localized?
  @override
  @JsonKey()
  final bool localizable;

  /// City-specific content
  @override
  @JsonKey(name: 'city_specific_content')
  final CitySpecificContent citySpecificContent;

  @override
  String toString() {
    return 'CitySettings(defaultCity: $defaultCity, userSelectedCity: $userSelectedCity, localizable: $localizable, citySpecificContent: $citySpecificContent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitySettingsImpl &&
            (identical(other.defaultCity, defaultCity) ||
                other.defaultCity == defaultCity) &&
            (identical(other.userSelectedCity, userSelectedCity) ||
                other.userSelectedCity == userSelectedCity) &&
            (identical(other.localizable, localizable) ||
                other.localizable == localizable) &&
            (identical(other.citySpecificContent, citySpecificContent) ||
                other.citySpecificContent == citySpecificContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    defaultCity,
    userSelectedCity,
    localizable,
    citySpecificContent,
  );

  /// Create a copy of CitySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CitySettingsImplCopyWith<_$CitySettingsImpl> get copyWith =>
      __$$CitySettingsImplCopyWithImpl<_$CitySettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CitySettingsImplToJson(this);
  }
}

abstract class _CitySettings implements CitySettings {
  const factory _CitySettings({
    @JsonKey(name: 'default_city') required final String defaultCity,
    @JsonKey(name: 'user_selected_city') final String? userSelectedCity,
    final bool localizable,
    @JsonKey(name: 'city_specific_content')
    required final CitySpecificContent citySpecificContent,
  }) = _$CitySettingsImpl;

  factory _CitySettings.fromJson(Map<String, dynamic> json) =
      _$CitySettingsImpl.fromJson;

  /// Default city
  @override
  @JsonKey(name: 'default_city')
  String get defaultCity;

  /// User-selected city
  @override
  @JsonKey(name: 'user_selected_city')
  String? get userSelectedCity;

  /// Can the city be localized?
  @override
  bool get localizable;

  /// City-specific content
  @override
  @JsonKey(name: 'city_specific_content')
  CitySpecificContent get citySpecificContent;

  /// Create a copy of CitySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CitySettingsImplCopyWith<_$CitySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
