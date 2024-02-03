// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyForecastResponse _$WeeklyForecastResponseFromJson(
        Map<String, dynamic> json) =>
    WeeklyForecastResponse(
      TemperaturesForecast.fromJson(json['hourly'] as Map<String, dynamic>),
      SuntimeForecast.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeeklyForecastResponseToJson(
        WeeklyForecastResponse instance) =>
    <String, dynamic>{
      'hourly': instance.hourlyTemperatures,
      'daily': instance.suntimeForecast,
    };
