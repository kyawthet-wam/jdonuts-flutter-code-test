import 'package:dio/dio.dart';

import '../result/failure.dart';
import '../result/result.dart';
import '../sync/catalog_snapshot.dart';
import 'dio_failure.dart';

/// Where fresh catalog data comes from. Only the data layer knows it is HTTP.
abstract interface class RemoteCatalogSource {
  Future<Result<CatalogSnapshot>> fetchCatalog();

  /// Cheap request used to check the server is actually reachable.
  Future<bool> isReachable();
}

/// Talks to the mock server: `GET /v1/catalog` returning `{data, error, meta}`.
class DioRemoteCatalogSource implements RemoteCatalogSource {
  const DioRemoteCatalogSource(this._dio);

  final Dio _dio;

  @override
  Future<Result<CatalogSnapshot>> fetchCatalog() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/v1/catalog');
      return _parseEnvelope(response.data);
    } on DioException catch (e) {
      return Result.err(failureFromDio(e));
    } on Object catch (e) {
      return Result.err(UnknownFailure('Bad catalog payload', e));
    }
  }

  Result<CatalogSnapshot> _parseEnvelope(Map<String, dynamic>? body) {
    final error = body?['error'];
    if (error != null) return Result.err(ServerFailure('$error'));
    final data = body?['data'] as Map<String, dynamic>?;
    if (data == null) return const Result.err(ServerFailure('Empty response'));
    return Result.ok(CatalogSnapshot.fromJson(data));
  }

  @override
  Future<bool> isReachable() async {
    try {
      await _dio.get<void>('/v1/health');
      return true;
    } on DioException {
      return false;
    }
  }
}
