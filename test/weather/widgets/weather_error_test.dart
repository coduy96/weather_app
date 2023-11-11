// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/weather/weather.dart';

void main() {
  group('WeatherError', () {
    testWidgets('renders correct text and icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherError(),
          ),
        ),
      );
      expect(find.text('Please try again!'), findsOneWidget);
      expect(find.text('😢'), findsOneWidget);
    });
  });
}
