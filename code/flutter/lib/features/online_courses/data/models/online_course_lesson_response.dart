import 'package:freezed_annotation/freezed_annotation.dart';

import 'online_course_lesson_material_response.dart';

part 'online_course_lesson_response.freezed.dart';
part 'online_course_lesson_response.g.dart';

@freezed
class OnlineCourseLessonResponse with _$OnlineCourseLessonResponse {
  const factory OnlineCourseLessonResponse({
    required String id,
    required String moduleId,
    required String title,
    String? description,
    String? content,
    required int orderIndex,
    int? durationInMinutes,
    @Default(false) bool freePreview,
    required String status,
    String? availableFrom,
    String? videoAttachmentId,
    String? videoUrl,
    @Default([]) List<OnlineCourseLessonMaterialResponse> materials,
  }) = _OnlineCourseLessonResponse;

  factory OnlineCourseLessonResponse.fromJson(Map<String, dynamic> json) =>
      _$OnlineCourseLessonResponseFromJson(json);
}
