import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class OnCityByPosition extends WeatherEvent {
  final double lat;
  final double lon;

  const OnCityByPosition({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}

class OnCityByName extends WeatherEvent {
  final String name;

  const OnCityByName({required this.name});

  @override
  List<Object> get props => [name];
}

