import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherServices {
  void getWeather({required String city}) async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=0a7e509d571c4b51920115629231203&q=$city&aqi=no");
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
  }
}
