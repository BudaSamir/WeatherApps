class WeatherResponse {
  List<Weather> weatherData;
  City city;

  WeatherResponse({required this.city, required this.weatherData});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      WeatherResponse(
          city: City.fromJson(json['city']),
          weatherData:
          List<Weather>.from(json['list'].map((e) => Weather.fromJson(e))));
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
      id: json["id"],
      name: json["name"],
      coord: Coord.fromJson(json["coord"]),
      country: json["country"],
      population: json["population"],
      timezone: json["timezone"],
      sunrise: json["sunrise"],
      sunset: json["sunset"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "coord": coord.toJson(),
    "country": country,
    "population": population,
    "timezone": timezone,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Coord {
  double lat;
  double lon;

  Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) =>
      Coord(lat: json['lat'], lon: json['lon']);

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}

class Weather {
  int dt;
  MainData mainData;
  List<WeatherElements> weatherElements;
  Clouds clouds;
  Wind wind;
  int visibility;
  double pop;
  Rain? rain;
  DateTime dtTxt;

  Weather({
    required this.dt,
    required this.mainData,
    required this.weatherElements,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.dtTxt,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      dt: json['dt'],
      mainData: MainData.fromJson(json['main']),
      weatherElements: List<WeatherElements>.from(
          json['weather'].map((e) => WeatherElements.fromJson(e))),
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: json['pop'],
      rain: Rain.fromJson(json['rain']),
      dtTxt: DateTime.parse(json['dt_txt']));

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": mainData.toJson(),
    "weather": List<dynamic>.from(weatherElements.map((x) => x.toJson())),
    "clouds": clouds.toJson(),
    "wind": wind.toJson(),
    "visibility": visibility,
    "pop": pop,
    "dt_txt": dtTxt.toIso8601String(),
    "rain": rain?.toJson(),
  };
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class MainData {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  MainData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory MainData.fromJson(Map<String, dynamic> json) => MainData(
    temp: json["temp"]?.toDouble(),
    feelsLike: json["feels_like"]?.toDouble(),
    tempMin: json["temp_min"]?.toDouble(),
    tempMax: json["temp_max"]?.toDouble(),
    pressure: json["pressure"],
    seaLevel: json["sea_level"],
    grndLevel: json["grnd_level"],
    humidity: json["humidity"],
    tempKf: json["temp_kf"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
    "humidity": humidity,
    "temp_kf": tempKf,
  };
}

class WeatherElements {
  int id;
  String main;
  String description;
  String icon;

  WeatherElements({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherElements.fromJson(Map<String, dynamic> json) =>
      WeatherElements(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Rain {
  double the3H;

  Rain({
    required this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
    the3H: json["3h"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "3h": the3H,
  };
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"]?.toDouble(),
    deg: json["deg"],
    gust: json["gust"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
}