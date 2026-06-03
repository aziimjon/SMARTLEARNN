import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/group_repository.dart';
import '../models/group_response.dart';
import '../models/schedule_response.dart';

@LazySingleton(as: GroupRepository)
class GroupRepositoryImpl implements GroupRepository {
  final DioClient _dioClient;

  GroupRepositoryImpl(this._dioClient);

  static final _dateFmt = DateFormat('yyyy-MM-dd');

  String _err(DioException e) => e.response?.data is Map
      ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
      : 'Ошибка сети';

  @override
  Future<Either<Failure, ApiPaginateResponse<List<GroupResponse>>>> getGroups({
    String? teacherId,
    String? courseId,
    String? status,
    String? search,
    int page = 1,
    int size = 10,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        'teacherId': ?teacherId,
        'courseId': ?courseId,
        'status': ?status,
        'search': ?search,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.groups,
        queryParameters: params,
      );
      return Right(ApiPaginateResponse<List<GroupResponse>>.fromJson(
        response.data,
        (json) => (json as List)
            .map((e) => GroupResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ));
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, GroupResponse>> getGroup(String id) async {
    try {
      final response = await _dioClient.dio.get('${ApiConstants.groups}/$id');
      return Right(ApiResponse<GroupResponse>.fromJson(
        response.data,
        (json) => GroupResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, ApiPaginateResponse<List<ScheduleResponse>>>> getSchedules({
    required String groupId,
    int page = 1,
    int size = 50,
  }) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.schedules,
        queryParameters: {'groupId': groupId, 'page': page, 'size': size},
      );
      return Right(ApiPaginateResponse<List<ScheduleResponse>>.fromJson(
        response.data,
        (json) => (json as List)
            .map((e) => ScheduleResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ));
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, GroupResponse>> createGroup({
    required String name,
    required String courseId,
    required String teacherId,
    required int capacity,
    required String scheduleType,
    required List<String> scheduleDays,
    bool active = true,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.groups,
        data: {
          'name': name,
          'courseId': courseId,
          'teacherId': teacherId,
          'capacity': capacity,
          'scheduleType': scheduleType,
          'scheduleDays': scheduleDays,
          'active': active,
        },
      );
      return Right(ApiResponse<GroupResponse>.fromJson(
        response.data,
        (json) => GroupResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, GroupResponse>> updateGroup(
    String id, {
    required String name,
    required String courseId,
    required String teacherId,
    required int capacity,
    required String scheduleType,
    required List<String> scheduleDays,
    required String status,
    bool active = true,
  }) async {
    try {
      final response = await _dioClient.dio.put(
        '${ApiConstants.groups}/$id',
        data: {
          'name': name,
          'courseId': courseId,
          'teacherId': teacherId,
          'capacity': capacity,
          'scheduleType': scheduleType,
          'scheduleDays': scheduleDays,
          'status': status,
          'active': active,
        },
      );
      return Right(ApiResponse<GroupResponse>.fromJson(
        response.data,
        (json) => GroupResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> deleteGroup(String id) async {
    try {
      await _dioClient.dio.delete('${ApiConstants.groups}/$id');
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> startGroup(
    String id, {
    required List<Map<String, String>> schedules,
  }) async {
    try {
      await _dioClient.dio.post(
        '${ApiConstants.groups}/$id/start',
        data: {'schedules': schedules},
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> generateSessions(
    String id, {
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      await _dioClient.dio.post(
        '${ApiConstants.groups}/$id/lesson-sessions/generate',
        data: {
          'fromDate': _dateFmt.format(fromDate),
          'toDate': _dateFmt.format(toDate),
        },
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }
}
