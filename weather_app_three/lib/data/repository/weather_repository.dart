import 'dart:developer';

import 'package:weather_app_three/domain/repository/base_weather_repository.dart';
import 'package:weather_app_three/domain/request/location_requests.dart';
import 'package:weather_app_three/domain/request/weather_requests.dart';
import 'package:weather_app_three/domain/response/location_response.dart';
import 'package:weather_app_three/domain/response/weather_response.dart';
import 'package:weather_app_three/shared/core/dio_manager.dart';

class WeatherRepository extends BaseWeatherRepository {
  final DioManager _dio;

  WeatherRepository(this._dio);
  @override
  Future<LocationResponse?> getLocation(final LocationRequest data) async {
    LocationResponse? locationResponse;
    try {
      await _dio
          .get(
        '/geo/1.0/direct',
        json: data.toJson(),
      )
          .then((response) {
        if (response.data != null) {
          locationResponse = LocationResponse.fromJson(response.data);
        } else {
          log('response.data == null');
        }
      });
    } catch (e) {
      log(e.toString());
    }

    return locationResponse;
  }

  @override
  Future<WeatherResponse?> getWeather(final WeatherRequest data) async {
    WeatherResponse? weatherResponse;
    try {
      await _dio
          .get(
        '/data/2.5/forecast',
        json: data.toJson(),
      )
          .then((response) {
        if (response.data != null) {
          weatherResponse = WeatherResponse.fromJson(response.data);
        } else {
          log('response.data == null');
        }
      });
    } catch (e) {
      log(e.toString());
    }

    return weatherResponse;
  }
}
