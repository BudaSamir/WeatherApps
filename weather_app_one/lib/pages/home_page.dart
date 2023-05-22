// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_one/models/weather.dart';
import 'package:weather_app_one/pages/search_page.dart';
import 'package:weather_app_one/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherInfo? weatherdata =
        Provider.of<WeatherProvider>(context).getWweatherInfo;
    Widget shownData() => Container(
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Text(
                'Cairo',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Updated :${weatherdata?.date}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/clear.png"),
                      Text(
                        '${weatherdata?.temp}',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'max : ${weatherdata?.maxtemp}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'min : ${weatherdata?.minitemp}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Spacer(),
              Text(
                '${weatherdata?.condition}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(flex: 5),
            ],
          ),
        );

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: const Icon(Icons.search))
          ],
          title: const Text('Weather App'),
        ),
        body: weatherdata == null ? noShownData(context) : shownData());
  }

  Widget noShownData(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      );
}
