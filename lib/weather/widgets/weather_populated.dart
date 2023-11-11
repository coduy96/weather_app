import 'package:flutter/material.dart';
import 'package:weather_app/weather/weather.dart';
import 'package:intl/intl.dart'; // add this

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({
    required this.weather,
    required this.units,
    required this.onRefresh,
    super.key,
  });

  final Weather weather;
  final TemperatureUnits units;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 10),
                    Text(
                      weather.location,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //show today with format Wed--29 May
                Text(
                  DateFormat('EEE-d MMM').format(DateTime.now()), // change this
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'Today',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                Text(
                  weather.formattedTemperature(units),
                  style: theme.textTheme.displayLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 130),
                ),
                const SizedBox(
                  height: 50,
                ),
                _WeatherIcon(condition: weather.condition),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({required this.condition});

  static const _iconSize = 60.0;

  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          condition.toEmoji,
          style: const TextStyle(fontSize: _iconSize),
        ),
        Text(
          '${condition.name[0].toUpperCase()}${condition.name.substring(1)} day',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

extension on WeatherCondition {
  String get toEmoji {
    switch (this) {
      case WeatherCondition.clear:
        return '☀️';
      case WeatherCondition.rainy:
        return '🌧️';
      case WeatherCondition.cloudy:
        return '☁️';
      case WeatherCondition.snowy:
        return '🌨️';
      case WeatherCondition.unknown:
        return '❓';
    }
  }
}

extension on Weather {
  String formattedTemperature(TemperatureUnits units) {
    return '''${temperature.value.toStringAsPrecision(2)}°${units.isCelsius ? 'C' : 'F'}''';
  }
}
