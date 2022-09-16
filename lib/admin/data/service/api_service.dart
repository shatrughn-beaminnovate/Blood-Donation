import 'package:dio/dio.dart';

import 'api_interceptor.dart';

class ApiService {
  static final dio = createDio();

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      // baseUrl: Globals().Url,
      validateStatus: (status) => true,
      receiveTimeout: 120000, // 15 seconds
      connectTimeout: 120000,
      sendTimeout: 120000,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": "true",
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      },
    ));

    dio.interceptors.addAll({
      ApiInterceptors(dio),
    });
    return dio;
  }
}
