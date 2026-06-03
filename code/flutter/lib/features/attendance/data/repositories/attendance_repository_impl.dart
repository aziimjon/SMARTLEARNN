import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/attendance_repository.dart';
import '../models/attendance_response.dart';

@LazySingleton(as: AttendanceRepository)
class AttendanceRepositoryImpl implements AttendanceRepository {
  final DioClient _dioClient;

  AttendanceRepositoryImpl(this._dioClient);

  static final _fmt = DateFormat("yyyy-MM-dd'T'HH:mm:ss");

  @override
  Future<Either<Failure, ApiPaginateResponse<List<AttendanceResponse>>>> getAttendances({
    String? studentId,
    String? groupId,
    String? lessonSessionId,
    String? lessonId,
    String? status,
    DateTime? from,
    DateTime? to,
    int page = 1,
    int size = 10,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        'studentId': ?studentId,
        'groupId': ?groupId,
        'lessonSessionId': ?lessonSessionId,
        'lessonId': ?lessonId,
        'status': ?status,
        if (from != null) 'from': _fmt.format(from),
        if (to != null) 'to': _fmt.format(to),
      };
      final response = await _dioClient.dio.get(
        ApiConstants.attendances,
        queryParameters: params,
      );
      final result = ApiPaginateResponse<List<AttendanceResponse>>.fromJson(
        response.data,
        (json) => (json as List)
            .map((e) => AttendanceResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
      return Right(result);
    } on DioException catch (e) {
      final message = e.response?.data is Map
          ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
          : 'Ошибка сети';
      return Left(ServerFailure(message));
    }
  }

  @override
  Future<Either<Failure, AttendanceResponse>> createAttendance({
    required String studentId,
    required String lessonSessionId,
    required String status,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.attendances,
        data: {
          'studentId': studentId,
          'lessonSessionId': lessonSessionId,
          'status': status,
        },
      );
      final result = ApiResponse<AttendanceResponse>.fromJson(
        response.data,
        (json) => AttendanceResponse.fromJson(json as Map<String, dynamic>),
      );
      return Right(result.data);
    } on DioException catch (e) {
      final message = e.response?.data is Map
          ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
          : 'Ошибка сети';
      return Left(ServerFailure(message));
    }
  }

  @override
  Future<Either<Failure, AttendanceResponse>> updateAttendance({
    required String id,
    required String studentId,
    required String lessonSessionId,
    required String status,
  }) async {
    try {
      final response = await _dioClient.dio.put(
        '${ApiConstants.attendances}/$id',
        data: {
          'studentId': studentId,
          'lessonSessionId': lessonSessionId,
          'status': status,
        },
      );
      final result = ApiResponse<AttendanceResponse>.fromJson(
        response.data,
        (json) => AttendanceResponse.fromJson(json as Map<String, dynamic>),
      );
      return Right(result.data);
    } on DioException catch (e) {
      final message = e.response?.data is Map
          ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
          : 'Ошибка сети';
      return Left(ServerFailure(message));
    }
  }
}
