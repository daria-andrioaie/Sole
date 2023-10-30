import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/model/daily_forecast.dart';
import '../../data/model/weather_description.dart';

class DailyForecastWidget extends StatelessWidget {
  const DailyForecastWidget({super.key, required this.dailyForecast});

  final DailyForecast dailyForecast;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: backgroundImage(),
              fit: BoxFit.cover,
            )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DateWidget(
                date: dailyForecast.date,
                weatherDescription: dailyForecast.description,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ForecastSummaryWidget(
                maxTemperature: dailyForecast.hourlyTemperatures.reduce(max),
                sunrise: dailyForecast.sunrise,
                sunset: dailyForecast.sunset,
              ),
            )
          ],
        ));
  }

  AssetImage backgroundImage() {
    switch (dailyForecast.description) {
      case WeatherDescription.clearSky:
        return const AssetImage('assets/images/clear-sky.jpeg');
      case WeatherDescription.mainlyClear:
        return const AssetImage('assets/images/mostly-clear-sky.jpeg');
      case WeatherDescription.partlyCloudy:
        return const AssetImage('assets/images/partly-cloudy-sky.jpeg');
      case WeatherDescription.overcast:
        return const AssetImage('assets/images/overcast-sky.jpeg');
      case WeatherDescription.slightRain:
        return const AssetImage('assets/images/light-rain.jpeg');
      case WeatherDescription.moderateRain:
        return const AssetImage('assets/images/light-rain.jpeg');
      case WeatherDescription.slightRainShowers:
        return const AssetImage('assets/images/heavy-rain.jpeg');
      case WeatherDescription.moderateRainShowers:
        return const AssetImage('assets/images/heavy-rain.jpeg');
      default:
        return const AssetImage('assets/icons/clear-sky.jpeg');
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        Text(
          DateFormat('d MMM').format(date),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        Text(
          weatherDescription.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ForecastSummaryWidget extends StatelessWidget {
  const ForecastSummaryWidget({
    super.key,
    required this.maxTemperature,
    required this.sunrise,
    required this.sunset,
  });

  final double maxTemperature;
  final DateTime sunrise;
  final DateTime sunset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${maxTemperature.floor()}°",
          style: const TextStyle(
            fontSize: 50.0,
            color: Colors.white,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/sunrise.png',
              height: 30,
            ),
            Text(
              DateFormat('HH:mm').format(sunrise),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            Image.asset(
              'assets/images/sunset.png',
              height: 30,
            ),
            Text(
              DateFormat('HH:mm').format(sunset),
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
