import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../flavors.dart';


class DioClient {
  Dio get dio => _getDio();

  Dio _getDio() {
    const int timeoutValue = 10000;

    BaseOptions baseOptions = BaseOptions(
      baseUrl: F.baseUrl,
      receiveTimeout: const Duration(seconds: timeoutValue),
      sendTimeout: const Duration(seconds: timeoutValue),
      connectTimeout: const Duration(seconds: timeoutValue),
      receiveDataWhenStatusError: true,
    );

    Dio dio = Dio(baseOptions);

    if(kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          responseHeader: true,
          compact: true,
        ),
      );
    }

    return dio;
  }
}