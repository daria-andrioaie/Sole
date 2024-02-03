import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sole/data/dto/weekly_forecast.dart';
import 'package:sole/data/model/weather_description.dart';
import 'package:sole/data/model/weather_forecast.dart';
import 'package:sole/di/injection_container.dart';
import 'package:sole/pages/homepage/riverpod/weather_state.dart';
import 'package:geocoding/geocoding.dart' as geocoding;


import '../../../data/model/daily_forecast.dart';
import '../../../resources/strings.dart';

part 'weather_state_notifier.g.dart';

class Coordinates {
  double latitude;
  double longitude;
  
  Coordinates(this.latitude, this.longitude);
}

@riverpod
class WeatherStateNotifier extends _$WeatherStateNotifier {
  late Coordinates _currentLocation;
  Location location = Location();

  FutureOr<void> getWeather() async {
    state = const WeatherState.loading();

    final repository = ref.read(weatherRepositoryProvider);

      final response = await repository.getForecast(_currentLocation.latitude, _currentLocation.longitude);

      if(response.isSuccessful) {
        var locality = await getLocality(_currentLocation.latitude, _currentLocation.longitude);
        var weatherForecast = WeatherForecast(_convertWeeklyForecastResponse(response.data), locality);
        state = WeatherState.weather(weatherForecast);
      } else {
        if(response.isNoNetworkError) {
          state = const WeatherState.error(AppStrings.networkError);
        } else {
          state = WeatherState.error(response.errorResponse.reason);
        }
      }
  }

  void changeLocality(String locality) {
    _currentLocation = Coordinates(46.255146, 26.779909);
    getWeather();
  }

  void changeLocalityToUserLocation() {
    state = const WeatherState.loading();
    fetchLocation();
  }

  fetchLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    LocationData locationData = await location.getLocation();
    if(locationData.latitude != null && locationData.longitude != null) {
      _currentLocation = Coordinates(locationData.latitude!, locationData.longitude!);
      getWeather();
    }
  }

  Future<String> getLocality(double latitude, double longitude) async {
    List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(latitude, longitude);

    return placemarks.first.locality ?? "";
  }
  List<DailyForecast> _convertWeeklyForecastResponse(WeeklyForecastResponse forecastResponse) {
    List<DailyForecast> dailyForecasts = [];

    for(var dayIndex = 0; dayIndex < forecastResponse.suntimeForecast.dates.length; dayIndex++) {
      // date
      final dateString = forecastResponse.suntimeForecast.dates[dayIndex];
      final date = DateTime.parse(dateString);

      // sunrise
      final sunriseString = forecastResponse.suntimeForecast.sunriseTimes[dayIndex];
      final sunrise = DateTime.parse(sunriseString);

      // sunset
      final sunsetString = forecastResponse.suntimeForecast.sunsetTimes[dayIndex];
      final sunset = DateTime.parse(sunsetString);

      // hourly temperatures
      List<double> hourlyTemperatures = [];

      for(var hourIndex = 0; hourIndex < 24; hourIndex++) {
        final temperatureIndex = dayIndex * 24 + hourIndex;
        hourlyTemperatures.add(forecastResponse.hourlyTemperatures.temperatures[temperatureIndex]);
      }

      // apparent temperatures
      List<double> apparentTemperatures = [];

      for(var hourIndex = 0; hourIndex < 24; hourIndex++) {
        final temperatureIndex = dayIndex * 24 + hourIndex;
        apparentTemperatures.add(forecastResponse.hourlyTemperatures.apparentTemperatures[temperatureIndex]);
      }

      final dailyForecast = DailyForecast(date, sunrise, sunset, WeatherDescription.fromIntCode(forecastResponse.suntimeForecast.weatherCodes[dayIndex]), hourlyTemperatures, apparentTemperatures);
      dailyForecasts.add(dailyForecast);
    }
    return dailyForecasts;
  }

  @override
  WeatherState build() {
    fetchLocation();
    return const WeatherState.loading();
  }
}