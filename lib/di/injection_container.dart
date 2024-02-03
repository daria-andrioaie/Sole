import 'package:sole/network/api.dart';
import 'package:sole/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sole/repositories/weather_repository.dart';

part 'injection_container.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return DioClient().dio;
}

@riverpod
Api api(ApiRef ref) {
  return Api(ref.watch(dioProvider));
}

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  return WeatherRepository(api: ref.watch(apiProvider));
}
