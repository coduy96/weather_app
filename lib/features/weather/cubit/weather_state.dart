part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

@JsonSerializable()
final class WeatherState extends Equatable {
  WeatherState({
    this.status = WeatherStatus.initial,
    this.city = '',
    this.isEnableCelcius = true,
    ForecastData? forecastData,
    WeatherData? weatherData,
  })  : weatherData = weatherData ?? WeatherData.empty,
        forecastData = forecastData ?? ForecastData.empty;

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);

  final WeatherStatus status;
  final WeatherData weatherData;
  final String city;
  final bool isEnableCelcius;
  final ForecastData forecastData;

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherData? weatherData,
    String? city,
    bool? isEnableCelcius,
    ForecastData? forecastData,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weatherData: weatherData ?? this.weatherData,
      city: city ?? this.city,
      isEnableCelcius: isEnableCelcius ?? this.isEnableCelcius,
      forecastData: forecastData ?? this.forecastData,
    );
  }

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  @override
  List<Object?> get props =>
      [status, weatherData, city, isEnableCelcius, forecastData];
}
