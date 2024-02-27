import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sole/data/model/daily_forecast.dart';
import 'package:sole/data/model/weather_forecast.dart';
import 'package:sole/resources/colors.dart';
import 'package:sole/resources/image_assets_path.dart';
import 'package:sole/resources/themes.dart';

import 'daily_forecast_widget.dart';
import 'hourly_temperatures_graph.dart';

class Forecast extends StatelessWidget {
  const Forecast({
    super.key,
    required this.forecast,
  });

  final WeatherForecast forecast;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          forecast.locality,
          style: AppThemes.outfit.titleLarge?.apply(color: AppColors.amethyst),
        ),
        const SizedBox(height: 8),
        Text(
          forecast.dailyForecasts.first.description.toString(),
          style: AppThemes.outfit.labelMedium?.apply(color: AppColors.lila),
        ),
        Text(
          "Feels like ${getApparentTemperature()}°",
          style: AppThemes.outfit.labelMedium?.apply(color: AppColors.lila),
        ),
        const SizedBox(height: 16,),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HourlyTemperatureGraph(
                  todayForecast: forecast.dailyForecasts.first,
                  tomorrowForecast: forecast.dailyForecasts.elementAt(1),
                ),
                CurrentTemperatureWidget(
                    forecast: forecast.dailyForecasts.first),
                const SizedBox(
                  height: 20,
                ),
                UpcomingDaysWidget(upcomingForecast: forecast.dailyForecasts),
              ],
            ),
          ),
        )
      ],
    );
  }

  int getApparentTemperature() {
    DateTime now = DateTime.now();
    return forecast.dailyForecasts.first.apparentTemperatures[now.hour].round();
  }
}

class CurrentTemperatureWidget extends StatelessWidget {
  const CurrentTemperatureWidget({super.key, required this.forecast});

  final DailyForecast forecast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(alignment: Alignment.topCenter, children: [
        Image.asset(forecast.description.imageAssetPath()),
        RichText(
          text: TextSpan(
              text: getCurrentTemperature().toString(),
              style: AppThemes.outfit.titleLarge
                  ?.apply(fontSizeFactor: 6.0, color: AppColors.amethyst),
              children: <TextSpan>[
                TextSpan(
                    text: '°',
                    style: AppThemes.outfit.bodyLarge?.apply(
                        fontSizeFactor: 9.0, color: AppColors.amethyst)),
              ]),
        ),
      ]),
    );
  }

  int getCurrentTemperature() {
    DateTime now = DateTime.now();
    return forecast.hourlyTemperatures[now.hour].round();
  }
}

class UpcomingDaysWidget extends StatelessWidget {
  const UpcomingDaysWidget({super.key, required this.upcomingForecast});

  final List<DailyForecast> upcomingForecast;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: upcomingForecast
          .map((e) => DailyForecastWidget(dailyForecast: e))
          .toList(),
    );
  }
}
