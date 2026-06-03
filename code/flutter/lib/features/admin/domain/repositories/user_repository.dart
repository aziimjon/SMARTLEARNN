import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../auth/data/models/auth_me.dart';
import '../../../auth/data/models/role.dart';
import '../../data/models/parent_profile_response.dart';
import '../../data/models/student_profile_response.dart';
import '../../data/models/teacher_profile_response.dart';
import '../../data/models/user_preview.dart';

abstract class UserRepository {
  // ── Users ─────────────────────────────────────────────────────────────────

  Future<Either<Failure, ApiPaginateResponse<List<UserPreview>>>> getUsers({
    String? search,
    String? role,
    String? status,
    int page = 1,
    int size = 10,
  });

  Future<Either<Failure, AuthMe>> createUser({
    required String firstName,
    required String lastName,
    String? middleName,
    required String gender,
    String? birthDate,
    required String phoneNumber,
    required String email,
    required String password,
    String status = 'ACTIVE',
    String? roleId,
  });

  // ── Students ──────────────────────────────────────────────────────────────

  Future<Either<Failure, ApiPaginateResponse<List<StudentProfileResponse>>>>
      getStudents({
    String? search,
    String? status,
    int page = 1,
    int size = 10,
  });

  Future<Either<Failure, StudentProfileResponse>> createStudent({
    required String firstName,
    required String lastName,
    String? middleName,
    required String gender,
    String? birthDate,
    required String phoneNumber,
    required String email,
    required String password,
    String userStatus = 'ACTIVE',
    String? studentStatus,
    String? studentId,
    String? roleId,
  });

  // ── Teachers ──────────────────────────────────────────────────────────────

  Future<Either<Failure, ApiPaginateResponse<List<TeacherProfileResponse>>>>
      getTeachers({
    String? search,
    String? position,
    int page = 1,
    int size = 50,
  });

  Future<Either<Failure, TeacherProfileResponse>> createTeacher({
    required String firstName,
    required String lastName,
    String? middleName,
    required String gender,
    String? birthDate,
    required String phoneNumber,
    required String email,
    required String password,
    String userStatus = 'ACTIVE',
    String? position,
    String? roleId,
  });

  // ── Parents ───────────────────────────────────────────────────────────────

  Future<Either<Failure, ApiPaginateResponse<List<ParentProfileResponse>>>>
      getParents({
    String? search,
    int page = 1,
    int size = 10,
  });

  Future<Either<Failure, ParentProfileResponse>> createParent({
    required String firstName,
    required String lastName,
    String? middleName,
    required String gender,
    String? birthDate,
    required String phoneNumber,
    required String email,
    required String password,
    String userStatus = 'ACTIVE',
    List<String> studentIds = const [],
    String? roleId,
  });

  // ── User Role Management ──────────────────────────────────────────────────

  Future<Either<Failure, List<Role>>> getUserRoles(String userId);

  Future<Either<Failure, void>> setUserRoles(
      String userId, List<String> roleIds);

  Future<Either<Failure, void>> addUserRole(String userId, String roleId);

  Future<Either<Failure, void>> removeUserRole(String userId, String roleId);
}
