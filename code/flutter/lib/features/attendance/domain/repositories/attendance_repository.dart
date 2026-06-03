import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../data/models/attendance_response.dart';

abstract class AttendanceRepository {
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
  });

  Future<Either<Failure, AttendanceResponse>> createAttendance({
    required String studentId,
    required String lessonSessionId,
    required String status,
  });

  Future<Either<Failure, AttendanceResponse>> updateAttendance({
    required String id,
    required String studentId,
    required String lessonSessionId,
    required String status,
  });
}
