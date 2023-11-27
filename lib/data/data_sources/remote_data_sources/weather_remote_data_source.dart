import 'dart:convert';

import 'package:weather_jojo/core/constants/constants.dart';
import 'package:weather_jojo/core/error/exception.dart';
import 'package:weather_jojo/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeatherByPosition(double lat, double lon);
  Future<WeatherModel> getCurrentWeatherByName(String name);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;
  WeatherRemoteDataSourceImpl({required this.client});
  @override
  Future<WeatherModel> getCurrentWeatherByPosition(double lat, double lon) async {
    final response = await client
        .get(Uri.parse(Urls.currentWeatherByPosition(lat, lon)))
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException(),
        );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    }
    throw ServerException();
  }

  @override
  Future<WeatherModel> getCurrentWeatherByName(String name) async {
    final response = await client
        .get(Uri.parse(Urls.currentWeatherByName(name)))
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException(),
        );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    }
    throw ServerException();
  }
}
