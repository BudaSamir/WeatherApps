import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_one/models/weather.dart';

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "0a7e509d571c4b51920115629231203";

  Future<WeatherInfo> getWeather({required String city}) async {
    Uri url = Uri.parse("$baseUrl/forecast.json?key=$baseUrl&q=$city&days=7");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    var jsonData = data["forecast"]["forecastday"][0];
    WeatherInfo weatherInfo = WeatherInfo(
        date: data["location"]["localtime"],
        temp: jsonData["avgtemp_c"],
        maxtemp: jsonData["maxtemp_c"],
        minitemp: jsonData["mintemp_c"],
        condition: data["current"]["condition"]["text"]);

    return weatherInfo;
  }
}
