import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_jojo/core/error/failure.dart';
import 'package:weather_jojo/domain/repositories/splash_repository.dart';

class SplashUsecase {
  final SplashRepository _repository;
  SplashUsecase(this._repository);

  Future<Either<Failure,Position>> getCurrentLocation() async {
    return await _repository.getCurrentLocation();
  }
}