// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieDetailEntity {
  String? title;
  String? description;
  String? tagline;
  double? budget;
  String? genre;
  DateTime? releaseDate;
  double? revenue;
  double? voteAverage;
  int? voteCount;
  double? runtime;
  List<String>? countries;
  String? youtubeName;
  String? youtubeUrl;
  String? posterUrl;
  MovieDetailEntity({
    this.title,
    this.description,
    this.tagline,
    this.budget,
    this.genre,
    this.releaseDate,
    this.revenue,
    this.voteAverage,
    this.voteCount,
    this.runtime,
    this.countries,
    this.youtubeName,
    this.youtubeUrl,
    this.posterUrl,
  });
}
