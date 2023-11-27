import 'package:flutter/material.dart';
import 'package:weather_jojo/core/pages/under_construction_page.dart';
import 'package:weather_jojo/presentation/pages/splash_page.dart';
import 'package:weather_jojo/presentation/pages/weather_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case SplashPage.routeName:
    //   return _pageBuilder((_) => const SplashPage(), settings: settings);
    //weather
    case WeatherPage.routeName:
      return _pageBuilder((_) => const WeatherPage(), settings: settings);

    default:
      return _pageBuilder(
        (_) => const UnderConstructionPage(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
