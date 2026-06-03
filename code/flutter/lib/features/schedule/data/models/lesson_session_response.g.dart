// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonSessionResponseImpl _$$LessonSessionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$LessonSessionResponseImpl(
  id: json['id'] as String,
  groupId: json['groupId'] as String,
  groupName: json['groupName'] as String,
  lessonId: json['lessonId'] as String,
  lessonTitle: json['lessonTitle'] as String,
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$$LessonSessionResponseImplToJson(
  _$LessonSessionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'groupId': instance.groupId,
  'groupName': instance.groupName,
  'lessonId': instance.lessonId,
  'lessonTitle': instance.lessonTitle,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'status': instance.status,
};
