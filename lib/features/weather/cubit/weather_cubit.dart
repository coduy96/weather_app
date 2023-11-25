import 'package:current_location/current_location.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/forecast/forecast_data.dart';

import '../../../data/weather_repository.dart';
import '../../../domain/weather/weather_data.dart';

part 'weather_cubit.g.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final HttpWeatherRepository _weatherRepository;

  Future<void> initFetchWeatherByLocation() async {
    final userLocation = await UserLocation.getValue();
    if (userLocation == null) return;

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather =
          await _weatherRepository.getWeather(city: userLocation.country!);
      final weatherData = WeatherData.fromJson(weather);

      final forecast =
          await _weatherRepository.getForecast(city: userLocation.country!);
      final forecastData = ForecastData.fromJson(forecast);

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weather: weatherData,
          city: userLocation.country!,
          forecastData: forecastData,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  Future<void> fetchWeather(String? city) async {
    if (city == null || city.isEmpty) return;

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather = await _weatherRepository.getWeather(city: city);
      final weatherData = WeatherData.fromJson(weather);

      final forecast = await _weatherRepository.getForecast(city: city);
      final forecastData = ForecastData.fromJson(forecast);

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weather: weatherData,
          city: city.toUpperCase(),
          forecastData: forecastData,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  Future<void> refreshWeather() async {
    if (!state.status.isSuccess) return;
    if (state.weather == WeatherData.empty) return;
    try {
      final weather = await _weatherRepository.getWeather(city: state.city);
      final weatherData = WeatherData.fromJson(weather);

      final forecast = await _weatherRepository.getForecast(city: state.city);
      final forecastData = ForecastData.fromJson(forecast);

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weather: weatherData,
          city: state.city.toUpperCase(),
          forecastData: forecastData,
        ),
      );
    } on Exception {
      emit(state);
    }
  }

  void toggleUnits() {
    if (state.status.isSuccess) {
      emit(state.copyWith(isEnableCelcius: !state.isEnableCelcius));
      return;
    }
  }

  // @override
  // WeatherState fromJson(Map<String, dynamic> json) =>
  //     WeatherState.fromJson(json);

  // @override
  // Map<String, dynamic> toJson(WeatherState state) => state.toJson();
}
