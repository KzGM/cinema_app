// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'movie_video.g.dart';

@JsonSerializable()
class MovieVideo {
  String? name;
  String? key;
  String? site;
  String? type;
  bool? official;

  MovieVideo({
    this.name,
    this.key,
    this.site,
    this.type,
    this.official,
  });

  // toJSON và fromJSON
  factory MovieVideo.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoToJson(this);
}
