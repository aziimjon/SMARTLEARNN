import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_course_summary_response.freezed.dart';
part 'online_course_summary_response.g.dart';

@freezed
class OnlineCourseSummaryResponse with _$OnlineCourseSummaryResponse {
  const factory OnlineCourseSummaryResponse({
    required String id,
    required String title,
    required String slug,
    String? shortDescription,
    required String level,
    required String status,
    required String unlockStrategy,
    int? estimatedDurationInMinutes,
    String? thumbnailId,
    String? thumbnailUrl,
  }) = _OnlineCourseSummaryResponse;

  factory OnlineCourseSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$OnlineCourseSummaryResponseFromJson(json);
}
