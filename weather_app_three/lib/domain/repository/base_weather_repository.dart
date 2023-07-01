import 'package:weather_app_three/domain/request/location_requests.dart';
import 'package:weather_app_three/domain/request/weather_requests.dart';
import 'package:weather_app_three/domain/response/location_response.dart';
import 'package:weather_app_three/domain/response/weather_response.dart';

abstract class BaseWeatherRepository {
  Future<WeatherResponse?> getWeather(final WeatherRequest data);
  Future<LocationResponse?> getLocation(final LocationRequest data);
}
