import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_me.dart';
import '../models/jwt_response.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final DioClient _dioClient;

  AuthRepositoryImpl(this._dioClient);

  @override
  Future<Either<Failure, String>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.login,
        data: {'username': username, 'password': password},
      );
      final apiResponse = ApiResponse<JwtResponse>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => JwtResponse.fromJson(json as Map<String, dynamic>),
      );
      return Right(apiResponse.data.accessToken);
    } on DioException catch (e) {
      final message = e.response?.data is Map
          ? e.response!.data['message'] as String? ?? 'Ошибка входа'
          : 'Ошибка входа';
      return Left(ServerFailure(message));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _dioClient.dio.post(ApiConstants.logout);
    } catch (_) {
      // logout всегда успешен локально
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, AuthMe>> updateMe(Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.dio.patch(
        ApiConstants.me,
        data: data,
      );
      final apiResponse = ApiResponse<AuthMe>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => AuthMe.fromJson(json as Map<String, dynamic>),
      );
      return Right(apiResponse.data);
    } on DioException catch (e) {
      final message = e.response?.data is Map
          ? e.response!.data['message'] as String? ?? 'Ошибка обновления'
          : 'Ошибка обновления';
      return Left(ServerFailure(message));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, AuthMe>> getMe() async {
    try {
      final response = await _dioClient.dio.get(ApiConstants.me);
      final apiResponse = ApiResponse<AuthMe>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => AuthMe.fromJson(json as Map<String, dynamic>),
      );
      return Right(apiResponse.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Left(UnauthorizedFailure('Сессия истекла'));
      }
      final message = e.response?.data is Map
          ? e.response!.data['message'] as String? ?? 'Ошибка загрузки профиля'
          : 'Ошибка загрузки профиля';
      return Left(ServerFailure(message));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }
}
