import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_jojo/core/error/exception.dart';

abstract class WeatherLocalDataSource {
  Future<void> cacheRecentLocations(String key, List<String> locations);
  Future<List<String>> getRecentLocations(String key);
}

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  final SharedPreferences prefs;

  WeatherLocalDataSourceImpl({required this.prefs});

  @override
  Future<List<String>> getRecentLocations(String key) async{
    try {
      final result = prefs.getStringList(key);
      return result ?? [];
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
  
  @override
  Future<void> cacheRecentLocations(String key, List<String> locations) {
    try {
      return prefs.setStringList(key, locations);
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
}
