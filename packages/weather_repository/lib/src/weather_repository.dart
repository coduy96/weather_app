import 'dart:async';

import 'package:open_meteo_api/open_meteo_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  WeatherRepository({OpenMeteoApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? OpenMeteoApiClient();

  final OpenMeteoApiClient _weatherApiClient;

  Future<Weather> getWeather(String city) async {
    final location = await _weatherApiClient.locationSearch(city);
    final weather = await _weatherApiClient.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );
    return Weather(
      temperature: weather.temperature,
      location: location.name,
      condition: weather.weatherCode.toInt().toCondition,
    );
  }
}

extension on int {
  WeatherCondition get toCondition {
    Map<WeatherCondition, List<int>> conditionMap = {
      WeatherCondition.clear: [0],
      WeatherCondition.cloudy: [1, 2, 3, 45, 48],
      WeatherCondition.rainy: [
        51,
        53,
        55,
        56,
        57,
        61,
        63,
        65,
        66,
        67,
        80,
        81,
        82,
        95,
        96,
        99
      ],
      WeatherCondition.snowy: [71, 73, 75, 77, 85, 86],
    };

    for (var entry in conditionMap.entries) {
      if (entry.value.contains(this)) {
        return entry.key;
      }
    }

    return WeatherCondition.unknown;
  }
}
