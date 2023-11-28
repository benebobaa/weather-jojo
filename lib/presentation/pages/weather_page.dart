// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_state.dart';
import 'package:weather_jojo/presentation/widgets/daily_forecast_item.dart';
import 'package:weather_jojo/presentation/widgets/hourly_forecast_item.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({
    Key? key,
    required this.position,
  }) : super(key: key);

  final Position position;

  static const routeName = '/weather';

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<WeatherBloc>().add(OnCityByPosition(
        lat: widget.position.latitude, lon: widget.position.longitude));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.deepPurpleAccent,
                      Colors.blue,
                      Colors.lightBlue
                    ],
                  ),
                ),
                height: screenH * 0.37,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenH * 0.05, horizontal: screenW * 0.05),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New York',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenH * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '18°C',
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Cooling',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                SizedBox(height: screenH * 0.02),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_downward,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '15°C',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    SizedBox(width: screenW * 0.02),
                                    Icon(
                                      Icons.arrow_upward,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '20°C',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                              height: screenH * 0.2,
                              width: screenW * 0.4,
                              child: Image.network(
                                'http://openweathermap.org/img/wn/04d.png',
                                fit: BoxFit.cover,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey.withOpacity(0.08),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Text(
                            'DAILY FORECAST',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: screenH * 0.15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return DailyForecastItem();
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Text(
                          'HOURLY FORECAST',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          height: screenH * 0.15,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return HourlyForecastItem();
                            },
                          ))
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
