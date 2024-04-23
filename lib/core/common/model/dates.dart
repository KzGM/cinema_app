import 'package:json_annotation/json_annotation.dart';

part 'dates.g.dart';

@JsonSerializable()
class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  /// Connect the generated [_$DatesToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DatesToJson(this);
}
