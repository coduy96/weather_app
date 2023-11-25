import 'package:weather_app/weather/domain/forecast/forecast.dart';
import 'package:weather_app/weather/domain/weather/weather_data.dart';

class ForecastData {
  const ForecastData(this.list);
  factory ForecastData.fromJson(Forecast forecast) {
    return ForecastData(
      forecast.list.map((item) => WeatherData.fromJson(item)).toList(),
    );
  }
  final List<WeatherData> list;
}
