import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/dio_client.dart';
import '../../../auth/data/models/permission.dart';
import '../../domain/repositories/permission_repository.dart';

@LazySingleton(as: PermissionRepository)
class PermissionRepositoryImpl implements PermissionRepository {
  final DioClient _dioClient;

  PermissionRepositoryImpl(this._dioClient);

  String _err(DioException e) => e.response?.data is Map
      ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
      : 'Ошибка сети';

  @override
  Future<Either<Failure, ApiPaginateResponse<List<Permission>>>> getPermissions({
    String? category,
    int page = 1,
    int size = 10,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        'category': ?category,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.permissions,
        queryParameters: params,
      );
      return Right(ApiPaginateResponse<List<Permission>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => (json as List)
            .map((e) => Permission.fromJson(e as Map<String, dynamic>))
            .toList(),
      ));
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, Permission>> getPermission(String id) async {
    try {
      final response =
          await _dioClient.dio.get(ApiConstants.permissionById(id));
      return Right(ApiResponse<Permission>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Permission.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, Permission>> createPermission(
      String name, String category) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.permissions,
        data: {'name': name, 'category': category},
      );
      return Right(ApiResponse<Permission>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Permission.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, Permission>> updatePermission(
      String id, String name, String category) async {
    try {
      final response = await _dioClient.dio.put(
        ApiConstants.permissionById(id),
        data: {'name': name, 'category': category},
      );
      return Right(ApiResponse<Permission>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Permission.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, void>> deletePermission(String id) async {
    try {
      await _dioClient.dio.delete(ApiConstants.permissionById(id));
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }
}
