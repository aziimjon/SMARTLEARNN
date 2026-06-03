import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../auth/data/models/role.dart';

abstract class RoleRepository {
  Future<Either<Failure, ApiPaginateResponse<List<Role>>>> getRoles({
    int page = 1,
    int size = 10,
  });

  Future<Either<Failure, Role>> getRole(String id);

  Future<Either<Failure, Role>> createRole(String name);

  Future<Either<Failure, Role>> updateRole(String id, String name);

  Future<Either<Failure, void>> deleteRole(String id);
}
