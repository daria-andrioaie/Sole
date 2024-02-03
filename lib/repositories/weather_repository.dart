import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sole/data/dto/api_error_response.dart';
import 'package:sole/data/dto/weekly_forecast.dart';

import '../data/network/api_response.dart';
import '../network/api.dart';

class WeatherRepository {
  final Api api;

  WeatherRepository({required this.api});

  Future<ApiResponse<WeeklyForecastResponse>> getForecast(double latitude, double longitude) async {
    try {
      final weeklyForecast = await api.getForecast(latitude, longitude, 'temperature_2m,apparent_temperature', 'sunset,sunrise,weathercode', 'GMT');
      return ApiResponse.completed(weeklyForecast);
    } on DioException catch(e) {
      if(e.error is SocketException) {
        return ApiResponse.noNetwork();
      } else {
        try {
          final errorResponse = ApiErrorResponse.fromJson(e.response?.data);
          return ApiResponse.error(errorResponse);
        } catch (e) {
          return ApiResponse.noNetwork();
        }
      }
    }
  }
}