import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_jojo/core/constants/key.dart';
import 'package:weather_jojo/core/error/exception.dart';
import 'package:weather_jojo/data/models/forecast_model.dart';
import 'package:weather_jojo/domain/entities/forecast_entity.dart';

abstract class WeatherLocalDataSource {
  Future<void> cacheRecentLocations(String key, List<String> locations);
  Future<List<String>> getRecentLocations(String key);
  Future<void> cacheForecastData(
      String key, List<ForecastWeatherModel> data);
  Future<List<ForecastWeatherModel>> getCacheForecastData(
      String key);
  Future<String> getCacheCityName();
}

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  final SharedPreferences prefs;

  WeatherLocalDataSourceImpl({required this.prefs});

  @override
  Future<List<String>> getRecentLocations(String key) async {
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

  @override
  Future<void> cacheForecastData(
      String key, List<ForecastWeatherModel> data) {
    try {
      List<String> forecastList =
          data.map((e) => jsonEncode(e.toJson())).toList();
      prefs.setString(Key.cityKey(key), key);
      return prefs.setStringList(key.toLowerCase(), forecastList);
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
  
  @override
  Future<List<ForecastWeatherModel>> getCacheForecastData(String key)async {
    try {
      List<String> forecastList = prefs.getStringList(key) ?? [];
      return forecastList
          .map((e) => ForecastWeatherModel.fromJson(jsonDecode(e)))
          .toList(); 
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
  
  @override
  Future<String> getCacheCityName() {
    try {
      return Future.value(prefs.getKeys().first);
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
}
