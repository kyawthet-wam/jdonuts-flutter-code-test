import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// One-line request/response log. Only added in debug builds; the catalog is
/// public data, so nothing sensitive is printed.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('--> ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint('<-- ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('<-- ERROR ${err.type.name} ${err.requestOptions.uri}');
    handler.next(err);
  }
}
