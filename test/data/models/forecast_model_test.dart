import 'package:weather_jojo/data/models/forecast_model.dart';

void main() {
  var testForecastModel = ForecastModel(
    cityName: 'Jakarta',
    list: [
      const ForecastWeatherModel(
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
          temperature: temperature,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          humidity: humidity),
    ],
  );
}
