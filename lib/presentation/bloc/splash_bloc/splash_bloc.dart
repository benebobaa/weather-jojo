import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_jojo/core/services/locator.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_event.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<OnGetLocation>((event, emit) async {
      emit(SplashLoading());
      await Future.delayed(Duration(seconds: 2));
      final result = await LocationService.getCurrentLocation();
      emit(SplashLoaded(result: result));
    });
  }
}
