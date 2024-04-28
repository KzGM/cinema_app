// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../movie_detail/data/models/session_model.dart';
import '../../../movie_detail/domain/entities/movie_detail_entity.dart';
import '../../data/models/ticket_model.dart';
import 'seat_theater_entity.dart';

class TicketEntity {
  String? id;
  MovieDetailEntity? movie;
  SessionModel? session;
  List<String>? seats;
  double? totalAmount;
  DateTime? createdAt;
  String? userId;
  TicketEntity({
    this.id,
    this.movie,
    this.session,
    this.seats,
    this.totalAmount,
    this.createdAt,
    this.userId,
  });

  TicketEntity copyWith({
    String? id,
    MovieDetailEntity? movie,
    SessionModel? session,
    List<String>? seats,
    double? totalAmount,
    DateTime? createdAt,
    String? userId,
  }) {
    return TicketEntity(
      id: id ?? this.id,
      movie: movie ?? this.movie,
      session: session ?? this.session,
      seats: seats ?? this.seats,
      totalAmount: totalAmount ?? this.totalAmount,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
    );
  }
}
