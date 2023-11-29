import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_jojo/core/services/locator.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_event.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_state.dart';

import '../../../helpers/constants/test_weather_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SplashBloc splashBloc;
  late MockLocationService mockLocationService;

  setUp(() {
    splashBloc = SplashBloc();
    
  });

  blocTest<SplashBloc, SplashState>(
    'emits [SplashLoading, SplashLoaded] when OnGetLocation is added.',
    build: () {
      when(LocationService.getCurrentLocation())
          .thenAnswer((_) async => testPosition);
      return splashBloc;
    },
    act: (bloc) => bloc.add(OnGetLocation()),
    expect: () => <SplashState>[
      SplashLoading(),
      SplashLoaded(result: testPosition),
    ],
  );
}
