import 'package:freezed_annotation/freezed_annotation.dart';

import 'online_course_progress_response.dart';
import 'online_course_summary_response.dart';

part 'online_course_enrollment_response.freezed.dart';
part 'online_course_enrollment_response.g.dart';

@freezed
class OnlineCourseEnrollmentResponse with _$OnlineCourseEnrollmentResponse {
  const factory OnlineCourseEnrollmentResponse({
    required String id,
    required OnlineCourseSummaryResponse course,
    required String studentProfileId,
    required String studentUserId,
    required String studentName,
    String? openedById,
    required String status,
    required String openedAt,
    String? completedAt,
    String? currentModuleId,
    String? currentLessonId,
    @Default(0) int completedLessons,
    @Default(0) int totalLessons,
    @Default(0.0) double progressPercentage,
    @Default([]) List<OnlineCourseProgressResponse> moduleProgresses,
    @Default([]) List<OnlineCourseProgressResponse> lessonProgresses,
  }) = _OnlineCourseEnrollmentResponse;

  factory OnlineCourseEnrollmentResponse.fromJson(Map<String, dynamic> json) =>
      _$OnlineCourseEnrollmentResponseFromJson(json);
}
