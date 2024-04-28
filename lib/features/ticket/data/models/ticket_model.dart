import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/ticket_entity.dart';

class TicketModel {
  String? id;
  String? title; // col
  double? runTime; // col
  String? filmFormat;
  String? theater;
  DateTime? time;
  List<String>? seats; // "S7, S8, S9"
  double? unitPrice;
  String? userId;
  DateTime? createdAt;
  TicketModel({
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

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      runTime: json['runTime'] as double?,
      filmFormat: json['filmFormat'] as String?,
      theater: json['theater'] as String?,
      time: DateTime.tryParse(json['time']), // DateTimeString theo chuẩn 8061
      // Parse String -> DateTime
      seats:
          (jsonDecode(json['seats']) as List).map((e) => e as String).toList(),
      unitPrice: json['unitPrice'] as double?,
      userId: json['userId'] as String?,
      createdAt: DateTime.tryParse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'runTime': runTime,
      'filmFormat': filmFormat,
      'theater': theater,
      'time': time?.toUtc().toIso8601String(),
      'seats': jsonEncode(seats),
      'unitPrice': unitPrice,
      'userId': userId,
      'createdAt': createdAt?.toUtc().toIso8601String(),
    };
  }

  // Entity -> Model
  factory TicketModel.fromEntity(TicketEntity entity) {
    return TicketModel(
      id: entity.id ?? const Uuid().v4(),
      title: entity.title,
      runTime: entity.runTime,
      filmFormat: entity.filmFormat,
      theater: entity.theater,
      time: entity.time,
      seats: entity.seats,
      unitPrice: entity.unitPrice,
      userId: entity.userId ?? FirebaseAuth.instance.currentUser?.uid ?? '',
      createdAt: entity.createdAt ?? DateTime.now(),
    );
  }

  TicketEntity toEntity() {
    return TicketEntity(
      id: id, //id của model -> id của entity, so on
      title: title,
      runTime: runTime,
      filmFormat: filmFormat,
      theater: theater,
      time: time,
      seats: seats,
      unitPrice: unitPrice,
      userId: userId,
      createdAt: createdAt,
    );
  }
}
