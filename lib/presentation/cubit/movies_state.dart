import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/domain/models/movie_response.dart';
import 'package:movie_app/utils/constants/enums.dart';

part 'movies_state.freezed.dart';
part 'movies_state.g.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState({
    @Default(NetworkStatus.initial) NetworkStatus status,
    @Default(MovieResponse()) MovieResponse response,
  }) = _MoviesState;

  factory MoviesState.fromJson(Map<String, Object?> json) =>
      _$MoviesStateFromJson(json);

  const MoviesState._();

  List<Movie> get movies => response.results;
}
