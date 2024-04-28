// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      filmFormat: json['filmFormat'] as String?,
      theaterName: json['theaterName'] as String?,
      adultCost: (json['adultCost'] as num?)?.toDouble(),
      childCost: (json['childCost'] as num?)?.toDouble(),
      studentCost: (json['studentCost'] as num?)?.toDouble(),
      vipCost: (json['vipCost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'filmFormat': instance.filmFormat,
      'theaterName': instance.theaterName,
      'adultCost': instance.adultCost,
      'childCost': instance.childCost,
      'studentCost': instance.studentCost,
      'vipCost': instance.vipCost,
    };
