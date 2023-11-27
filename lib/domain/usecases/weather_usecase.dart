

import 'package:dartz/dartz.dart';
import 'package:weather_jojo/core/error/failure.dart';
import 'package:weather_jojo/domain/entities/weather_entity.dart';
import 'package:weather_jojo/domain/repositories/weather_repository.dart';

class WeatherUsecase{
  final WeatherRepository _repository;

  WeatherUsecase(this._repository);

  Future<Either<Failure,WeatherEntity>> getCurrentWeatherByPosition(double lat, double lon) async {
    return await _repository.getCurrentWeatherByPosition(lat, lon);
  }

  Future<Either<Failure,WeatherEntity>> getCurrentWeatherByName(String name) async {
    return await _repository.getCurrentWeatherByName(name);
  }
}