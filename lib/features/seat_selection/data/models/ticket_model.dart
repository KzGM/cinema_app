// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../movie_detail/data/models/session_model.dart';
import '../../../movie_detail/domain/entities/movie_detail_entity.dart';
import '../../domain/entities/ticket_entity.dart';

class TicketModel {
  String? id;
  String? title;
  // theater_name
  String? theaterName;
  // poster_url
  String? posterUrl;
  // run_time
  double? runTime;
  List<String>? seats;
  // amount_per_seat
  double? amountPerSeat;
  // total_amount
  double? totalAmount;
  // created_at
  DateTime? createdAt;
  // user_id
  String? userId;
  TicketModel({
    this.id,
    this.title,
    this.theaterName,
    this.posterUrl,
    this.runTime,
    this.seats,
    this.amountPerSeat,
    this.totalAmount,
    this.createdAt,
    this.userId,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      theaterName: json['theater_name'] as String?,
      posterUrl: json['poster_url'] as String?,
      runTime: json['runTime'] as double?,
      seats: (jsonDecode(json['seats'] as String? ?? '[]') as List)
          .map((e) => e as String)
          .toList(),
      amountPerSeat: json['amount_per_seat'] as double?,
      totalAmount: json['total_amount'] as double?,
      createdAt: DateTime.tryParse(json['created_at']),
      userId: json['user_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'theater_name': theaterName,
      'poster_url': posterUrl,
      'run_time': runTime,
      'seats': jsonEncode(seats),
      'amount_per_seat': amountPerSeat,
      'total_amount': totalAmount,
      'created_at': createdAt?.toIso8601String(),
      'user_id': userId,
    };
  }

  TicketEntity convertToEntity() {
    return TicketEntity(
      id: id,
      movie: MovieDetailEntity(
        title: title,
        runtime: runTime,
        posterUrl: posterUrl,
      ),
      session: SessionModel(
        theaterName: theaterName,
        adultCost: amountPerSeat,
      ),
      seats: seats,
      totalAmount: totalAmount,
      createdAt: createdAt,
      userId: userId,
    );
  }

  factory TicketModel.fromEntity(TicketEntity entity) {
    return TicketModel(
      id: entity.id,
      title: entity.movie?.title,
      theaterName: entity.session?.theaterName,
      runTime: entity.movie?.runtime,
      seats: entity.seats,
      amountPerSeat: entity.session?.adultCost,
      totalAmount: entity.totalAmount,
      createdAt: entity.createdAt,
      userId: entity.userId,
      posterUrl: entity.movie?.posterUrl,
    );
  }
}
