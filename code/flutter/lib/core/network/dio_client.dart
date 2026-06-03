import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../constants/api_constants.dart';
import '../constants/app_constants.dart';
import '../storage/secure_storage.dart';
import 'auth_interceptor.dart';

@lazySingleton
class DioClient {
  late final Dio dio;

  DioClient(AuthInterceptor authInterceptor, SecureStorage secureStorage) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: AppConstants.connectTimeout,
        receiveTimeout: AppConstants.receiveTimeout,
        headers: {'Content-Type': 'application/json'},
      ),
    );
    dio.interceptors.addAll([
      authInterceptor,
      _ErrorInterceptor(secureStorage),
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    ]);
  }
}

class _ErrorInterceptor extends Interceptor {
  final SecureStorage _storage;

  _ErrorInterceptor(this._storage);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await _storage.deleteToken();
    }
    handler.next(err);
  }
}
