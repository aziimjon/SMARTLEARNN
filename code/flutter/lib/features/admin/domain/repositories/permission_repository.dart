import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../auth/data/models/permission.dart';

abstract class PermissionRepository {
  Future<Either<Failure, ApiPaginateResponse<List<Permission>>>> getPermissions({
    String? category,
    int page = 1,
    int size = 10,
  });

  Future<Either<Failure, Permission>> getPermission(String id);

  Future<Either<Failure, Permission>> createPermission(
      String name, String category);

  Future<Either<Failure, Permission>> updatePermission(
      String id, String name, String category);

  Future<Either<Failure, void>> deletePermission(String id);
}
