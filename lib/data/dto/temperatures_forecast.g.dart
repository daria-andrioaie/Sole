// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperatures_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperaturesForecast _$TemperaturesForecastFromJson(
        Map<String, dynamic> json) =>
    TemperaturesForecast(
      (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      (json['apparent_temperature'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$TemperaturesForecastToJson(
        TemperaturesForecast instance) =>
    <String, dynamic>{
      'time': instance.hours,
      'temperature_2m': instance.temperatures,
      'apparent_temperature': instance.apparentTemperatures,
    };
