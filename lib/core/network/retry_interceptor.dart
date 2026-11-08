import 'dart:math' as math;

import 'package:dio/dio.dart';

const String _attemptKey = 'retry_attempt';
const Set<String> _idempotentMethods = {'GET', 'HEAD', 'PUT', 'DELETE'};
const Set<int> _retryableStatuses = {502, 503, 504};

/// Retries idempotent requests that failed for transient reasons, backing
/// off exponentially (300ms, 600ms, ...). Non-idempotent requests (POST) are
/// never retried because a repeat could duplicate a side effect.
class RetryInterceptor extends Interceptor {
  RetryInterceptor(
    this._dio, {
    this.maxRetries = 2,
    this.baseDelay = const Duration(milliseconds: 300),
  });

  final Dio _dio;
  final int maxRetries;
  final Duration baseDelay;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final attempt = (err.requestOptions.extra[_attemptKey] as int?) ?? 0;
    if (!_isRetryable(err) || attempt >= maxRetries) {
      return handler.next(err);
    }
    await Future<void>.delayed(baseDelay * math.pow(2, attempt).toInt());
    err.requestOptions.extra[_attemptKey] = attempt + 1;
    try {
      handler.resolve(await _dio.fetch<dynamic>(err.requestOptions));
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  bool _isRetryable(DioException e) {
    if (!_idempotentMethods.contains(e.requestOptions.method)) return false;
    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError => true,
      DioExceptionType.badResponse => _retryableStatuses.contains(
        e.response?.statusCode,
      ),
      _ => false,
    };
  }
}
