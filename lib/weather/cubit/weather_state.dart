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
    WeatherData? weatherData,
  }) : weather = weatherData ?? WeatherData.empty;

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);

  final WeatherStatus status;
  final WeatherData weather;
  final String city;
  final bool isEnableCelcius;

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherData? weather,
    String? city,
    bool? enableCelcius,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weatherData: weather ?? this.weather,
      city: city ?? this.city,
      isEnableCelcius: enableCelcius ?? this.isEnableCelcius,
    );
  }

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  @override
  List<Object?> get props => [status, weather, city, isEnableCelcius];
}
