// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyForecast _$WeeklyForecastFromJson(Map<String, dynamic> json) =>
    WeeklyForecast(
      TemperaturesForecast.fromJson(json['hourly'] as Map<String, dynamic>),
      SuntimeForecast.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeeklyForecastToJson(WeeklyForecast instance) =>
    <String, dynamic>{
      'hourly': instance.hourlyTemperatures,
      'daily': instance.suntimeForecast,
    };
