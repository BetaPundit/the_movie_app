import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/repositories/movies_repository.dart';
import 'package:movie_app/presentation/cubit/movies_state.dart';
import 'package:movie_app/utils/constants/enums.dart';
import 'package:movie_app/utils/resources/data_state.dart';

@injectable
class NowPlayingMoviesCubit extends HydratedCubit<MoviesState> {
  NowPlayingMoviesCubit(this._moviesRepository) : super(const MoviesState());

  final MoviesRepository _moviesRepository;
  final pageController = PageController(initialPage: 0, viewportFraction: .8);

  Future<void> fetchMovies() async {
    emit(state.copyWith(status: NetworkStatus.loading));

    final response = await _moviesRepository.getNowPlayingMovies();

    if (response is DataSuccess) {
      emit(state.copyWith(
        status: NetworkStatus.success,
        response: response.data!,
      ));
    } else if (response is DataFailed) {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }

  @override
  MoviesState fromJson(Map<String, dynamic> json) => MoviesState.fromJson(json);

  @override
  Map<String, dynamic> toJson(MoviesState state) => state.toJson();
}
