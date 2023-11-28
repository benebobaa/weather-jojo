import 'package:flutter_bloc/flutter_bloc.dart';
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
      emit(WeatherLoading());
      final result = await _usecase.getForecastByPosition(event.lat, event.lon);
      result.fold((failure) => null, (data) {
        resultData = _groupByDate(data);
        cityName = data.cityName;
        emit(WeatherLoaded(
            cityName: data.cityName,
            data: resultData,
            selectedIndex: selectedIndex));
      });
    });

    on<OnChangeSearch>((event, emit) async {
      emit(WeatherLoading());
      final result = await _usecase.getForecastByName(event.name);

      result.fold((failure) => emit(WeatherError(message: failure.message)),
          (data) {
        resultData.clear();
        resultData = _groupByDate(data);
        cityName = data.cityName;
        selectedIndex = 0;

        emit(WeatherLoaded(
            cityName: data.cityName,
            data: resultData,
            selectedIndex: selectedIndex));
      });
    });

    //
    on<OnChangeSelectDay>((event, emit) {
      selectedIndex = event.index;
      emit(WeatherLoaded(
          cityName: cityName, data: resultData, selectedIndex: selectedIndex));
    });

    
  }

  List<List<ForecastWeatherEntity>> _groupByDate(ForecastEntity data) {
    Map<String, List<ForecastWeatherEntity>> groupedData = {};

    for (var item in data.list) {
      String dateString = item.dateTxt;
      String dateKey = dateString.split(' ')[0];

      if (groupedData.containsKey(dateKey)) {
        groupedData[dateKey]!.add(item);
      } else {
        groupedData[dateKey] = [item];
      }
    }

    return groupedData.values.toList();
  }
}
