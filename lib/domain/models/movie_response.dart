import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/domain/models/movie.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    int? page,
    @Default(<Movie>[]) List<Movie> results,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, Object?> json) =>
      _$MovieResponseFromJson(json);
}
