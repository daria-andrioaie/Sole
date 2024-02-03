import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:intl/intl.dart';
import 'package:sole/data/model/weather_forecast.dart';
import 'package:sole/resources/colors.dart';
import 'package:sole/resources/image_assets_path.dart';
import 'package:sole/resources/themes.dart';

import '../../../data/model/daily_forecast.dart';
import '../../../data/model/weather_description.dart';

class DailyForecastWidget extends StatelessWidget {
  const DailyForecastWidget({super.key, required this.dailyForecast});

  final DailyForecast dailyForecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                child: DateWidget(
                  date: dailyForecast.date,
                  weatherDescription: dailyForecast.description,
                ),
              ),
              const Spacer(),
              Text(
                getEmojiBasedOnWeather(),
                style: const TextStyle(fontSize: 20),
              ),
              const Spacer(),
              SizedBox(
                width: 30,
                child: ForecastSummaryWidget(
                  maxTemperature: dailyForecast.hourlyTemperatures.reduce(max),
                ),
              )
            ],
          ),
          const Divider(
            height: 25,
            thickness: 0.3,
          ),
        ],
      ),
    );
  }

  String getEmojiBasedOnWeather() {
    var parser = EmojiParser();

    switch (dailyForecast.description) {
      case WeatherDescription.clearSky:
        return "☀️";
      case WeatherDescription.mainlyClear:
        return "🌤️";
      case WeatherDescription.partlyCloudy:
        return "🌥️";
      case WeatherDescription.overcast:
      case WeatherDescription.fog:
      case WeatherDescription.depositingRimeFog:
        return "☁️";
      case WeatherDescription.slightRain:
      case WeatherDescription.moderateRain:
      case WeatherDescription.heavyRain:
      case WeatherDescription.slightRainShowers:
      case WeatherDescription.moderateRainShowers:
      case WeatherDescription.violentRainShowers:
      case WeatherDescription.lightDrizzle:
      case WeatherDescription.moderateDrizzle:
      case WeatherDescription.denseDrizzle:
      case WeatherDescription.lightFreezingDrizzle:
      case WeatherDescription.denseFreezingDrizzle:
      case WeatherDescription.lightFreezingRain:
      case WeatherDescription.heavyFreezingRain:
        return "🌧️";
      case WeatherDescription.slightSnowFall:
      case WeatherDescription.moderateSnowFall:
      case WeatherDescription.heavySnowFall:
      case WeatherDescription.snowGrains:
      case WeatherDescription.slightSnowShowers:
      case WeatherDescription.heavySnowShowers:
        return "❄️";
      case WeatherDescription.slightThunderstorm:
      case WeatherDescription.moderateThunderstorm:
      case WeatherDescription.slightHailThunderstorm:
      case WeatherDescription.heavyHailThunderstorm:
        return "⛈️";
      default:
        return "☀️";
    }
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget(
      {super.key, required this.date, required this.weatherDescription});

  final DateTime date;
  final WeatherDescription weatherDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('EEEE').format(date),
          style:
              AppThemes.outfit.headlineMedium?.apply(color: AppColors.amethyst),
        ),
        Text(
          DateFormat('d MMM').format(date),
          style: AppThemes.outfit.bodyMedium?.apply(color: AppColors.lila),
        ),
      ],
    );
  }
}

class ForecastSummaryWidget extends StatelessWidget {
  const ForecastSummaryWidget({
    super.key,
    required this.maxTemperature,
  });

  final double maxTemperature;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${maxTemperature.floor()}°",
      style: AppThemes.outfit.headlineMedium?.apply(color: AppColors.lila),
    );
  }
}
