import 'package:weather_app_two/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      {required super.id,
      required super.cityName,
      required super.main,
      required super.description,
      required super.pressure});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      id: json["id"],
      cityName: json["name"],
      main: json["weather"][0]["main"],
      description: json["weather"][0]["main"],
      pressure: json["main"]["pressure"]);
}
