// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_jojo/core/extension/parse_clock_hour.dart';

import 'package:weather_jojo/domain/entities/forecast_entity.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({
    Key? key,
    required this.forecast,
  }) : super(key: key);

  final ForecastWeatherEntity forecast;
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return Container(
      width: screenW * 0.13,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(forecast.dateTxt.clockHour, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(
            height: screenH * 0.06,
            width: screenW * 0.12,
            child: Image.network(
              'http://openweathermap.org/img/wn/${forecast.iconCode}@2x.png',
              fit: BoxFit.cover,
            ),
          ),
          Text('${forecast.temperature.toInt()}°',
              style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
