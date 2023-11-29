import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_state.dart';
import 'package:weather_jojo/presentation/pages/weather_page.dart';
import 'package:weather_jojo/presentation/widgets/not_found_search.dart';

import '../../helpers/constants/test_weather_data.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  late MockWeatherBloc mockWeatherBloc;

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
  });

  Widget makeTestAbleWidget(Widget body) {
    return BlocProvider(
      create: (context) => mockWeatherBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'should show [CityNotFound] widget and [SnackBar] when state is [WeatherError]',
      (widgetTester) async {
    //arrange
    when(() => mockWeatherBloc.state)
        .thenReturn(WeatherError(message: 'City not found'));

    //act
    await widgetTester.pumpWidget(makeTestAbleWidget(WeatherPage(
      position: testPosition,
    )));

    //assert
    expect(find.byType(CityNotFound), findsOneWidget);
  });
}
