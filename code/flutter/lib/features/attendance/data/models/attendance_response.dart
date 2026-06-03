import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_response.freezed.dart';
part 'attendance_response.g.dart';

@freezed
class AttendanceResponse with _$AttendanceResponse {
  const factory AttendanceResponse({
    required String id,
    required String studentId,
    String? studentProfileId,
    String? studentFullName,
    required String lessonSessionId,
    required String groupId,
    required String groupName,
    required String lessonId,
    required String lessonTitle,
    required String lessonStartTime,
    required String lessonEndTime,
    required String status,
  }) = _AttendanceResponse;

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseFromJson(json);
}
