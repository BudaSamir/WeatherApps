import 'package:weather_app_two/domain/entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Weather?> getWeatherByCityName(String cityName);
}
