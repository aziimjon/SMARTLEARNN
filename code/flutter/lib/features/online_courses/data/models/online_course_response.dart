import 'package:freezed_annotation/freezed_annotation.dart';

import 'online_course_module_response.dart';

part 'online_course_response.freezed.dart';
part 'online_course_response.g.dart';

@freezed
class OnlineCourseResponse with _$OnlineCourseResponse {
  const factory OnlineCourseResponse({
    required String id,
    required String title,
    required String slug,
    String? shortDescription,
    String? description,
    required String level,
    required String status,
    required String unlockStrategy,
    int? estimatedDurationInMinutes,
    String? thumbnailId,
    String? thumbnailUrl,
    String? createdById,
    String? createdByName,
    @Default([]) List<OnlineCourseModuleResponse> modules,
  }) = _OnlineCourseResponse;

  factory OnlineCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$OnlineCourseResponseFromJson(json);
}
