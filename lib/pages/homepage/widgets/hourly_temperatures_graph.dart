import 'dart:ffi';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pair/pair.dart';

import '../../../data/model/daily_forecast.dart';
import '../../../resources/colors.dart';

class HourlyTemperatureGraph extends StatelessWidget {
  const HourlyTemperatureGraph({
    super.key,
    required this.todayForecast,
    required this.tomorrowForecast,
  });

  final DailyForecast todayForecast;
  final DailyForecast tomorrowForecast;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 250),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: SizedBox(
          height: 170,
          width: 1800,
          child: LineChart(LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: chartTitles(),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: 23,
            minY: getMinimumTemperature() - 1,
            maxY: getMaximumTemperature() + 1,
            lineBarsData: [
              LineChartBarData(
                spots: getGraphSpots(),
                showingIndicators: [18],
                isCurved: true,
                color: Colors.black,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: const FlDotData(
                  show: false,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  FlTitlesData chartTitles() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 60,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    var currentTime = const TimeOfDay(hour: 10, minute: 49);

    if(currentTime.hour < 12) {
      switch (value.toInt()) {
        case 0:
          text = '0 AM';
          break;
        case 1:
          text = '1 AM';
          break;
        case 2:
          text = '2 AM';
          break;
        case 3:
          text = '3 AM';
          break;
        case 4:
          text = '4 AM';
          break;
        case 5:
          text = '5 AM';
          break;
        case 6:
          text = '6 AM';
          break;
        case 7:
          text = '7 AM';
          break;
        case 8:
          text = '8 AM';
          break;
        case 9:
          text = '9 AM';
          break;
        case 10:
          text = '10 AM';
          break;
        case 11:
          text = '11 AM';
          break;
        case 12:
          text = '12 AM';
          break;
        case 13:
          text = '1 PM';
          break;
        case 14:
          text = '2 PM';
          break;
        case 15:
          text = '3 PM';
          break;
        case 16:
          text = '4 PM';
          break;
        case 17:
          text = '5 PM';
          break;
        case 18:
          text = '6 PM';
          break;
        case 19:
          text = '7 PM';
          break;
        case 20:
          text = '8 PM';
          break;
        case 21:
          text = '9 PM';
          break;
        case 22:
          text = '10 PM';
          break;
        case 23:
          text = '11 PM';
          break;
        default:
          return Container();
      }

      if(currentTime.hour == value.toInt()) {
        text = "now";
      }
    } else {
      text = "xx";
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          color: AppColors.lila,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<FlSpot> getGraphSpots() {
    List<FlSpot> spots = [];

    return spots;
  }

  List<Pair<int, double>> temperaturesRelativeToCurrentHour() {
    List<Pair<int, double>> temperatures = [];
    var currentTime = TimeOfDay(hour: 10, minute: 49);

    if(currentTime.hour < 12) {
      // take all values from today
      for (final (hour, temperature)
      in todayForecast.hourlyTemperatures.indexed) {
        spots.add(FlSpot(hour.toDouble(), temperature));
      }
    } else {
      // take 12 values before the current hour, the next values of today and the rest up to 24, take values from tomorrow
      for(var i = currentTime.hour - 12; i < 24; i ++) {
        spots.add(FlSpot(i - currentTime.hour - 12, todayForecast.hourlyTemperatures.elementAt(i)));
      }
      for(var i = 0; i < 24 - spots.length ; i++) {
        spots.add(FlSpot(spots.length as double, tomorrowForecast.hourlyTemperatures.elementAt(i)));
      }
    }
    return [];
  }

  double getMaximumTemperature() =>
      todayForecast.hourlyTemperatures.reduce(max);

  double getMinimumTemperature() =>
      todayForecast.hourlyTemperatures.reduce(min);
}
