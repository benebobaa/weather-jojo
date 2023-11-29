import 'package:weather_jojo/data/models/forecast_model.dart';

var testForecastModel = const ForecastModel(
    cityName: 'Jakarta',
    list: [
      ForecastWeatherModel(
          main: 'Rain',
          iconCode: '10d',
          dateTxt: '2023-11-29 09:00:00',
          temperature: 32.52,
          tempMin: 31.73,
          tempMax: 32.52,
          pressure: 1006,
          humidity: 67),
      ForecastWeatherModel(
          main: 'Rain',
          iconCode: '10n',
          dateTxt: '2023-11-29 12:00:00',
          temperature: 30.96,
          tempMin: 29.98,
          tempMax: 30.96,
          pressure: 1007,
          humidity: 67),
    ],
  );

const testCityName = 'Jakarta';