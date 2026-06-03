import 'package:freezed_annotation/freezed_annotation.dart';
import 'lesson_response.dart';

part 'course_section_response.freezed.dart';
part 'course_section_response.g.dart';

@freezed
class CourseSectionResponse with _$CourseSectionResponse {
  const factory CourseSectionResponse({
    required String id,
    required String title,
    required int orderIndex,
    required String courseId,
    @Default([]) List<LessonResponse> lessons,
  }) = _CourseSectionResponse;

  factory CourseSectionResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseSectionResponseFromJson(json);
}
