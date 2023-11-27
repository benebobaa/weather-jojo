import 'package:weather_jojo/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required String cityName,
    required String main,
    required String iconCode,
    required double temperature,
    required double tempMin,
    required double tempMax,
    required int pressure,
    required int humidity,
  }) : super(
          cityName: cityName,
          main: main,
          iconCode: iconCode,
          temperature: temperature,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          humidity: humidity,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      main: json['weather'][0]['main'],
      iconCode: json['weather'][0]['icon'],
      temperature: json['main']['temp'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'weather': [
        {
          'main': main,
          'icon': iconCode,
        }
      ],
      'main': {
        'temp': temperature,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
      },
    };
  }

  WeatherEntity toEntity() => WeatherEntity(
        cityName: cityName,
        main: main,
        iconCode: iconCode,
        temperature: temperature,
        tempMin: tempMin,
        tempMax: tempMax,
        pressure: pressure,
        humidity: humidity,
      );
}
