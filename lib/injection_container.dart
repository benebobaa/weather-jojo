import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_jojo/data/data_sources/local_data_sources/weather_local_data_source.dart';
import 'package:weather_jojo/data/data_sources/remote_data_sources/weather_remote_data_source.dart';
import 'package:weather_jojo/data/repositories/weather_repository_impl.dart';
import 'package:weather_jojo/domain/repositories/weather_repository.dart';
import 'package:weather_jojo/domain/usecases/weather_usecase.dart';
import 'package:weather_jojo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:weather_jojo/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

class ServiceLocator {
  static Future<void> setup() async {
    //bloc
    locator.registerFactory(() => WeatherBloc(locator()));
    locator.registerFactory(() => SplashBloc());
    locator.registerFactory(() => SearchBloc(locator()));

    //usecase
    locator.registerLazySingleton(() => WeatherUsecase(locator()));

    //repository
    locator.registerLazySingleton<WeatherRepository>(() =>
        WeatherRepositoryImpl(
            remoteDataSource: locator(), localDataSource: locator()));

    //datasource
    locator.registerLazySingleton<WeatherRemoteDataSource>(
        () => WeatherRemoteDataSourceImpl(client: locator()));

    locator.registerLazySingleton<WeatherLocalDataSource>(
        () => WeatherLocalDataSourceImpl(prefs: locator()));
    //http
    locator.registerLazySingleton(() => http.Client());

    //shared preference
    final sharedPreferences = await SharedPreferences.getInstance();
    locator.registerSingleton<SharedPreferences>(sharedPreferences);
  }
}
