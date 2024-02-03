
import 'package:json_annotation/json_annotation.dart';
import 'package:sole/data/dto/suntime_forecast.dart';
import 'package:sole/data/dto/temperatures_forecast.dart';

part 'weekly_forecast.g.dart';

@JsonSerializable()
class WeeklyForecastResponse {
  @JsonKey(name: "hourly")
  TemperaturesForecast hourlyTemperatures;

  @JsonKey(name: "daily")
  SuntimeForecast suntimeForecast;
  WeeklyForecastResponse(this.hourlyTemperatures, this.suntimeForecast);

  factory WeeklyForecastResponse.fromJson(Map<String, dynamic> json) => _$WeeklyForecastResponseFromJson(json);
}