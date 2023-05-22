import 'dart:convert';

import 'package:weather_app_two/core/utils/constants.dart';
import 'package:weather_app_two/data/models/weather_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCountryName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCountryName(String cityName) async {
    try {
      var response = await Dio().get(
          "${AppConstants.baseUrl}/weather?q=$cityName&appid=${AppConstants.baseApiKey}");
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
