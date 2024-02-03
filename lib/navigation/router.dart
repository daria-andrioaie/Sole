import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:sole/pages/splash-screen/splash_screen.dart';

import '../data/model/daily_forecast.dart';
import '../pages/dailyForecast/daily_forecast_screen.dart';
import '../pages/homepage/weather_homepage.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: WeatherHomeRoute.page),
    AutoRoute(page: DailyForecastRoute.page),
  ];
}