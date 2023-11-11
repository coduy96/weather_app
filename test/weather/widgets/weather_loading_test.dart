// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/weather/weather.dart';

void main() {
  group('WeatherLoading', () {
    testWidgets('renders correct text and icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherLoading(),
          ),
        ),
      );
      expect(find.text('Looking for weather...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('🧐'), findsOneWidget);
    });
  });
}
