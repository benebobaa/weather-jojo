import 'package:flutter/material.dart';

class DailyForecastItem extends StatelessWidget {
  const DailyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return Container(
      width: screenW * 0.25,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Mon', style: TextStyle(color: Colors.grey)),
          Container(
            height: screenH * 0.08,
            width: screenW * 0.17,
            child: Image.network(
              'http://openweathermap.org/img/wn/04d@2x.png',
              fit: BoxFit.cover,
            ),
          ),
          Text('Cloudy'),
        ],
      ),
    );
  }
}
