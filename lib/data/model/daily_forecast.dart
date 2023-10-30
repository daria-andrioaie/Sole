import 'package:weather_app/data/model/weather_description.dart';

class DailyForecast {
  DateTime date;
  DateTime sunrise;
  DateTime sunset;

  WeatherDescription description;
  List<double> hourlyTemperatures;

  DailyForecast(this.date, this.sunrise, this.sunset, this.description, this.hourlyTemperatures);
}