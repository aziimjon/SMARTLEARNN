// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_course_progress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnlineCourseProgressResponseImpl _$$OnlineCourseProgressResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OnlineCourseProgressResponseImpl(
  id: json['id'] as String,
  enrollmentId: json['enrollmentId'] as String,
  contentId: json['contentId'] as String,
  title: json['title'] as String?,
  status: json['status'] as String,
  lastPositionInSeconds: (json['lastPositionInSeconds'] as num?)?.toInt(),
  openedAt: json['openedAt'] as String?,
  startedAt: json['startedAt'] as String?,
  completedAt: json['completedAt'] as String?,
);

Map<String, dynamic> _$$OnlineCourseProgressResponseImplToJson(
  _$OnlineCourseProgressResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'enrollmentId': instance.enrollmentId,
  'contentId': instance.contentId,
  'title': instance.title,
  'status': instance.status,
  'lastPositionInSeconds': instance.lastPositionInSeconds,
  'openedAt': instance.openedAt,
  'startedAt': instance.startedAt,
  'completedAt': instance.completedAt,
};
