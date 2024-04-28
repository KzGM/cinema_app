// ignore_for_file: public_member_api_docs, sort_constructors_first
enum SeatTheaterStatus {
  available,
  occupied,
  chosen;

  SeatTheaterStatus toggle() {
    if (this == SeatTheaterStatus.available) {
      return SeatTheaterStatus.chosen;
    } else {
      return SeatTheaterStatus.available;
    }
  }
}

class SeatTheaterEntity {
  String position;
  SeatTheaterStatus status;
  SeatTheaterEntity({
    required this.position,
    required this.status,
  });
}
