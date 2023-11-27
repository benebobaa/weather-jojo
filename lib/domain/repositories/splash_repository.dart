

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_jojo/core/error/failure.dart';

abstract class SplashRepository{
  Future<Either<Failure,Position>> getCurrentLocation();
}