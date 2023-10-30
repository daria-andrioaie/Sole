
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/dto/suntime_forecast.dart';
import 'package:weather_app/data/dto/temperatures_forecast.dart';

part 'weekly_forecast.g.dart';

@JsonSerializable()
class WeeklyForecast {
  @JsonKey(name: "hourly")
  TemperaturesForecast hourlyTemperatures;

  @JsonKey(name: "daily")
  SuntimeForecast suntimeForecast;
  WeeklyForecast(this.hourlyTemperatures, this.suntimeForecast);

  factory WeeklyForecast.fromJson(Map<String, dynamic> json) => _$WeeklyForecastFromJson(json);
}