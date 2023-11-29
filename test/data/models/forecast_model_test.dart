import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_jojo/data/models/forecast_model.dart';
import 'package:weather_jojo/domain/entities/forecast_entity.dart';

import '../../helpers/constants/dummy_data_json.dart';
import '../../helpers/json_reader.dart';

void main() {
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

  test('should be subclass of [ForecastEntity]', () {
    //assert
    expect(testForecastModel, isA<ForecastEntity>());
  });

  test('should return a valid model from json', () async {
    //arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson(DummyData.forecastJson));

    //act
    final result = ForecastModel.fromJson(jsonMap);

    //assert
    expect(result, testForecastModel);
  });

  test('should return a json map containing proper data', () async {
    //act
    final result = testForecastModel.toJson();

    //assert
    final expectedMap = {
      "city": {"name": "Jakarta"},
      "list": [
        {
          "weather": [
            {"main": "Rain", "icon": "10d"}
          ],
          "dt_txt": "2023-11-29 09:00:00",
          "main": {
            "temp": 32.52,
            "temp_min": 31.73,
            "temp_max": 32.52,
            "pressure": 1006,
            "humidity": 67
          }
        },
        {
          "weather": [
            {"main": "Rain", "icon": "10n"}
          ],
          "dt_txt": "2023-11-29 12:00:00",
          "main": {
            "temp": 30.96,
            "temp_min": 29.98,
            "temp_max": 30.96,
            "pressure": 1007,
            "humidity": 67
          }
        },
      ]
    };

    expect(result, expectedMap);
  });
}
