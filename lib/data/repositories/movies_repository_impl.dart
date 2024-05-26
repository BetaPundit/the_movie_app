import 'package:injectable/injectable.dart';
import 'package:movie_app/data/base/base_api_repository.dart';
import 'package:movie_app/data/datasources/remote/movies_api_service.dart';
import 'package:movie_app/domain/models/movie_response.dart';
import 'package:movie_app/domain/repositories/movies_repository.dart';
import 'package:movie_app/utils/resources/data_state.dart';

@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl extends BaseApiRepository
    implements MoviesRepository {
  final MoviesApiService _moviesApiService;
  MoviesRepositoryImpl(this._moviesApiService);

  @override
  Future<DataState<MovieResponse?>> getNowPlayingMovies({
    String? language,
    int? page,
  }) {
    return getStateOf<MovieResponse>(
      request: () => _moviesApiService.fetchNowPlayingMovies(
        language: language,
        page: page,
      ),
    );
  }

  @override
  Future<DataState<MovieResponse?>> getTopRatedMovies({
    String? language,
    int? page,
  }) {
    return getStateOf<MovieResponse>(
      request: () => _moviesApiService.fetchTopRatedMovies(
        language: language,
        page: page,
      ),
    );
  }
}
