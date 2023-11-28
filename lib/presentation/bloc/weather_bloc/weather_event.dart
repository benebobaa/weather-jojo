import 'package:equatable/equatable.dart';
import 'package:weather_jojo/domain/entities/weather_entity.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class OnForecastByName extends WeatherEvent {
  final String name;

  const OnForecastByName({required this.name});

  @override
  List<Object> get props => [name];
}

class OnForecastByPosition extends WeatherEvent {
  final double lat;
  final double lon;

  const OnForecastByPosition({ required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}


class OnChangeSelectDay extends WeatherEvent {
  final int index;

  const OnChangeSelectDay({required this.index});

  @override
  List<Object> get props => [index];
}