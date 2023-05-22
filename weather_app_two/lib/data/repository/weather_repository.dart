// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app_two/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:weather_app_two/data/models/weather_model.dart';
import 'package:weather_app_two/domain/entities/weather.dart';
import 'package:weather_app_two/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource remoteDataSource;
  WeatherRepository({
    required this.remoteDataSource,
  });
  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    return (await remoteDataSource.getWeatherByCountryName(cityName))!;
  }
}
