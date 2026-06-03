import 'package:freezed_annotation/freezed_annotation.dart';

import 'online_course_lesson_response.dart';

part 'online_course_module_response.freezed.dart';
part 'online_course_module_response.g.dart';

@freezed
class OnlineCourseModuleResponse with _$OnlineCourseModuleResponse {
  const factory OnlineCourseModuleResponse({
    required String id,
    required String courseId,
    required String title,
    String? description,
    required int orderIndex,
    required String status,
    String? availableFrom,
    @Default([]) List<OnlineCourseLessonResponse> lessons,
  }) = _OnlineCourseModuleResponse;

  factory OnlineCourseModuleResponse.fromJson(Map<String, dynamic> json) =>
      _$OnlineCourseModuleResponseFromJson(json);
}
