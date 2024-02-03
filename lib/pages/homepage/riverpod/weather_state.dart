import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sole/data/model/daily_forecast.dart';

import '../../../data/model/weather_forecast.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;

  const factory WeatherState.loading() = _Loading;

  const factory WeatherState.weather(WeatherForecast forecast) = _WeatherState;

  const factory WeatherState.error(String error) = _Error;
}