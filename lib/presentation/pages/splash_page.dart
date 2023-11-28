import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_jojo/core/constants/media_res.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_event.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_state.dart';
import 'package:weather_jojo/presentation/pages/weather_page.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = '/';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<SplashBloc>().add(OnGetLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              Navigator.pushNamed(context, WeatherPage.routeName,
                  arguments: state.result);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(MediaRes.aniSplashPage),
              Text('Jojo Weather')
            ],
          ),
        ),
      ),
    );
  }
}
