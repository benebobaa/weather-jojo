import 'dart:convert';

import 'package:weather_jojo/core/constants/constants.dart';
import 'package:weather_jojo/core/error/exception.dart';
import 'package:weather_jojo/data/models/forecast_model.dart';
import 'package:weather_jojo/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeatherByPosition(double lat, double lon);
  Future<WeatherModel> getCurrentWeatherByName(String name);
  Future<ForecastModel> getForecastByPosition(double lat, double lon);
  Future<ForecastModel> getForecastByName(String name);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;
  WeatherRemoteDataSourceImpl({required this.client});
  @override
  Future<WeatherModel> getCurrentWeatherByPosition(
      double lat, double lon) async {
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
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(name))).timeout(
              const Duration(seconds: 5),
              onTimeout: () => throw TimeoutException(),
            );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    }
    throw ServerException();
  }

  @override
  Future<ForecastModel> getForecastByName(String name) async {
    final response =
        await client.get(Uri.parse(Urls.currentForecastByName(name))).timeout(
              const Duration(seconds: 5),
              onTimeout: () => throw TimeoutException(),
            );

    if (response.statusCode == 200) {
      return ForecastModel.fromJson(jsonDecode(response.body));
    }
    throw ServerException();
  }

  @override
  Future<ForecastModel> getForecastByPosition(double lat, double lon) async {
    final response = await client
        .get(Uri.parse(Urls.currentForecastByPosition(lat, lon)))
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException(),
        );

    if (response.statusCode == 200) {
      return ForecastModel.fromJson(jsonDecode(response.body));
    }

    throw ServerException();
  }
}
