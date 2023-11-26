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
      forecastData: json['forecastData'] == null
          ? null
          : ForecastData.fromJson(
              Forecast.fromJson(json['forecastData'] as Map<String, dynamic>)),
      weatherData: json['weatherData'] == null
          ? null
          : WeatherData.fromJson(
              Weather.fromJson(json['weatherData'] as Map<String, dynamic>)),
    );

Map<String, dynamic> _$WeatherStateToJson(WeatherState instance) =>
    <String, dynamic>{
      'status': _$WeatherStatusEnumMap[instance.status]!,
      'weatherData': instance.weatherData,
      'city': instance.city,
      'isEnableCelcius': instance.isEnableCelcius,
      'forecastData': instance.forecastData,
    };

const _$WeatherStatusEnumMap = {
  WeatherStatus.initial: 'initial',
  WeatherStatus.loading: 'loading',
  WeatherStatus.success: 'success',
  WeatherStatus.failure: 'failure',
};
