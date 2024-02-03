import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../data/dto/weekly_forecast.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('/forecast')
  Future<WeeklyForecastResponse> getForecast(
    @Query('latitude') double latitude,
    @Query('longitude') double longitude,
    @Query('hourly') String hourly,
    @Query('daily') String daily,
    @Query('timezone') String timezone
      );
}