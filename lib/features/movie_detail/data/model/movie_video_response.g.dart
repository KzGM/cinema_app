// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideoReponse _$MovieVideoReponseFromJson(Map<String, dynamic> json) =>
    MovieVideoReponse(
      id: (json['id'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieVideoReponseToJson(MovieVideoReponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
