import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.cityName,
    required this.main,
    required this.iconCode,
    required this.temperature,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  
  });

  final String cityName;
  final String main;
  final String iconCode;
  final double temperature;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  @override
  List<Object?> get props => [
        cityName,
        main,
        iconCode,
        temperature,
        tempMin,
        tempMax,
        pressure,
        humidity,
      ];
}

