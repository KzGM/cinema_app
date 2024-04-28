// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      title: json['title'] as String?,
    )
      ..id = (json['id'] as num?)?.toInt()
      ..genreIds = (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..posterPath = json['poster_path'] as String?
      ..voteAverage = (json['vote_average'] as num?)?.toDouble();

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'genre_ids': instance.genreIds,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
    };
