import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_session_response.freezed.dart';
part 'lesson_session_response.g.dart';

@freezed
class LessonSessionResponse with _$LessonSessionResponse {
  const factory LessonSessionResponse({
    required String id,
    required String groupId,
    required String groupName,
    required String lessonId,
    required String lessonTitle,
    required String startTime,
    required String endTime,
    required String status,
  }) = _LessonSessionResponse;

  factory LessonSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$LessonSessionResponseFromJson(json);
}
