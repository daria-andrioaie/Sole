// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DailyForecastRoute.name: (routeData) {
      final args = routeData.argsAs<DailyForecastRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DailyForecastScreen(
          key: args.key,
          forecast: args.forecast,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    WeatherHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeatherHomePage(),
      );
    },
  };
}

/// generated route for
/// [DailyForecastScreen]
class DailyForecastRoute extends PageRouteInfo<DailyForecastRouteArgs> {
  DailyForecastRoute({
    Key? key,
    required DailyForecast forecast,
    List<PageRouteInfo>? children,
  }) : super(
          DailyForecastRoute.name,
          args: DailyForecastRouteArgs(
            key: key,
            forecast: forecast,
          ),
          initialChildren: children,
        );

  static const String name = 'DailyForecastRoute';

  static const PageInfo<DailyForecastRouteArgs> page =
      PageInfo<DailyForecastRouteArgs>(name);
}

class DailyForecastRouteArgs {
  const DailyForecastRouteArgs({
    this.key,
    required this.forecast,
  });

  final Key? key;

  final DailyForecast forecast;

  @override
  String toString() {
    return 'DailyForecastRouteArgs{key: $key, forecast: $forecast}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeatherHomePage]
class WeatherHomeRoute extends PageRouteInfo<void> {
  const WeatherHomeRoute({List<PageRouteInfo>? children})
      : super(
          WeatherHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
