import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/data/dto/weekly_forecast.dart';
import 'package:weather_app/data/model/weather_description.dart';
import 'package:weather_app/di/injection_container.dart';
import 'package:weather_app/pages/homepage/riverpod/weather_state.dart';

import '../../../data/model/daily_forecast.dart';
import '../../../resources/strings.dart';

part 'weather_state_notifier.g.dart';

@riverpod
class WeatherStateNotifier extends _$WeatherStateNotifier {
  FutureOr<void> getWeather() async {
    state = const WeatherState.loading();
    final repository = ref.read(weatherRepositoryProvider);
    final response = await repository.getForecast();

    if(response.isSuccessful) {

      state = WeatherState.weather(_convertWeeklyForecastResponse(response.data));
    } else {
      if(response.isNoNetworkError) {
        state = const WeatherState.error(AppStrings.networkError);
      } else {
        state = WeatherState.error(response.errorResponse.reason);
      }
    }
  }

  List<DailyForecast> _convertWeeklyForecastResponse(WeeklyForecast forecast) {
    List<DailyForecast> dailyForecasts = [];

    for(var dayIndex = 0; dayIndex < forecast.suntimeForecast.dates.length; dayIndex++) {
      // date
      final dateString = forecast.suntimeForecast.dates[dayIndex];
      final date = DateTime.parse(dateString);

      // sunrise
      final sunriseString = forecast.suntimeForecast.sunriseTimes[dayIndex];
      final sunrise = DateTime.parse(sunriseString);

      // sunset
      final sunsetString = forecast.suntimeForecast.sunsetTimes[dayIndex];
      final sunset = DateTime.parse(sunsetString);

      // hourly temperatures
      List<double> hourlyTemperatures = [];

      for(var hourIndex = 0; hourIndex < 24; hourIndex++) {
        final temperatureIndex = dayIndex * 24 + hourIndex;
        hourlyTemperatures.add(forecast.hourlyTemperatures.temperatures[temperatureIndex]);
      }

      final dailyForecast = DailyForecast(date, sunrise, sunset, WeatherDescription.fromIntCode(forecast.suntimeForecast.weatherCodes[dayIndex]), hourlyTemperatures);
      dailyForecasts.add(dailyForecast);
    }
    return dailyForecasts;
  }

  @override
  WeatherState build() {
    getWeather();
    return const WeatherState.loading();
  }
}