import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_course_progress_response.freezed.dart';
part 'online_course_progress_response.g.dart';

@freezed
class OnlineCourseProgressResponse with _$OnlineCourseProgressResponse {
  const factory OnlineCourseProgressResponse({
    required String id,
    required String enrollmentId,
    required String contentId,
    String? title,
    required String status,
    int? lastPositionInSeconds,
    String? openedAt,
    String? startedAt,
    String? completedAt,
  }) = _OnlineCourseProgressResponse;

  factory OnlineCourseProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$OnlineCourseProgressResponseFromJson(json);
}
