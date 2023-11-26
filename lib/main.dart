import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:weather_app/api/api_keys.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/weather_bloc_observer.dart';

import 'api/api.dart';
import 'data/weather_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const WeatherBlocObserver();
  const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: APIKeys.openWeatherAPIKey,
  );

  runApp(
    WeatherApp(
      httpWeatherRepository: HttpWeatherRepository(
        api: OpenWeatherMapAPI(apiKey),
        client: http.Client(),
      ),
    ),
  );
}
