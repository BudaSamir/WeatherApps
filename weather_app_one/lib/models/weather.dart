class WeatherInfo {
  String date;
  double temp;
  double maxtemp;
  double minitemp;
  String condition;

  WeatherInfo(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.minitemp,
      required this.condition});

  factory WeatherInfo.formJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    return WeatherInfo(
        date: data["location"]["localtime"],
        temp: jsonData["avgtemp_c"],
        maxtemp: jsonData["maxtemp_c"],
        minitemp: jsonData["mintemp_c"],
        condition: data["current"]["condition"]["text"]);
  }
}
