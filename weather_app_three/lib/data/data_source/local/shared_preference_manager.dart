import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static const String _currentLocation = 'currentLocation';
  static const String _lastWeather = 'LastWeather';
  late SharedPreferences sharedPreferences;

  Future<bool> setCurrentLocation(String? value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_currentLocation, value ?? '');
  }

  Future<bool> setLastWeather(String? value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_lastWeather, value ?? '');
  }

  Future<String> getCurrentLocation() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_currentLocation) ?? '';
  }

  Future<String> getLastWeather() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_lastWeather) ?? '';
  }

  Future<void> clear() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
