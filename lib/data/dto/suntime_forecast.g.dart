// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suntime_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuntimeForecast _$SuntimeForecastFromJson(Map<String, dynamic> json) =>
    SuntimeForecast(
      (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      (json['sunrise'] as List<dynamic>).map((e) => e as String).toList(),
      (json['sunset'] as List<dynamic>).map((e) => e as String).toList(),
      (json['weathercode'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$SuntimeForecastToJson(SuntimeForecast instance) =>
    <String, dynamic>{
      'time': instance.dates,
      'sunrise': instance.sunriseTimes,
      'sunset': instance.sunsetTimes,
      'weathercode': instance.weatherCodes,
    };
