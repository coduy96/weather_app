import 'package:weather_app/domain/forecast/forecast.dart';
import 'package:weather_app/domain/weather/weather_data.dart';

class ForecastData {
  const ForecastData(this.list);

  factory ForecastData.fromJson(Forecast forecast) {
    return ForecastData(
      forecast.list.map((item) => WeatherData.fromJson(item)).toList(),
    );
  }

  static const empty = ForecastData([]);

  final List<WeatherData> list;

  Map<String, dynamic> toJson() {
    return {
      'list': list.map((weatherData) => weatherData.toJson()).toList(),
    };
  }
}
