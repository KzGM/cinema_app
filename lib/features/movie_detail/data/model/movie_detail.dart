import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'production_country.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  int? id;
  double? budget;
  List<Genre>? genres;
  String? overview;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? productionCountries;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  double? runtime;
  double? revenue;
  String? title;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  MovieDetail({
    this.id,
    this.budget,
    this.genres,
    this.overview,
    this.productionCountries,
    this.releaseDate,
    this.runtime,
    this.revenue,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  // toJSON và fromJSON
  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}
