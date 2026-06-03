import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_response.freezed.dart';
part 'schedule_response.g.dart';

@freezed
class ScheduleResponse with _$ScheduleResponse {
  const factory ScheduleResponse({
    required String id,
    required String groupId,
    required String groupName,
    required String dayOfWeek,
    required String startTime,
    required String endTime,
  }) = _ScheduleResponse;

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);
}
