import 'package:json_annotation/json_annotation.dart';

import 'movie_video.dart';

part 'movie_video_response.g.dart';

@JsonSerializable()
class MovieVideoReponse {
  int? id;
  List<MovieVideo>? results;
  MovieVideoReponse({
    this.id,
    this.results,
  });

  // toJSON và fromJSON
  factory MovieVideoReponse.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoReponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoReponseToJson(this);
}
