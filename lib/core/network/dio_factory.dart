import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'logging_interceptor.dart';
import 'retry_interceptor.dart';

const Duration _connectTimeout = Duration(seconds: 5);
const Duration _receiveTimeout = Duration(seconds: 10);

/// Builds the app's Dio: timeouts, retry, and (debug only) logging.
/// No auth or token refresh: the catalog endpoints are public.
Dio createDio(String baseUrl) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _connectTimeout,
      sendTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      headers: {'Accept': 'application/json'},
    ),
  );
  dio.interceptors.add(RetryInterceptor(dio));
  if (kDebugMode) dio.interceptors.add(LoggingInterceptor());
  return dio;
}
