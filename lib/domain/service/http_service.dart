import 'package:auto_game/app_constants.dart';
import 'package:dio/dio.dart';

import 'token_interceptor.dart';

class HttpService {
  Dio client({required String token}) => Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
          sendTimeout: const Duration(seconds: 40),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json'
          },
        ),
      )
        ..interceptors.add(TokenInterceptor(token: token))
        ..interceptors.add(
          LogInterceptor(
              requestBody: true, responseBody: true, responseHeader: false),
        );
}
