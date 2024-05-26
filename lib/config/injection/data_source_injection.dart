import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:movie_app/data/datasources/remote/movies_api_service.dart';

@module
abstract class DataSourceInjectableModule {
  MoviesApiService getMoviesService(Dio dio) => MoviesApiService(dio);
}
