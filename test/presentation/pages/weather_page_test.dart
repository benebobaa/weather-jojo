import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_state.dart';
import 'package:weather_jojo/presentation/pages/weather_page.dart';
import 'package:weather_jojo/presentation/widgets/main_top_section.dart';
import 'package:weather_jojo/presentation/widgets/not_found_search.dart';

import '../../helpers/bloc_mocks.dart';
import '../../helpers/constants/test_weather_data.dart';

void main() {
  late MockWeatherBloc mockWeatherBloc;

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
    HttpOverrides.global = null;
  });

  Widget makeTestAbleWidget(Widget body) {
    return BlocProvider<WeatherBloc>(
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
  testWidgets(
      'should show [CircularProgresIndicator] widget when state is [WeatherLoading]',
      (widgetTester) async {
    //arrange
    when(() => mockWeatherBloc.state).thenReturn(WeatherLoading());

    //act
    await widgetTester.pumpWidget(makeTestAbleWidget(WeatherPage(
      position: testPosition,
    )));

    //assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'should show [MainTopSection] widget when state is [WeatherLoaded]',
      (widgetTester) async {
    //arrange
    when(() => mockWeatherBloc.state).thenReturn(WeatherLoaded(
        cityName: testCityName, data: testLoadedData, selectedIndex: 0));

    //act
    await widgetTester.pumpWidget(makeTestAbleWidget(WeatherPage(
      position: testPosition,
    )));
    await widgetTester.pumpAndSettle();

    //assert
    expect(find.byType(MainTopSection), findsOneWidget);
  });
}
