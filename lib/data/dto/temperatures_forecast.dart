import 'package:json_annotation/json_annotation.dart';

part 'temperatures_forecast.g.dart';

@JsonSerializable()
class TemperaturesForecast {
  @JsonKey(name: "time")
  List<String> hours;
  @JsonKey(name: "temperature_2m")
  List<double> temperatures;

  @JsonKey(name: "apparent_temperature")
  List<double> apparentTemperatures;

  TemperaturesForecast(this.hours, this.temperatures, this.apparentTemperatures);

  factory TemperaturesForecast.fromJson(Map<String, dynamic> json) => _$TemperaturesForecastFromJson(json);

  Map<String, dynamic> toJson() => _$TemperaturesForecastToJson(this);
}