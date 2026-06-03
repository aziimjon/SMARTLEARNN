import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/dio_client.dart';
import '../../../auth/data/models/auth_me.dart';
import '../../../auth/data/models/role.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/parent_profile_response.dart';
import '../models/student_profile_response.dart';
import '../models/teacher_profile_response.dart';
import '../models/user_preview.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final DioClient _dioClient;

  UserRepositoryImpl(this._dioClient);

  String _err(DioException e) => e.response?.data is Map
      ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
      : 'Ошибка сети';

  FormData _buildUserFormData({
    required String firstName,
    required String lastName,
    String? middleName,
    required String gender,
    String? birthDate,
    required String phoneNumber,
    required String email,
    required String password,
    String userStatus = 'ACTIVE',
    String? roleId,
    Map<String, dynamic> extra = const {},
  }) {
    return FormData.fromMap({
      'firstName': firstName,
      'lastName': lastName,
      if (middleName != null && middleName.isNotEmpty) 'middleName': middleName,
      'gender': gender,
      if (birthDate != null && birthDate.isNotEmpty) 'birthDate': birthDate,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'status': userStatus,
      if (roleId != null && roleId.isNotEmpty) 'roles[0].id': roleId,
      ...extra,
    });
  }

  // ── Users ─────────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, ApiPaginateResponse<List<UserPreview>>>> getUsers({
    String? search,
    String? role,
    String? status,
    int page = 1,
    int size = 10,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        'search': ?search,
        'role': ?role,
        'status': ?status,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.users,
        queryParameters: params,
      );
      return Right(ApiPaginateResponse<List<UserPreview>>.fromJson(
        response.data,
        (json) => (json as List)
            .map((e) => UserPreview.fromJson(e as Map<String, dynamic>))
            .toList(),
      ));
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
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
  }) async {
    try {
      final formData = _buildUserFormData(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        gender: gender,
        birthDate: birthDate,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        userStatus: status,
        roleId: roleId,
      );
      final response = await _dioClient.dio.post(
        ApiConstants.users,
        data: formData,
      );
      return Right(ApiResponse<AuthMe>.fromJson(
        response.data,
        (json) => AuthMe.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── Students ──────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, ApiPaginateResponse<List<StudentProfileResponse>>>>
      getStudents({
    String? search,
    String? status,
    int page = 1,
    int size = 10,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        'search': ?search,
        'status': ?status,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.students,
        queryParameters: params,
      );
      return Right(
        ApiPaginateResponse<List<StudentProfileResponse>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) =>
                  StudentProfileResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
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
  }) async {
    try {
      final formData = _buildUserFormData(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        gender: gender,
        birthDate: birthDate,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        userStatus: userStatus,
        roleId: roleId,
        extra: {
          if (studentStatus != null) 'studentStatus': studentStatus,
          if (studentId != null) 'studentId': studentId,
        },
      );
      final response = await _dioClient.dio.post(
        ApiConstants.students,
        data: formData,
      );
      return Right(ApiResponse<StudentProfileResponse>.fromJson(
        response.data,
        (json) =>
            StudentProfileResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── Teachers ──────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, ApiPaginateResponse<List<TeacherProfileResponse>>>>
      getTeachers({
    String? search,
    String? position,
    int page = 1,
    int size = 50,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        'search': ?search,
        'position': ?position,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.teachers,
        queryParameters: params,
      );
      return Right(
        ApiPaginateResponse<List<TeacherProfileResponse>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) =>
                  TeacherProfileResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
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
  }) async {
    try {
      final formData = _buildUserFormData(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        gender: gender,
        birthDate: birthDate,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        userStatus: userStatus,
        roleId: roleId,
        extra: {
          if (position != null) 'position': position,
        },
      );
      final response = await _dioClient.dio.post(
        ApiConstants.teachers,
        data: formData,
      );
      return Right(ApiResponse<TeacherProfileResponse>.fromJson(
        response.data,
        (json) =>
            TeacherProfileResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── Parents ───────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, ApiPaginateResponse<List<ParentProfileResponse>>>>
      getParents({
    String? search,
    int page = 1,
    int size = 10,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        'search': ?search,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.parents,
        queryParameters: params,
      );
      return Right(
        ApiPaginateResponse<List<ParentProfileResponse>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) =>
                  ParentProfileResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
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
  }) async {
    try {
      final extra = <String, dynamic>{};
      for (var i = 0; i < studentIds.length; i++) {
        extra['studentIds[$i]'] = studentIds[i];
      }
      final formData = _buildUserFormData(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        gender: gender,
        birthDate: birthDate,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        userStatus: userStatus,
        roleId: roleId,
        extra: extra,
      );
      final response = await _dioClient.dio.post(
        ApiConstants.parents,
        data: formData,
      );
      return Right(ApiResponse<ParentProfileResponse>.fromJson(
        response.data,
        (json) =>
            ParentProfileResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── User Role Management ──────────────────────────────────────────────────

  @override
  Future<Either<Failure, List<Role>>> getUserRoles(String userId) async {
    try {
      final response =
          await _dioClient.dio.get(ApiConstants.userRoles(userId));
      final data = response.data is Map
          ? (response.data as Map)['data']
          : response.data;
      return Right((data as List)
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList());
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, void>> setUserRoles(
      String userId, List<String> roleIds) async {
    try {
      await _dioClient.dio.put(
        ApiConstants.userRoles(userId),
        data: {'roleIds': roleIds},
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, void>> addUserRole(
      String userId, String roleId) async {
    try {
      await _dioClient.dio
          .post(ApiConstants.userRoleById(userId, roleId));
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }

  @override
  Future<Either<Failure, void>> removeUserRole(
      String userId, String roleId) async {
    try {
      await _dioClient.dio
          .delete(ApiConstants.userRoleById(userId, roleId));
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    } catch (_) {
      return const Left(NetworkFailure('Ошибка сети'));
    }
  }
}
