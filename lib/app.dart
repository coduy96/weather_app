import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_repository/weather_repository.dart';

const primaryColor = Color(0xffC0C0C0);

class WeatherApp extends StatelessWidget {
  const WeatherApp({required WeatherRepository weatherRepository, super.key})
      : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: const WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(),
      home: const WeatherPage(),
    );
  }
}

ThemeData _buildThemeData() {
  return ThemeData(
    indicatorColor: primaryColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryColor,
    ),
    iconTheme: const IconThemeData(
      color: primaryColor,
    ),
    dividerColor: primaryColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.grey),
      trackColor: MaterialStateProperty.all(Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: primaryColor,
      prefixIconColor: primaryColor,
      suffixIconColor: primaryColor,
      contentPadding: const EdgeInsets.all(10),
      hintStyle: GoogleFonts.poppins(
        color: primaryColor,
      ),
      labelStyle: GoogleFonts.poppins(
        color: primaryColor,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: primaryColor,
      displayColor: primaryColor,
      decorationColor: primaryColor,
    ),
  );
}
