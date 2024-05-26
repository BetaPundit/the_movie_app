import 'package:dio/dio.dart';
import 'package:movie_app/domain/models/movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_api_service.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class MoviesApiService {
  factory MoviesApiService(Dio dio) = _MoviesApiService;

  @GET("/movie/now_playing")
  Future<HttpResponse<MovieResponse>> fetchNowPlayingMovies({
    @Query('language') String? language = 'en-US',
    @Query('page') int? page = 1,
  });

  @GET("/movie/top_rated")
  Future<HttpResponse<MovieResponse>> fetchTopRatedMovies({
    @Query('language') String? language = 'en-US',
    @Query('page') int? page = 1,
  });
}
