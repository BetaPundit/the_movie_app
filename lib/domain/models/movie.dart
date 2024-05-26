import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/utils/helper_functions.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    int? id,
    String? title,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'original_language') String? originalLanguage,
    String? overview,
    bool? adult,
    bool? video,
    double? popularity,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date', fromJson: HelperFunctions.toDate)
    DateTime? releaseDate,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
