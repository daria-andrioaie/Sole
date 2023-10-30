import 'package:json_annotation/json_annotation.dart';

part 'suntime_forecast.g.dart';

@JsonSerializable()
class SuntimeForecast {
  @JsonKey(name: 'time')
  List<String> dates;
  @JsonKey(name: 'sunrise')
  List<String> sunriseTimes;
  @JsonKey(name: 'sunset')
  List<String> sunsetTimes;
  @JsonKey(name: 'weathercode')
  List<int> weatherCodes;

  SuntimeForecast(this.dates, this.sunriseTimes, this.sunsetTimes, this.weatherCodes);

  factory SuntimeForecast.fromJson(Map<String, dynamic> json) => _$SuntimeForecastFromJson(json);
}