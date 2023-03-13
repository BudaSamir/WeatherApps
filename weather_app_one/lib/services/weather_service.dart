import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_one/models/weather.dart';

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "0a7e509d571c4b51920115629231203";

  Future<WeatherInfo> getWeather({required String city}) async {
    Uri url = Uri.parse("$baseUrl/forecast.json?key=$baseUrl&q=$city&days=7");
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    WeatherInfo weatherInfo = WeatherInfo.formJson(jsonData);

    return weatherInfo;
  }
}
