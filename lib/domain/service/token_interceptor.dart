import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final String token;

  TokenInterceptor({required this.token});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (token.isNotEmpty) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    handler.next(options);
  }
}
