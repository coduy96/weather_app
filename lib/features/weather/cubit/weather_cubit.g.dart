// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) => WeatherState(
      status: $enumDecodeNullable(_$WeatherStatusEnumMap, json['status']) ??
          WeatherStatus.initial,
      city: json['city'] as String? ?? '',
      isEnableCelcius: json['isEnableCelcius'] as bool? ?? true,
    );

Map<String, dynamic> _$WeatherStateToJson(WeatherState instance) =>
    <String, dynamic>{
      'status': _$WeatherStatusEnumMap[instance.status]!,
      'city': instance.city,
      'isEnableCelcius': instance.isEnableCelcius,
    };

const _$WeatherStatusEnumMap = {
  WeatherStatus.initial: 'initial',
  WeatherStatus.loading: 'loading',
  WeatherStatus.success: 'success',
  WeatherStatus.failure: 'failure',
};