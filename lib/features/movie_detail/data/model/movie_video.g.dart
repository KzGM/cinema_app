// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideo _$MovieVideoFromJson(Map<String, dynamic> json) => MovieVideo(
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      type: json['type'] as String?,
      official: json['official'] as bool?,
    );

Map<String, dynamic> _$MovieVideoToJson(MovieVideo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'type': instance.type,
      'official': instance.official,
    };
