// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      title: json['title'] as String?,
    )
      ..genreIds =
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..posterPath = json['poster_path'] as String?
      ..voteAverage = (json['vote_average'] as num?)?.toDouble();

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'genre_ids': instance.genreIds,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
    };
