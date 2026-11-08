import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/network/retry_interceptor.dart';

/// Fails the first [failures] calls with a connection error, then succeeds.
class _FlakyAdapter implements HttpClientAdapter {
  _FlakyAdapter(this.failures);

  final int failures;
  int calls = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    calls++;
    if (calls <= failures) {
      throw DioException(
        requestOptions: options,
        type: DioExceptionType.connectionError,
      );
    }
    return ResponseBody.fromString(
      jsonEncode({'ok': true}),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Dio _dioWith(_FlakyAdapter adapter) {
  final dio = Dio()..httpClientAdapter = adapter;
  dio.interceptors.add(RetryInterceptor(dio, baseDelay: Duration.zero));
  return dio;
}

void main() {
  test(
    'retries a GET after transient connection errors and succeeds',
    () async {
      final adapter = _FlakyAdapter(2);

      final response = await _dioWith(adapter).get<dynamic>('http://x/v1');

      expect(response.statusCode, 200);
      expect(adapter.calls, 3);
    },
  );

  test('gives up after the maximum number of retries', () async {
    final adapter = _FlakyAdapter(10);

    await expectLater(
      _dioWith(adapter).get<dynamic>('http://x/v1'),
      throwsA(isA<DioException>()),
    );
    expect(adapter.calls, 3); // first try + 2 retries
  });

  test('never retries a POST because it is not idempotent', () async {
    final adapter = _FlakyAdapter(1);

    await expectLater(
      _dioWith(adapter).post<dynamic>('http://x/v1'),
      throwsA(isA<DioException>()),
    );
    expect(adapter.calls, 1);
  });
}
