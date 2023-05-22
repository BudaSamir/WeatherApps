import 'package:flutter/material.dart';
import 'package:weather_app_one/models/weather.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherInfo? _weatherInfo;

  set setWweatherInfo(WeatherInfo? weatherInfo) {
    _weatherInfo = weatherInfo;
    notifyListeners();
  }

  WeatherInfo? get getWweatherInfo => _weatherInfo;
}
