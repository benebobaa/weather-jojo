import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_jojo/core/services/locator.dart';
import 'package:weather_jojo/domain/entities/forecast_entity.dart';
import 'package:weather_jojo/domain/usecases/weather_usecase.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUsecase _usecase;
  int selectedIndex = 0;
  String cityName = '';
  List<List<ForecastWeatherEntity>> resultData = [];

  WeatherBloc(this._usecase) : super(WeatherEmpty()) {
    on<OnForecastByPosition>((event, emit) async {
      final result = await _usecase.getForecastByPosition(event.lat, event.lon);
      result.fold((failure) => null, (data) {
        Map<String, List<ForecastWeatherEntity>> groupedData = {};

        for (var item in data.list) {
          // Extract date from "dt_txt" field
          String dateString = item.dateTxt;
          String dateKey = dateString.split(' ')[0];

          if (groupedData.containsKey(dateKey)) {
            groupedData[dateKey]!.add(item);
          } else {
            groupedData[dateKey] = [item];
          }
        }

        // Convert the map values to a list
        resultData = groupedData.values.toList();
        print(resultData);
        cityName = data.cityName;
        emit(WeatherLoaded(
            cityName: data.cityName,
            data: resultData,
            selectedIndex: selectedIndex));
      });
    });

    on<OnChangeSelectDay>((event, emit) {
      selectedIndex = event.index;
      emit(WeatherLoaded(
          cityName: cityName, data: resultData, selectedIndex: selectedIndex));
    });
  }
}
