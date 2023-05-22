import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_one/models/weather.dart';
import 'package:weather_app_one/providers/weather_provider.dart';
import 'package:weather_app_one/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? city;
  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          onSubmitted: (value) async {
            city = value;
            WeatherServices weatherAPI = WeatherServices();
            WeatherInfo weatherInfo = await weatherAPI.getWeather(city: city!);
            Provider.of<WeatherProvider>(context, listen: false)
                .setWweatherInfo = weatherInfo;
            Navigator.of(context).pop();
          },
          decoration: const InputDecoration(
              label: Text("Search"),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: "Enter Your City"),
        ),
      )),
    );
  }
}
