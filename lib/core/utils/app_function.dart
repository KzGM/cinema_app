import 'dart:math';

import 'package:flutter/material.dart';

import '../../features/seat_selection/domain/entities/seat_theater_entity.dart';
import '../common/constants/app_constants.dart';
import '../common/enums/image_size.dart';

String getImageUrl(
  String? id, {
  ImageMovieSize imageMovieSize = ImageMovieSize.w500,
}) {
  if (id == null) {
    return noPosterImageUrl;
  }
  return '$image500BaseUrl/$id';
}

Color getVoteAverageBgColor(double? voteAvg, ThemeData theme) {
  if (voteAvg == null) {
    return theme.colorScheme.primary;
  }
  switch (voteAvg) {
    case >= 0 && < 5:
      return theme.colorScheme.error;
    case >= 7 && < 10:
      return theme.colorScheme.secondary;
    default:
      return theme.colorScheme.primary;
  }
}

List<SeatTheaterEntity> generateSeatTheater() {
  final result = <SeatTheaterEntity>[];
  for (var i = 0; i < 12; i++) {
    for (var j = 0; j < 12; j++) {
      final String position = String.fromCharCode(65 + i) + j.toString();
      final random = Random().nextInt(2);
      result.add(
        SeatTheaterEntity(
          position: position,
          status: SeatTheaterStatus.values[random],
        ),
      );
    }
  }
  return result;
}
