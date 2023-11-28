


import 'package:dartz/dartz.dart';
import 'package:weather_jojo/core/error/exception.dart';
import 'package:weather_jojo/core/error/failure.dart';
import 'package:weather_jojo/data/data_sources/remote_data_sources/weather_remote_data_source.dart';
import 'package:weather_jojo/domain/entities/forecast_entity.dart';
import 'package:weather_jojo/domain/entities/weather_entity.dart';
import 'package:weather_jojo/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository{
  final WeatherRemoteDataSource remoteDataSource;
  WeatherRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByPosition(double lat, double lon)async {
    try {
      final result =await  remoteDataSource.getCurrentWeatherByPosition(lat, lon);
      return Right(result.toEntity()); 
    } on ServerException {
      return const Left(
          ServerFailure('An error occurred while getting weather data'));
    } on TimeoutException {
      return const Left(ConnectionFailure('Timeout, failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByName(String name)async {
    try {
      final result =await  remoteDataSource.getCurrentWeatherByName(name);
      return Right(result.toEntity()); 
    } on ServerException {
      return const Left(
          ServerFailure('An error occurred while getting weather data'));
    } on TimeoutException {
      return const Left(ConnectionFailure('Timeout, failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ForecastEntity>> getForecastByName(String name)async {
    try {
      final result =await  remoteDataSource.getForecastByName(name);
      return Right(result.toEntity()); 
    } on ServerException {
      return const Left(
          ServerFailure('An error occurred while getting weather data'));
    } on TimeoutException {
      return const Left(ConnectionFailure('Timeout, failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ForecastEntity>> getForecastByPosition(double lat, double lon)async {
    try {
      final result =await  remoteDataSource.getForecastByPosition(lat, lon);
      return Right(result.toEntity()); 
    } on ServerException {
      return const Left(
          ServerFailure('An error occurred while getting weather data'));
    } on TimeoutException {
      return const Left(ConnectionFailure('Timeout, failed to connect to the network'));
    }
  }

}