import 'package:flutter/material.dart';
import 'package:weather_app_two/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:weather_app_two/data/repository/weather_repository.dart';
import 'package:weather_app_two/domain/entities/weather.dart';
import 'package:weather_app_two/domain/repository/base_weather_repository.dart';
import 'package:weather_app_two/domain/usecases/get_weather_by_country.dart';

void main() async {
  BaseRemoteDataSource remoteDataSource = RemoteDataSource();
  BaseWeatherRepository weatherRepository =
      WeatherRepository(remoteDataSource: remoteDataSource);
  Weather? weather =
      await GetWeatherByCountryName(weatherRepository).execute("london");

  print(weather);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
