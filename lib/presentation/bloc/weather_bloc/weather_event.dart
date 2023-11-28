import 'package:equatable/equatable.dart';

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

  const OnForecastByPosition({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}

class OnChangeSelectDay extends WeatherEvent {
  final int index;

  const OnChangeSelectDay({required this.index});

  @override
  List<Object> get props => [index];
}

class OnChangeSearch extends WeatherEvent {
  final String name;

  const OnChangeSearch({required this.name});

  @override
  List<Object> get props => [name];
}

