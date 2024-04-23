// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  List<Movie>? results;
  MovieResponse({
    this.results,
  });
  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
