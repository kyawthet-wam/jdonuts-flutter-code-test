import 'package:dio/dio.dart';

import '../result/failure.dart';

/// Single place that turns Dio errors into typed failures.
Failure failureFromDio(DioException e) {
  return switch (e.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout => const TimeoutFailure(),
    DioExceptionType.connectionError => const NetworkFailure(),
    DioExceptionType.badResponse => ServerFailure(
      e.message ?? 'Server error',
      statusCode: e.response?.statusCode,
    ),
    _ => UnknownFailure(e.message ?? 'Request failed', e),
  };
}
