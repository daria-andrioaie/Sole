import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sole/pages/homepage/riverpod/weather_state_notifier.dart';
import 'package:sole/pages/homepage/widgets/searchbar.dart';
import 'package:sole/pages/homepage/widgets/user_location_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/forecast_widget.dart';

@RoutePage()
class WeatherHomePage extends ConsumerStatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  WeatherHomePageState createState() => WeatherHomePageState();
}

class WeatherHomePageState extends ConsumerState<WeatherHomePage> {
  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherStateNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: weatherState.maybeWhen(
            loading: () => const Center(
                  child: Text("loading"),
                ),
            weather: (weatherForecast) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 48),
                                child: AnimatedSearchBar(
                                  onSubmittedLocality: (locality) {
                                    ref
                                        .read(weatherStateNotifierProvider
                                            .notifier)
                                        .changeLocality(locality);
                                  },
                                ),
                              )),
                          Align(
                              alignment: Alignment.centerRight,
                              child: LocationWidget(
                                onPressed: () {
                                  ref
                                      .read(
                                          weatherStateNotifierProvider.notifier)
                                      .changeLocalityToUserLocation();
                                },
                              ))
                        ],
                      ),
                    ),
                    Expanded(child: Forecast(forecast: weatherForecast)),
                  ],
                ),
            error: (error) => Center(
                  child: Text(error),
                ),
            orElse: () => const Center(
                  child: Text("state error"),
                )),
      ),
    );
  }
}
