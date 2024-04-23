// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieSessionEntity {
  DateTime? sessionTime;
  String? filmFormat;
  String? theater;
  double? adultPrice;
  double? childPrice;
  double? studentPrice;
  double? vipPrice;
  MovieSessionEntity({
    this.sessionTime,
    this.filmFormat,
    this.theater,
    this.adultPrice,
    this.childPrice,
    this.studentPrice,
    this.vipPrice,
  });
}
