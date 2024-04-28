import 'package:json_annotation/json_annotation.dart';

import '../../../../core/common/enums/genre.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  int? id;
  String? title;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  String? get genre {
    final genreString = genreIds
        ?.map((e) => Genre.getGenreById(e).toString().split('.').last)
        .toList()
        .join(', ');
    return genreString;
  }

  String get posterUrl =>
      'https://image.tmdb.org/t/p/original/${posterPath ?? ' '}';
  Movie({
    this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
