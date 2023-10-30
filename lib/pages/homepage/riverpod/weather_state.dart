import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/model/daily_forecast.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;

  const factory WeatherState.loading() = _Loading;

  const factory WeatherState.weather(List<DailyForecast> dailyForecast) = _WeatherState;

  const factory WeatherState.error(String error) = _Error;
}