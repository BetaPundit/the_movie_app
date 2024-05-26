import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/models/movie_response.dart';
import 'package:movie_app/domain/repositories/movies_repository.dart';
import 'package:movie_app/presentation/cubit/movies_state.dart';
import 'package:movie_app/utils/constants/enums.dart';
import 'package:movie_app/utils/resources/data_state.dart';

@injectable
class TopRatedMoviesCubit extends HydratedCubit<MoviesState> {
  TopRatedMoviesCubit(this._moviesRepository) : super(const MoviesState()) {
    scrollController.addListener(() {
      if (!state.status.isLoading) {
        _pagination();
      }
    });
  }

  final MoviesRepository _moviesRepository;
  final scrollController = ScrollController();
  MovieResponse _movieResponse = const MovieResponse();
  int _currentPage = 1;

  Future<void> fetchMovies({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _movieResponse = const MovieResponse();
      emit(state.copyWith(
        status: NetworkStatus.success,
        response: _movieResponse,
      ));
    }
    emit(state.copyWith(status: NetworkStatus.loading));

    final response =
        await _moviesRepository.getTopRatedMovies(page: _currentPage);

    if (response is DataSuccess) {
      _movieResponse = MovieResponse(
        page: response.data!.page,
        results: _movieResponse.results + response.data!.results,
      );

      emit(state.copyWith(
        status: NetworkStatus.success,
        response: _movieResponse,
      ));
    } else if (response is DataFailed) {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }

  void _pagination() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _currentPage += 1;
      fetchMovies();
    }
  }

  @override
  MoviesState fromJson(Map<String, dynamic> json) => MoviesState.fromJson(json);

  @override
  Map<String, dynamic> toJson(MoviesState state) => state.toJson();
}
