import 'package:dartz/dartz.dart';
import 'package:weather_jojo/core/error/failure.dart';
import 'package:weather_jojo/domain/entities/forecast_entity.dart';
import 'package:weather_jojo/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByPosition(
      double lat, double lon);
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByName(String name);
  Future<Either<Failure, ForecastEntity>> getForecastByPosition(
      double lat, double lon);
  Future<Either<Failure, ForecastEntity>> getForecastByName(String name);

  //local

  Future<Either<Failure,void>> cacheRecentLocations(String key, List<String> locations);
  Future<Either<Failure,List<String>>> getRecentLocations(String key);
}
