import 'package:blood_donation/constant/admin/admin_constant.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  final Dio dio;

  ApiInterceptors(this.dio);

  // final LoginDetailsRepository loginDetailsRepository =
  //     LoginDetailsRepository();

  DateTime? accessTokenExpireTime;
  DateTime? refreshTokenExpireTime;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer $kDefaultAdminApiKey';
    //final loginData = await loginDetailsRepository.getTokenData();
    //Decoding login data
    //LoginData userInfo = LoginData.fromJson(jsonDecode(loginData!));

    // if (loginData != null) {
    //   // LoginData userInfo = LoginData.fromJson(jsonDecode(loginData));
    //   // accessTokenExpireTime = DateFormat("yyyy-MM-dd hh:mm:ss")
    //   //     .parse(userInfo.result!.expiredTokenTime!);
    //   // refreshTokenExpireTime = DateFormat("yyyy-MM-dd hh:mm:ss")
    //   //     .parse(userInfo.result!.expiredRefreshTokenTime!);

    //   // print("$accessTokenExpireTime $refreshTokenExpireTime");

    //   if (accessTokenExpireTime!.isAfter(DateTime.now())) {
    //     print("Token not expired>>>>>>>>>>>>>>>>");
    // options.headers['Authorization'] = 'Bearer $kDefaultAdminApiKey';
    //     return handler.next(options);
    //   } else {
    //     print("Token expired>>>>>>>>>>>>>>>> ${userInfo.result!.expiredRefreshTokenTime}  ${DateTime.now()}");

    //     if (refreshTokenExpireTime!.isAfter(DateTime.now())) {
    //       await loginDetailsRepository
    //           .getRefreshTokenDetails(userInfo.result!.refreshToken)
    //           .then((value) async {
    //         print("Geeting new access token success");

    //         LoginData newLoginData = LoginData(
    //             TokenInfo(
    //                 accessToken: value.result!.accessToken,
    //                 expireInSeconds: userInfo.result!.expireInSeconds,
    //                 expiredTokenTime: null,
    //                 expiredRefreshTokenTime: null,
    //                 userId: userInfo.result!.userId,
    //                 refreshToken: userInfo.result!.refreshToken),
    //            const ErrorData(details: " "),
    //             true);
    //         await loginDetailsRepository.persistToken(newLoginData);
    //         options.headers['Authorization'] =
    //             'Bearer ${newLoginData.result!.accessToken}';
    //         return handler.next(options);
    //       }).catchError((error, stackTrace) {
    //         print("Getting refresh token error");
    //         return handler.next(options);
    //       });
    //     } else {
    //       print("refresh Token expired>>>>>>>>>>>>>>>>");
    //       await loginDetailsRepository.deleteToken();
    //       navigatorKey.currentState!.pushReplacementNamed(loginRoute);
    //       return handler.next(options);
    //     }
    //   }
    // }
    // else {
    return handler.next(options);
    // }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.cancel:
        throw CancelRequestException(err.requestOptions);

      case DioErrorType.connectTimeout:
        throw ConnectionTimeoutException(err.requestOptions);

      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);

      case DioErrorType.receiveTimeout:
        throw ReceiveTimeoutException(err.requestOptions);

      case DioErrorType.response:
        throw InvalidStatusCodeException(err.requestOptions);

      case DioErrorType.sendTimeout:
    }
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InvalidStatusCodeException extends DioError {
  InvalidStatusCodeException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Received invalid status code';
  }
}

class ReceiveTimeoutException extends DioError {
  ReceiveTimeoutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Receive timeout in connection with API server';
  }
}

class ConnectionTimeoutException extends DioError {
  ConnectionTimeoutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class CancelRequestException extends DioError {
  CancelRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Request to API server was cancelled';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class RefreshTokenExpired extends DioError {
  RefreshTokenExpired(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'You token has been expired. Please login Again';
  }
}
