import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../data/model/daily_forecast.dart';
import '../../../resources/colors.dart';

class HourlyTemperatureGraph extends StatelessWidget {
  HourlyTemperatureGraph({super.key, required this.dailyForecast});

  final DailyForecast dailyForecast;

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
            titlesData: FlTitlesData(
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
            ),
            borderData: FlBorderData(
              show: false,
            ),
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
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
    for (final (hour, temperature)
    in dailyForecast.hourlyTemperatures.indexed) {
      spots.add(FlSpot(hour.toDouble(), temperature));
    }
    return spots;
  }

  double getMaximumTemperature() =>
      dailyForecast.hourlyTemperatures.reduce(max);

  double getMinimumTemperature() =>
      dailyForecast.hourlyTemperatures.reduce(min);
}