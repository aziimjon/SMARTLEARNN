import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_course_lesson_material_response.freezed.dart';
part 'online_course_lesson_material_response.g.dart';

@freezed
class OnlineCourseLessonMaterialResponse
    with _$OnlineCourseLessonMaterialResponse {
  const factory OnlineCourseLessonMaterialResponse({
    required String id,
    required String lessonId,
    required String attachmentId,
    String? attachmentUrl,
    String? title,
    required int orderIndex,
  }) = _OnlineCourseLessonMaterialResponse;

  factory OnlineCourseLessonMaterialResponse.fromJson(
          Map<String, dynamic> json) =>
      _$OnlineCourseLessonMaterialResponseFromJson(json);
}
