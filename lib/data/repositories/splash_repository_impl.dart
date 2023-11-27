

import 'package:dartz/dartz.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:weather_jojo/core/error/failure.dart';
import 'package:weather_jojo/domain/repositories/splash_repository.dart';

class SplashRepositoryImpl extends SplashRepository{
  
  @override
  Future<Either<Failure, Position>> getCurrentLocation() {
    // TODO: implement getCurrentLocation
    throw UnimplementedError();
  }

}