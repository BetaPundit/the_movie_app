import 'package:movie_app/domain/models/movie_response.dart';
import 'package:movie_app/utils/resources/data_state.dart';

abstract class MoviesRepository {
  Future<DataState<MovieResponse?>> getNowPlayingMovies({
    String? language,
    int? page,
  });
  Future<DataState<MovieResponse?>> getTopRatedMovies({
    String? language,
    int? page,
  });
}
