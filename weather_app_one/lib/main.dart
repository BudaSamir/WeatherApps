import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_one/pages/home_page.dart';
import 'package:weather_app_one/providers/weather_provider.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
