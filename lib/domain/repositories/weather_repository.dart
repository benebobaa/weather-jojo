

import 'package:dartz/dartz.dart';
import 'package:weather_jojo/core/error/failure.dart';
import 'package:weather_jojo/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByPosition(double lat, double lon);
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByName(String name);
}