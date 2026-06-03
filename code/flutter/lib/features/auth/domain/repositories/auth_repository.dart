import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/auth_me.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String username, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, AuthMe>> getMe();
  Future<Either<Failure, AuthMe>> updateMe(Map<String, dynamic> data);
}
