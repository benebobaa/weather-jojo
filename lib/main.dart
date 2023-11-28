import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_jojo/core/services/router.dart';
import 'package:weather_jojo/injection_container.dart';
import 'package:weather_jojo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<WeatherBloc>()),
        BlocProvider(create: (context) => locator<SplashBloc>()),
        BlocProvider(create: (context) => locator<SearchBloc  >()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
