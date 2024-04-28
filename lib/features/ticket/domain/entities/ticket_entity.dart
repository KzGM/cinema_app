class TicketEntity {
  String? id;
  String? title;
  double? runTime;
  String? filmFormat;
  String? theater;
  DateTime? time;
  List<String>? seats;
  double? unitPrice;
  String? userId;
  DateTime? createdAt;

  TicketEntity({
    this.id,
    this.title,
    this.runTime,
    this.filmFormat,
    this.theater,
    this.time,
    this.seats,
    this.unitPrice,
    this.userId,
    this.createdAt,
  });
}
