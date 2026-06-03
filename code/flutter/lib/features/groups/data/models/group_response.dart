import 'package:freezed_annotation/freezed_annotation.dart';
import 'teacher_info_response.dart';

part 'group_response.freezed.dart';
part 'group_response.g.dart';

@freezed
class GroupResponse with _$GroupResponse {
  const factory GroupResponse({
    required String id,
    required String name,
    required String courseId,
    required String courseName,
    required TeacherInfoResponse teacher,
    required int capacity,
    required String scheduleType,
    @Default([]) List<String> scheduleDays,
    required bool active,
    required int currentStudents,
    required String status,
  }) = _GroupResponse;

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);
}
