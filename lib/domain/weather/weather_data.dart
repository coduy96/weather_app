import 'package:weather_app/domain/weather/weather.dart';

import '../temperature.dart';

class WeatherData {
  WeatherData({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
  });

  static final empty = WeatherData(
    temp: Temperature.celsius(0),
    minTemp: Temperature.celsius(0),
    maxTemp: Temperature.celsius(0),
    description: '',
    date: DateTime.now(),
    icon: '',
  );

  factory WeatherData.fromJson(Weather weather) {
    return WeatherData(
      temp: Temperature.celsius(weather.weatherParams.temp),
      minTemp: Temperature.celsius(weather.weatherParams.tempMin),
      maxTemp: Temperature.celsius(weather.weatherParams.tempMax),
      description: weather.weatherInfo[0].main,
      date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
      icon: weather.weatherInfo[0].icon,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp':
          temp, // Assuming Temperature class has a method to get value in Celsius
      'minTemp': minTemp,
      'maxTemp': maxTemp,
      'description': description,
      'date': date.toIso8601String(), // Convert DateTime to ISO-8601 string
      'icon': icon,
    };
  }

  final Temperature temp;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String description;
  final DateTime date;
  final String icon;

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
}
