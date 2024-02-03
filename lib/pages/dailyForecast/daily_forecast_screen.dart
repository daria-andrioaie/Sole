import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sole/data/model/daily_forecast.dart';

@RoutePage()
class DailyForecastScreen extends StatelessWidget {
  const DailyForecastScreen({super.key, required this.forecast});

  final DailyForecast forecast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('d MMM').format(forecast.date)),
      ),
      body: Center(
        child: Text("${forecast.date.weekday}"),
      ),
    );
  }
}

class ForecastGraph extends StatelessWidget {
  ForecastGraph({super.key, required this.hourlyTemperatures});

  List<double> hourlyTemperatures;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
