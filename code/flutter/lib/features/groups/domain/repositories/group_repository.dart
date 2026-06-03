import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../data/models/group_response.dart';
import '../../data/models/schedule_response.dart';

abstract class GroupRepository {
  // ── READ ──────────────────────────────────────────────────────────────────
  Future<Either<Failure, ApiPaginateResponse<List<GroupResponse>>>> getGroups({
    String? teacherId,
    String? courseId,
    String? status,
    String? search,
    int page = 1,
    int size = 10,
  });

  Future<Either<Failure, GroupResponse>> getGroup(String id);

  Future<Either<Failure, ApiPaginateResponse<List<ScheduleResponse>>>> getSchedules({
    required String groupId,
    int page = 1,
    int size = 50,
  });

  // ── CRUD ──────────────────────────────────────────────────────────────────
  Future<Either<Failure, GroupResponse>> createGroup({
    required String name,
    required String courseId,
    required String teacherId,
    required int capacity,
    required String scheduleType,
    required List<String> scheduleDays,
    bool active = true,
  });

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
  });

  Future<Either<Failure, void>> deleteGroup(String id);

  // ── START + GENERATE ──────────────────────────────────────────────────────
  Future<Either<Failure, void>> startGroup(
    String id, {
    required List<Map<String, String>> schedules,
  });

  Future<Either<Failure, void>> generateSessions(
    String id, {
    required DateTime fromDate,
    required DateTime toDate,
  });
}
