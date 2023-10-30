import 'package:flutter/material.dart';
import 'package:weather_app/pages/homepage/riverpod/weather_state_notifier.dart';
import '../../flavors/flavors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'daily_forecast_widget.dart';

class WeatherHomePage extends ConsumerWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: weatherState.maybeWhen(
          loading: () => const Center(
                child: Text("loading"),
              ),
          weather: (dailyForecasts) => ListView.separated(
                padding: const EdgeInsets.all(20),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 16,
                ),
                itemCount: dailyForecasts.length,
                itemBuilder: (context, int index) {
                  final dailyForecast = dailyForecasts[index];
                  return DailyForecastWidget(dailyForecast: dailyForecast);
                },
              ),
          error: (error) => Center(
                child: Text(error),
              ),
          orElse: () => const Center(
                child: Text("state error"),
              )),
    );
  }
}
