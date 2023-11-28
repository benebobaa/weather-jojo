import 'package:equatable/equatable.dart';

class ForecastEntity extends Equatable {
  final String cityName;
  final List<ForecastWeatherEntity> list;

  const ForecastEntity({
    required this.cityName,
    required this.list,
  });

  @override
  List<Object?> get props => [cityName,list];
}

class ForecastWeatherEntity extends Equatable {
  const ForecastWeatherEntity({
    required this.main,
    required this.iconCode,
    required this.dateTxt,
    required this.temperature,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  final String main;
  final String iconCode;
  final String dateTxt;
  final double temperature;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  @override
  List<Object?> get props => [
        main,
        iconCode,
        dateTxt,
        temperature,
        tempMin,
        tempMax,
        pressure,
        humidity,
      ];
}
