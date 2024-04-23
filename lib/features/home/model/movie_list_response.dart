// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/common/model/dates.dart';
import 'movie.dart';
part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse {
  final Dates? dates;
  final int? page;
  final List<Movie>? results;
  MovieListResponse({
    this.dates,
    this.page,
    this.results,
  });

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  /// Connect the generated [_$MovieListResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
