import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

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
          Text('2 PM', style: TextStyle(color: Colors.grey, fontSize: 12)),
          Container(
            height: screenH * 0.06,
            width: screenW * 0.12,
            child: Image.network(
              'http://openweathermap.org/img/wn/10d@2x.png',
              fit: BoxFit.cover,
            ),
          ),
          Text('36°', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
