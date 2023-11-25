import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/weather/data/weather_repository.dart';
import 'package:weather_app/weather_bloc_observer.dart';

import 'api/api.dart';
import 'api/api_keys.default.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const WeatherBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  // runApp(WeatherApp(weatherRepository: WeatherRepository()));

  const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: APIKeys.openWeatherAPIKey,
  );

  runApp(WeatherApp(
      httpWeatherRepository: HttpWeatherRepository(
          api: OpenWeatherMapAPI(apiKey), client: http.Client())));
}
