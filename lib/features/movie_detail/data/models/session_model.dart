// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  DateTime? time;
  String? filmFormat;
  String? theaterName;
  double? adultCost;
  double? childCost;
  double? studentCost;
  double? vipCost;
  SessionModel({
    this.time,
    this.filmFormat,
    this.theaterName,
    this.adultCost,
    this.childCost,
    this.studentCost,
    this.vipCost,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}
