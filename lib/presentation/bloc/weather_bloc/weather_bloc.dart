import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_jojo/core/services/locator.dart';
import 'package:weather_jojo/domain/usecases/weather_usecase.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUsecase _usecase;

  WeatherBloc(this._usecase) : super(WeatherEmpty()) {
    on<OnCityByPosition>((event, emit) async {
      LocationService.getCurrentLocation();
      emit(WeatherLoading());
      final result =
          await _usecase.getCurrentWeatherByPosition(event.lat, event.lon);
      result.fold((failure) => emit(WeatherError(message: failure.message)),
          (result) => emit(WeatherLoaded(result: result)));
    });
  }
}
