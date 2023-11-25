import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather/domain/weather/weather_data.dart';

import '../../widgets/weather_icon_image.dart'; // add this

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({
    required this.weather,
    required this.onRefresh,
    required this.city,
    required this.isEnableCelcius,
    super.key,
  });

  final WeatherData weather;
  final ValueGetter<Future<void>> onRefresh;
  final String city;
  final bool isEnableCelcius;
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
                      city,
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
                Center(
                  child: Text(
                    isEnableCelcius
                        ? '${weather.temp.celsius.toStringAsPrecision(2)}°C'
                        : '${weather.temp.celsius.toStringAsPrecision(2)}°F',
                    style: theme.textTheme.displayLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 130),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherIconImage(iconUrl: weather.iconUrl, size: 100),
                    Text(
                      weather.description,
                      style: theme.textTheme.displaySmall,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
