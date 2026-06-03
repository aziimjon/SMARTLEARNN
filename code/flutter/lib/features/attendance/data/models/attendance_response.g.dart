// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceResponseImpl _$$AttendanceResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AttendanceResponseImpl(
  id: json['id'] as String,
  studentId: json['studentId'] as String,
  studentProfileId: json['studentProfileId'] as String?,
  studentFullName: json['studentFullName'] as String?,
  lessonSessionId: json['lessonSessionId'] as String,
  groupId: json['groupId'] as String,
  groupName: json['groupName'] as String,
  lessonId: json['lessonId'] as String,
  lessonTitle: json['lessonTitle'] as String,
  lessonStartTime: json['lessonStartTime'] as String,
  lessonEndTime: json['lessonEndTime'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$$AttendanceResponseImplToJson(
  _$AttendanceResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'studentId': instance.studentId,
  'studentProfileId': instance.studentProfileId,
  'studentFullName': instance.studentFullName,
  'lessonSessionId': instance.lessonSessionId,
  'groupId': instance.groupId,
  'groupName': instance.groupName,
  'lessonId': instance.lessonId,
  'lessonTitle': instance.lessonTitle,
  'lessonStartTime': instance.lessonStartTime,
  'lessonEndTime': instance.lessonEndTime,
  'status': instance.status,
};
