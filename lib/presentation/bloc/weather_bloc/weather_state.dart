import 'package:equatable/equatable.dart';
import 'package:weather_jojo/domain/entities/forecast_entity.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final String cityName;
  final List<List<ForecastWeatherEntity>> data;
  final int selectedIndex;

  const WeatherLoaded({required this.cityName, required this.data, required this.selectedIndex});

  @override
  List<Object> get props => [cityName, data, selectedIndex];
}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError({required this.message});

  @override
  List<Object> get props => [message];
}


class LocationCacheError extends WeatherState {
  final String message;

  const LocationCacheError({required this.message});

  @override
  List<Object> get props => [message];
}


