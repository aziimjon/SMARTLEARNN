import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/dio_client.dart';
import '../../../auth/data/models/role.dart';
import '../../domain/repositories/role_repository.dart';

@LazySingleton(as: RoleRepository)
class RoleRepositoryImpl implements RoleRepository {
  final DioClient _dioClient;

  RoleRepositoryImpl(this._dioClient);

  String _err(DioException e) => e.response?.data is Map
      ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
      : 'Ошибка сети';

  @override
  Future<Either<Failure, ApiPaginateResponse<List<Role>>>> getRoles({
    int page = 1,
    int size = 10,
  }) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.roles,
        queryParameters: {'page': page, 'size': size},
      );
      return Right(ApiPaginateResponse<List<Role>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => (json as List)
            .map((e) => Role.fromJson(e as Map<String, dynamic>))
            .toList(),
      ));
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, Role>> getRole(String id) async {
    try {
      final response =
          await _dioClient.dio.get(ApiConstants.roleById(id));
      return Right(ApiResponse<Role>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Role.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, Role>> createRole(String name) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.roles,
        data: {'name': name},
      );
      return Right(ApiResponse<Role>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Role.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, Role>> updateRole(String id, String name) async {
    try {
      final response = await _dioClient.dio.put(
        ApiConstants.roleById(id),
        data: {'name': name},
      );
      return Right(ApiResponse<Role>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Role.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteRole(String id) async {
    try {
      await _dioClient.dio.delete(ApiConstants.roleById(id));
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }
}
