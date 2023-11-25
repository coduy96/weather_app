import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/weather/domain/weather/weather.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final List<Weather> list;

  Forecast({required this.list});
  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
