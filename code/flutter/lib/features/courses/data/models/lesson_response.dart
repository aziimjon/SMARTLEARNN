import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_response.freezed.dart';
part 'lesson_response.g.dart';

@freezed
class LessonResponse with _$LessonResponse {
  const factory LessonResponse({
    required String id,
    required String title,
    String? content,
    required int durationInMinutes,
    required String sectionId,
  }) = _LessonResponse;

  factory LessonResponse.fromJson(Map<String, dynamic> json) =>
      _$LessonResponseFromJson(json);
}
