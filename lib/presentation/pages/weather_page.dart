import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_jojo/core/services/locator.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_state.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  static const routeName = '/weather';

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() async{
    // TODO: implement initState
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              child: Text('Weather Page'),
            );
          },
        ),
      ),
    );
  }
}
