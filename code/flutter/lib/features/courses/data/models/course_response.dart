import 'package:freezed_annotation/freezed_annotation.dart';
import 'course_section_response.dart';

part 'course_response.freezed.dart';
part 'course_response.g.dart';

@freezed
class CourseResponse with _$CourseResponse {
  const factory CourseResponse({
    required String id,
    required String title,
    String? description,
    required String level,
    required int durationInMinutes,
    @Default([]) List<CourseSectionResponse> sections,
  }) = _CourseResponse;

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);
}
