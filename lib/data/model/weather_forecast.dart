import 'daily_forecast.dart';

class WeatherForecast {
  String locality;
  List<DailyForecast> dailyForecasts;

  WeatherForecast(this.dailyForecasts, this.locality);
}