import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_one/models/weather.dart';

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "fbfca8d3680d4ff690f170325231603";

  Future<WeatherInfo> getWeather({required String city}) async {
    Uri url = Uri.parse(
        "$baseUrl/forecast.json?key=$baseUrl&q=$city&days=1&aqi=no&alerts=no");
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    print("jsonData =  $jsonData");
    WeatherInfo weatherInfo = WeatherInfo.fromJson(jsonData);
    return weatherInfo;
  }
}
